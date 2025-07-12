## **ROS2_Learning**

### chapt2: 

- 单结点、WorkSpace、功能包
- cpp:共享指针、lambda、Auto
- cpp & py:多线程、Http

### chapt3:

#### topic_ws

- py:Http多线程下载后Publish小说至novel topic，Subscribe topic后语音播放
- cpp:Publish Twist type至/turtle1/cmd_vel，turtlesim进行订阅后运动
- cpp:Subscribe turtlesim Pubilish的/turtle1/pose(位姿)，同时Pubish /turtle1/cmd_vel进行闭环位姿控制

#### topic_practice_ws

- cpp:rosidl_default_generators自定义msg type:SystemStatus，builtin_interfaces提供Time stamp
- python:导入前面定义的SystemStatus，使用定时器1Hz回调进行状态更新，绑定至msg后Publish为sys_status topic
- cpp:rqt订阅sys_status topic，topic更新即回调函数，转化为qt gui，双线程分别处理qt的exec和node的spin两个阻塞函数；非ros组件正常使用CMake的target_link_libraries语句链接即可，ament_cmake是cmake的超集，向下兼容
