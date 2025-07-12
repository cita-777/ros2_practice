// first learn！
#include "geometry_msgs/msg/twist.hpp"
// 1. 几何消息 (geometry_msgs)
// 2. 标准消息 (std_msgs)
// 3. 传感器消息 (sensor_msgs)
// 4. 导航消息 (nav_msgs)
// 5. 可视化消息 (visualization_msgs)
// 6. 动作消息 (action_msgs)
// 7. 服务消息 (service_msgs)
// 8. 行为树消息 (behavior_tree_msgs)
// 9. 自定义消息 (custom_msgs)
// 通过ros2 interface list命令查看所有消息类型
// ros2 interface show geometry_msgs/msg/Twist查看特定消息的结构
#include "rclcpp/rclcpp.hpp"
#include <chrono>   // 引入时间cpp库
// require be cpp14+ 使用时间单位的字面量，可以在代码中使用 s 和 ms 表示时间
using namespace std::chrono_literals;

class TurtleCircle : public rclcpp::Node
{
private:
    rclcpp::TimerBase::SharedPtr                            timer_;       // 定时器智能指针
    rclcpp::Publisher<geometry_msgs::msg::Twist>::SharedPtr publisher_;   // 发布者智能指针

public:
    explicit TurtleCircle(const std::string& node_name)
        : Node(node_name)   // 构造函数被标记为 explicit 时，编译器不会自动使用该构造函数进行隐式类型转换
    {
        // 调用继承而来的父类函数创建订阅者
        publisher_ = this->create_publisher<geometry_msgs::msg::Twist>("/turtle1/cmd_vel", 10);
        // 调用继承而来的父类函数创建定时器
        timer_ = this->create_wall_timer(1000ms, std::bind(&TurtleCircle::timer_callback, this));
        // chrono的1000ms！
    }

private:
    void timer_callback()
    {
        auto msg      = geometry_msgs::msg::Twist();
        msg.linear.x  = 1.14514;   // 设置线速度
        msg.angular.z = 0.5;       // 设置角速度
        publisher_->publish(msg);
    }
};

int main(int argc, char* argv[])
{
    rclcpp::init(argc, argv);
    auto node = std::make_shared<TurtleCircle>("turtle_square");
    rclcpp::spin(node);
    rclcpp::shutdown();
    return 0;
}
