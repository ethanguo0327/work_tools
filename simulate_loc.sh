#! /bin/zsh
roslaunch /home/ethan/Documents/Gaussian_src/localization_build/launch/test_50.launch & 
sleep 2
rviz -d /home/ethan/.rviz/loc.rviz &
sleep 1
rqt_console &
sleep 2
/home/ethan/Documents/Gaussian_src/localization_build/bazel-bin/test_localization_service init 
/home/ethan/Documents/Gaussian_src/localization_build/bazel-bin/test_localization_service start 
sleep 2
roslaunch map_server.launch map_path:=$(pwd) &
rosbag play $1 --clock --pause $2 $3
