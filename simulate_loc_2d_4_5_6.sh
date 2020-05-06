#! /bin/zsh
roslaunch /home/ethan/Documents/Gaussian_src/localization_build/launch/test_4_5_6.launch & 
sleep 2
rviz -d /home/ethan/.rviz/loc.rviz &
sleep 1
rosrun tf static_transform_publisher 0.227 0 0 0 0 0 1 base_link base_laser 10 &
sleep 0.5
rqt_console &
sleep 2
/home/ethan/Documents/Gaussian_src/localization_4_5_6/bazel-bin/test_localization_service init 
/home/ethan/Documents/Gaussian_src/localization_4_5_6/bazel-bin/test_localization_service start 
sleep 2
roslaunch /media/ethan/gyq7/issues/work_tools/map_server.launch map_path:=$(pwd)/$4 &
rosbag play $1 --clock --pause $2 $3
