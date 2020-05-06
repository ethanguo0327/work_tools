#! /bin/zsh
roslaunch /home/ethan/catkin_ws/src/gaussian_mapping_v5/v5_configuration_files/launch/2d_v4.launch  &
sleep 2
rqt_console &
sleep 0.5
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service localization_init
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service localization_start 10
sleep 0.5
#rosrun tf static_transform_publisher 0.337 0 0 0 0 0 1 base_link base_laser 10 &
rosrun tf static_transform_publisher 0.246 -0.034 1.223 -0.002 0.088 0.004 0.996 base_link rslidar 10 
#rosbag play $1 --clock --pause $2 $3 
