#! /bin/bash
rviz -d /home/ethan/.rviz/loc.rviz &
sleep 2 &
rqt_console &
sleep 3 &
rosrun tf static_transform_publisher 0 0 0 0 0 0.7071 0.7071 base_link laser_link 10 &
rosrun tf static_transform_publisher 0.08 0 0 0 0 0 1 base_footprint base_link 10 &
roslaunch /media/ethan/gyq7/issues/work_tools/map_server_ubt.launch map_path:=$(pwd) map_name:=$4 &
rosbag play $1 $2 $3  --clock --pause   #bag name, -s ,-r   

