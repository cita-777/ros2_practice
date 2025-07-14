import rclpy
from rclpy.node import Node
# TransformListener 类用于订阅和监听 TF 坐标变换
# Buffer 类用于存储TF数据帧
from tf2_ros import TransformListener, Buffer
from tf_transformations import euler_from_quaternion


class TFListener(Node):

    def __init__(self):
        super().__init__("tf2_listener")
        self.buffer_ = Buffer()
        self.listener_ = TransformListener(self.buffer_, self)
        self.timer_ = self.create_timer(1, self.get_transform)

    def get_transform(self):
        try:
            # param1: "base_link" - 目标坐标系
            # param2: "bottle_link" - 源坐标系
            # param3: rclpy.time.Time(seconds=0) - 查询哪一时刻的TF，seconds=0表示查询最新的TF
            # param4: rclpy.time.Duration(seconds=1) - 等待时间
            # 返回的 result 包含了目标坐标系相对于源坐标系的变换信息
            # 注意：如果没有找到对应的变换，lookup_transform会抛出异常，尝试捕获即可
            result = self.buffer_.lookup_transform("base_link", "bottle_link", rclpy.time.Time(seconds=0), rclpy.time.Duration(seconds=1))
            transform = result.transform
            rotation_euler = euler_from_quaternion([
                transform.rotation.x,
                transform.rotation.y,
                transform.rotation.z,
                transform.rotation.w
            ])
            self.get_logger().warn(f"平移:{transform.translation},旋转四元数:{transform.rotation}:旋转欧拉角:{rotation_euler}")
        except Exception as e:
            self.get_logger().error(f"不能够获取坐标变换，原因: {str(e)}")


def main():
    rclpy.init()
    node = TFListener()
    rclpy.spin(node)
    rclpy.shutdown()
