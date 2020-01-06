#! /bin/bash
roslaunch /media/ethan/gyq7/issues/work_tools/map_server.launch map_path:=$(pwd)/$4 &
rviz -d ~/catkin_ws/src/gaussian_mapping_v5/v5_configuration_files/demo_2d.rviz &
sleep 0.5 &
rqt_console &
sleep 0.5 &
#rosrun tf static_transform_publisher 0.22 0 0 0 0 0 1 base_link base_laser 10 &
#rosrun tf static_transform_publisher 0 0 0 0 0 0 1 base_footprint base_link 10 &
rosbag play $1 $2 $3  --clock --pause   #bag name, -s ,-r   

