#! /bin/zsh
roslaunch /home/ethan/catkin_ws/src/gaussian_mapping_v5/v5_configuration_files/launch/2d_v4.launch & 
sleep 2
rqt_console &
sleep 0.5
/home/ethan/Documents/Gaussian_src/mapbrg/mapping_bridge_t1_4_5/output/kinetic/test_v4_service localization_init 
sleep 1
/home/ethan/Documents/Gaussian_src/mapbrg/mapping_bridge_t1_4_5/output/kinetic/test_v4_service localization_start 
sleep 4
#/home/ethan/Documents/Gaussian_src/mapbrg/mapping_bridge_1/output/kinetic/test_v4_service localization_start 
sleep 0.5 &
#rosrun tf static_transform_publisher 0.340 0.000 0.766 0.003 0.057 -0.000 0.998 base_link rslidar 10 
rosrun tf static_transform_publisher 0.380 0.000 0.0 0.00 0.0 0.000 1 base_link base_laser 10 
#rosbag play $1 --clock --pause $2 $3 
