#! /bin/zsh
roslaunch /home/ethan/catkin_ws/src/gaussian_mapping_v5/v5_configuration_files/launch/3d_v4.launch &
sleep 2
rqt_console &
sleep 0.5
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service init
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service start 
sleep 0.5
rosrun tf static_transform_publisher 0.382 0    0 0 0 0     1  base_link base_laser 10 &
rosrun tf static_transform_publisher 0.34  0.03 0 0 0 0.025 1  base_link camera_link 10 
#rosbag play $1 --clock --pause $2 $3
