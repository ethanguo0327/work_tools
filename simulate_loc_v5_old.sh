#! /bin/zsh
roslaunch /home/ethan/catkin_ws/src/gaussian_mapping_v5/configuration_files/2d_v4_old.launch & 
sleep 2
rqt_console &
sleep 0.5
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service localization_init 
sleep 10
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service localization_start 
sleep 0.5
rosrun tf static_transform_publisher 0.340 0.000 0.766 0.003 0.057 -0.000 0.998 base_link rslidar 10 &
rosbag play $1 --clock --pause $2 $3 
