from setuptools import find_packages, setup
#glob是一个用于查找符合特定规则的文件路径的模块，此处寻找launch使用
from glob import glob
package_name = 'demo_python_service'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name+"/resource", ['resource/default.jpg','resource/test1.jpg']),
        # 将launch目录下的所有.launch.py文件复制到安装目录的share/demo_python_service/launch目录下
        # 这样在运行launch文件时，ROS2才能找到对应的launch文件
        # glob('launch/*.launch.py')会返回所有匹配的文件路径
        ('share/' + package_name+'/launch', glob('launch/*.launch.py')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='mzebra',
    maintainer_email='mzebra@foxmail.com',
    description='TODO: Package description',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'learn_face_detect=demo_python_service.learn_face_detect:main',
            'face_detect_node=demo_python_service.face_detect_node:main',
            'face_detect_client_node=demo_python_service.face_detect_client_node:main',
        ],
    },
)
