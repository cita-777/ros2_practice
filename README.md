## **ROS2_Learning**

### chapt2: 基础

- 单结点、WorkSpace、功能包
- cpp:共享指针、lambda、Auto
- cpp & py:多线程、Http

### chapt3:话题与结点

#### topic_ws

- py:Http多线程下载后Publish小说至novel topic，Subscribe topic后语音播放
- cpp:Publish Twist type(接口)至/turtle1/cmd_vel（名称），turtlesim进行订阅后运动
- cpp:Subscribe turtlesim Pubilish的/turtle1/pose(位姿)，同时Pubish /turtle1/cmd_vel进行闭环位姿控制

#### topic_practice_ws

- cpp:rosidl_default_generators自定义msg type:SystemStatus(接口)，builtin_interfaces提供Time stamp
- py:导入前面定义的SystemStatus，使用定时器1Hz回调进行状态更新，绑定至msg后Publish为sys_status(名称)topic
- cpp:rqt订阅sys_status topic，topic更新即回调函数，转化为qt gui，双线程分别处理qt的exec和node的spin两个阻塞函数；非ros组件正常使用CMake的target_link_libraries语句链接即可，ament_cmake是cmake的超集，向下兼容

### chapt4:服务

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

### chapt5:提供的实用工具

- tf(坐标变换)、rqt可视化、rviz可视化与bag(捕获)
- py:tf本质是话题实现的广播；导入tf_ros用于发布广播，geometry_msgs提供发布坐标变换所需的消息接口，tf_transformations提供姿态转换相关函数[SO(3)的的旋转矩阵、欧拉角、四元数转换等]；先创建StaticTransformBroadcaster对象，再创建消息接口TransformStamped对象给其赋值，最后Sendransform发布静态坐标变换，动态同理，只不过加了定时器100Hz发布动态tf；监听部分，导入TransformListener类订阅TF数据，Buffer类存储TF数据帧；将Bufeer传递给TransformListener监听；用1Hz定时器调用lookup_transform查询TF变换。
- cpp:实现功能和py基本一致，例子换成地图坐标系变换而非py的手眼标定
- rqt:查看TF Tree等功能
- rviz:可视化TF坐标之间的关系，比rqt更直接了
- bag:捕获/turtle1/cmd_vel话题进行录制，保存到本地后可以回放，慢放、暂停等操作，从而实现复现与分析

### chapt6:URDF及其进阶、Gazebo仿真与ros2_control控制框架

* urdf:用 `<link>`定义机器人部件（如 `base_link`、`wheel_link`），`<joint>`描述连接关系，通过 `<xacro:include>`复用宏定义和参数化设计：`<xacro:property name="wheel_radius" value="0.033"/>,调用common_inertia.xacro定义各部件的惯性矩阵（ixx、iyy、izz）`
* gazebo:首先加载世界文件[custom_room.world]()，包含墙壁和障碍物的仿真环境，通过[model](javascript:void(0))标签加载房间结构。然后生成机器人实体 `spawn_entity.py`，最后启动控制器 `ros2_control_node`
* ros2_control:硬件接口：[fishbot_ros2_controller.yaml中定义 `diff_drive_controller`差速控制器（轮距0.17m、半径0.032m），`joint_state_broadcaster`广播关节状态。URDF中通过 `<ros2_control>`标签声明 `GazeboSystem`插件，关联 `left_wheel_joint`/`right_wheel_joint`的 `velocity`/`effort`接口。通过 `<remapping>`将控制器输入映射到 `/cmd_vel`话题，里程计输出映射到 `/odom`话题。](javascript:void(0))

### chapt7:slam toolbox与Navigation2

- slam:使用 `slam_toolbox`包实现在线建图，通过激光雷达数据与里程计融合生成2D地图。
- nav2:默认使用 `GridBased`全局规划器，通过[custom_planner_plugin.xml]()可替换为自定义规划器。 `dwb_controller`局部规划器实时避障并跟踪路径，配置最大速度、加速度限制。行为服务器支持 `spin`（原地旋转）、`backup`（后退）、`wait`（等待）等恢复行为。[nav2_params.yaml]()设置代价地图参数（静态层、传感器源）、行为树BT插件列表。
- 基于navigation2的自动巡检:通过[patrol_config.yaml]()定义目标点坐标（x, y, yaw），[patrol_node.py]()读取参数并循环导航。到达目标点后调用[SpeachText]()服务播放语音，通过 `ImageSaver`保存摄像头图像。使用 `navigate_to_pose_action_bt_node`触发导航任务，结合 `wait_at_waypoint`实现停留逻辑。

### chapt8:pluginlib、自定义规划器与控制器

- pluginlib:利用ROS2的 `pluginlib`实现动态加载插件，通过 `nav2_core`接口定义扩展点。`nav2_custom_planner.xml`和[nav2_custom_controller.xml]()中通过 `<class>`注册插件名称与类型。自定义规划器继承 `nav2_core::GlobalPlanner`，控制器继承 `nav2_core::Controller`，重写虚方法。
- custom_planner:[createPlan]()方法根据起始点和目标点，通过线性插值生成路径点，分辨率由 `interpolation_resolution`控制。调用 `costmap_->worldToMap`检查路径点是否在代价地图中为致命障碍物，若存在则抛出异常。[nav2_params.yaml]()中 `planner_plugins`配置为 `nav2_custom_planner/CustomPlanner`，通过 `interpolation_resolution`参数调整路径平滑度。
- custom_controller:[computeVelocityCommands]()方法计算最近目标点，根据角度差决定直行（线速度[max_linear_speed_]()）或旋转（角速度[max_angular_speed_]()）。控制器参数 `max_linear_speed`/`max_angular_speed`通过 `declare_parameter_if_not_declared`声明，支持运行时动态修改。[activate()]()/[deactivate()]()方法仅仅输出日志，[cleanup()]()释放资源。[nav2_params.yaml]()中 `controller_plugins`配置为 `nav2_custom_controller::CustomController`，并关联参数（如最大速度）。
- 插件集成:[CMakeLists.txt]()通过 `ament_export_libraries`导出插件库，[package.xml]()依赖 `nav2_core`和 `pluginlib`。`nav2_custom_planner.xml`和[nav2_custom_controller.xml]()中通过 `<nav2_core plugin="...">`声明插件路径。通过 `pluginlib::ClassLoader`动态加载插件库(libxxx.so)，确保运行时可替换规划器/控制器实现。

### chapt10:
