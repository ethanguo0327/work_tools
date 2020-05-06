#! /bin/zsh
roslaunch /home/ethan/catkin_ws/src/gaussian_mapping_v5/v5_configuration_files/launch/3d_v4_ouster.launch &
sleep 2
#roslaunch /home/ethan/ouster_ws/src/ouster_example/ouster_ros/os1.launch replay:=true os1_hostname:=10.5.5.91 &
roslaunch oustertfs.launch &
#sleep 1
rqt_console &
sleep 0.5
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service init
sleep 1
/home/ethan/Documents/Gaussian_src/mapping_bridge/bazel-bin/test_v4_service start 
sleep 0.5 &
#rosrun tf static_transform_publisher 0.382 0 0 0 0 0 1  base_link os1_lidar 10 
#rosrun tf static_transform_publisher 0 0 0 0 0 0 1  base_odom base_link 10
#rosrun tf static_transform_publisher 0 0 0 0 0 0 1  os1_sensor os1_lidar 10
#rosrun tf static_transform_publisher 0.34  0.03 0 0 0 0.025 1  base_link camera_link 10 
#rosbag play $1 --clock --pause $2 $3
