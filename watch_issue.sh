#! /bin/bash
rviz -d /home/ethan/.rviz/loc.rviz &
sleep 2 &
rqt_console &
sleep 3 &
#rosrun tf static_transform_publisher 0.22 0 0 0 0 0 1 base_link base_laser 10 &
#rosrun tf static_transform_publisher 0 0 0 0 0 0 1 base_footprint base_link 10 &
roslaunch /media/ethan/LENOVO_USB_HDD/issues/tools/map_server.launch map_path:=$(pwd) map_name:=$4 &
rosbag play $1 $2 $3  --clock --pause   #bag name, -s ,-r   

