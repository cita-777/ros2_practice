## **ROS2_Learning**

### chapt2: 

- 单结点、WorkSpace、功能包
- cpp:共享指针、lambda、Auto
- cpp & py:多线程、Http

### chapt3:

#### topic_ws

- py:Http多线程下载后Publish小说至novel topic，Subscribe topic后语音播放
- cpp:Publish Twist type(接口)至/turtle1/cmd_vel（名称），turtlesim进行订阅后运动
- cpp:Subscribe turtlesim Pubilish的/turtle1/pose(位姿)，同时Pubish /turtle1/cmd_vel进行闭环位姿控制

#### topic_practice_ws

- cpp:rosidl_default_generators自定义msg type:SystemStatus(接口)，builtin_interfaces提供Time stamp
- py:导入前面定义的SystemStatus，使用定时器1Hz回调进行状态更新，绑定至msg后Publish为sys_status(名称)topic
- cpp:rqt订阅sys_status topic，topic更新即回调函数，转化为qt gui，双线程分别处理qt的exec和node的spin两个阻塞函数；非ros组件正常使用CMake的target_link_libraries语句链接即可，ament_cmake是cmake的超集，向下兼容

### chapt4:
- service(服务)与param(参数)与launch(启动文件)
- param基于service实现，本质是同源的，service是基于Request和Response的双向通讯机制，这是和前面基于发布-订阅制的单向通讯的topic的区分点
- topic自定义.msg消息接口，而service自定义.srv服务接口
- cpp:rosidl_default_generators自定义srv接口: FaceDetector
- py:导入前面定义的FaceDetector，sensor_msgs提供ROS2中通讯使用的Image格式，ROS2提供cv_bridge在ROS2和OpenCV图像格式快速转换；先creat_service传入消息接口、服务名称以及处理Request的回调函数；回调函数的参数是request和response，通过return返回处置结果
- py:模拟客户端，将图片放置于resource下，在setup.py的data_files参数中进行注册；对应的，先creat_client传入接口类型和服务名称；构造继承于node来的Request对象传入转化成ROS2通讯格式后的Image消息格式；调用client.call_async发送异步请求，返回Future类型对象用于检测进度和请求结果；最后调用rclpy.spin_until_future_complete而不是在主函数中使用rclpy.spin了，这样请求完成后就能自动退出；
- cpp:rosidl_default_generators自定义srv接口: Patrol(海龟巡逻)
- cpp:综合前面的内容，同样先creat_service,与此同时还Subscribe turtlesim Pubilish的/turtle1/pose(位姿)，同时Pubish /turtle1/cmd_vel用于进行闭环位姿控制
- cpp:模拟客户端，开0.1Hz的定时器；wait_for_service若返回服务器端有效，则构造Request对象后调用async_send_request发送异步请求，cpp中async_send_request参数是Request对象的共享指针和处理完成后的回调函数，回调函数的参数是SharedFuture类型对象，同样可以利用其获得异步处理的结果。
- 各个node间参数的声明、设置、订阅比较简单，略
- launch:支持python、xml、yaml，采用python写，格式类似setup.py；需要注意的是：将 launch 目录复制到 install 目录中对应功能包的 share 目录下,ROS2才能找到它；cpp修改cmake实现，py修改setup实现即可；launch支持传递参数等高阶功能

### chapt5:
