import math
import rclpy
from rclpy.node import Node
# Import static transform broadcaster for publishing static transforms
from tf2_ros import StaticTransformBroadcaster
# Import TransformStamped for defining the static transform
from geometry_msgs.msg import TransformStamped
# Import quaternion_from_euler for converting Euler angles to quaternion
from tf_transformations import quaternion_from_euler


class StaticTFBroadcaster(Node):

    def __init__(self):
        super().__init__('static_tf2_broadcaster')
        # create a StaticTransformBroadcaster instance
        self.static_broadcaster_ = StaticTransformBroadcaster(self)
        
        self.publish_static_tf()

    def publish_static_tf(self):
        # 创建消息接口 TransformStamped 对象 transform
        transform = TransformStamped()
        transform.header.stamp = self.get_clock().now().to_msg()
        transform.header.frame_id = "base_link"
        transform.child_frame_id = "camera_link"
        transform.transform.translation.x = 0.5
        transform.transform.translation.y = 0.3
        transform.transform.translation.z = 0.6
        # 欧拉角转四元数
        rotation_quat = quaternion_from_euler(math.radians(180), 0, 0)
        transform.transform.rotation.x = rotation_quat[0]
        transform.transform.rotation.y = rotation_quat[1]
        transform.transform.rotation.z = rotation_quat[2]
        transform.transform.rotation.w = rotation_quat[3]
      	# 发布静态坐标变换
        # 静态坐标变换只需要发布一次
        self.static_broadcaster_.sendTransform(transform)
        self.get_logger().warn(f"发布 TF:{transform}")


def main():
    rclpy.init()
    static_tf_broadcaster = StaticTFBroadcaster()
    rclpy.spin(static_tf_broadcaster)
    rclpy.shutdown()
