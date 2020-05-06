#! /bin/zsh
roslaunch /home/ethan/Documents/Gaussian_src/localization/launch/test_50.launch & 
sleep 2
rviz -d /home/ethan/.rviz/loc.rviz &
sleep 1
rosrun tf static_transform_publisher 0.08 0 0 0 0 0 1 base_footprint base_link 10 &
rosrun tf static_transform_publisher 0 0 0 0 0 0.7071 0.7071 base_link laser_link 10 &
sleep 0.5
rqt_console &
sleep 2
/home/ethan/Documents/Gaussian_src/localization_1804/localization/bazel-bin/test_localization_service init 
/home/ethan/Documents/Gaussian_src/localization_1804/localization/bazel-bin/test_localization_service start 
sleep 2
roslaunch /media/ethan/gyq7/issues/work_tools/map_server_ubt.launch map_path:=$(pwd) map_name:=$4 &
rosbag play $1 --clock --pause $2 $3
