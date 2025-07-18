#include <memory>
#include "geometry_msgs/msg/transform_stamped.hpp" // 提供消息接口
#include "rclcpp/rclcpp.hpp"
#include "tf2/LinearMath/Quaternion.h"             // 提供 tf2::Quaternion 类
#include "tf2_geometry_msgs/tf2_geometry_msgs.hpp" // 提供消息类型转换函数
#include "tf2_ros/transform_broadcaster.h"         // 提供坐标广播器类
#include <chrono>                                  // 引入时间相关头文件
// 使用时间单位的字面量，可以在代码中使用 s 和 ms 表示时间
using namespace std::chrono_literals;

class DynamicTFBroadcaster : public rclcpp::Node
{
public:
  DynamicTFBroadcaster() : Node("dynamic_tf_broadcaster")
  {
    // 创建一个 TransformBroadcaster 对象，用于发布坐标变换
    tf_broadcaster_ = std::make_shared<tf2_ros::TransformBroadcaster>(this);
    // 创建一个定时器，每10毫秒调用一次 publishTransform 方法
    timer_ = create_wall_timer(10ms, std::bind(&DynamicTFBroadcaster::publishTransform, this));
  }

  void publishTransform()
  {
    // 创建一个 TransformStamped 消息对象
    geometry_msgs::msg::TransformStamped transform;
    // 设置消息的各个字段
    transform.header.stamp = this->get_clock()->now();
    transform.header.frame_id = "map";
    transform.child_frame_id = "base_link";
    // 设置变换的平移和旋转部分
    transform.transform.translation.x = 2.0;
    transform.transform.translation.y = 3.0;
    transform.transform.translation.z = 0.0;
    // 使用 tf2::Quaternion 类来设置旋转部分
    // 这里使用欧拉角 (roll, pitch, yaw) 的方式设置旋转
    // 通过 tf2::toMsg 函数将 tf2::Quaternion 转换为消息接口类型
    // 这样可以直接将四元数转换为 geometry_msgs::msg::Quaternion 类型
    tf2::Quaternion quat;
    //RPY（roll, pitch, yaw）
    quat.setRPY(0, 0, 30 * M_PI / 180);              // 弧度制欧拉角转四元数
    transform.transform.rotation = tf2::toMsg(quat); // 转成消息接口类型
    tf_broadcaster_->sendTransform(transform);
  }

private:
  // 成员变量：TransformBroadcaster 和定时器
  // TransformBroadcaster 类用于发布坐标变换
  std::shared_ptr<tf2_ros::TransformBroadcaster> tf_broadcaster_;
  rclcpp::TimerBase::SharedPtr timer_;
};

int main(int argc, char **argv)
{
  rclcpp::init(argc, argv);
  auto node = std::make_shared<DynamicTFBroadcaster>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
