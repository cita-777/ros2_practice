#include <QApplication>
#include <QLabel>
#include <QString>
#include "rclcpp/rclcpp.hpp"
#include "status_interfaces/msg/system_status.hpp"

//使用别名来简化代码
using SystemStatus = status_interfaces::msg::SystemStatus;

class SysStatusDisplay : public rclcpp::Node {
 public:
  SysStatusDisplay() : Node("sys_status_display") {
    // 使用成员函数作为回调处理订阅的消息，lambda可读性太差
    subscription_ = this->create_subscription<SystemStatus>(
        "sys_status", 10, std::bind(&SysStatusDisplay::status_callback, this, std::placeholders::_1));//"sys_status"是前面发布的topic
    // 创建一个空的 SystemStatus 对象，转化成 QString 进行显示
    label_ = new QLabel(get_qstr_from_msg(std::make_shared<SystemStatus>()));
    label_->show();
  }

  void status_callback(const SystemStatus::SharedPtr msg) 
  {
    label_->setText(get_qstr_from_msg(msg));
  }
QString get_qstr_from_msg(const SystemStatus::SharedPtr msg) {
    std::stringstream show_str;
    show_str
        << "===========系统状态可视化显示工具============\n"
        << "数 据 时 间:\t" << msg->stamp.sec << "\ts\n"
        << "用  户  名:\t" << msg->host_name << "\t\n"
        << "CPU使用率:\t" << msg->cpu_percent << "\t%\n"
        << "内存使用率:\t" << msg->memory_percent << "\t%\n"
        << "内存总大小:\t" << msg->memory_total << "\tMB\n"
        << "剩余有效内存:\t" << msg->memory_available << "\tMB\n"
        << "网络发送量:\t" << msg->net_sent << "\tMB\n"
        << "网络接收量:\t" << msg->net_recv << "\tMB\n"
        << "==========================================";

    return QString::fromStdString(show_str.str());
  }


 private:
  rclcpp::Subscription<SystemStatus>::SharedPtr subscription_;
  QLabel* label_;
};


int main(int argc, char* argv[]) {
  rclcpp::init(argc, argv);
  QApplication app(argc, argv);
  // 共享指针创建一个SysStatusDisplay节点实例，并在新线程中运行rclcpp::spin
  auto node = std::make_shared<SysStatusDisplay>();
  auto spin_func = [](std::shared_ptr<SysStatusDisplay> n) { rclcpp::spin(n); };
  std::thread spin_thread(spin_func, node);
  // 分离线程，允许它在后台运行
  spin_thread.detach();
  //主线程运行QApplication的事件循环
  app.exec();
  rclcpp::shutdown();
  return 0;
}
