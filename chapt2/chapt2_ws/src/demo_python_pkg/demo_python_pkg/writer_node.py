from demo_python_pkg.person_node import PersonNode
import rclpy
class WriterNode(PersonNode):
    def __init__(self, name: str, age: int, book: str) -> None:
        super().__init__('WriterNode', name, age)
        print('WriterNode 的 __init__ 函数被调用了')
        self.book = book
    def read(self):
        self.get_logger().info(f'我叫{self.name},今年{self.age}岁，我正在阅读我的书《{self.book}》')

def main():
    rclpy.init()
    node = WriterNode('法外狂徒张三', 18, '论快速入狱')
    node.eat('鱼香肉丝')
    node.read()
    rclpy.shutdown()
