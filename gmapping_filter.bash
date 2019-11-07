#!/bin/bash

name=$1
rosbag filter $name ${name}_filtered.bag 'topic == "/device/operational_device_status" or topic == "/gps" or topic == "/odom" or topic == "/device/rfid" or topic == "/device/gyro" or topic == "/scan" or topic == "/rgb_image_hd" or topic == "/scan_2" or topic == "/initialpose_moving" or topic == "/initialpose" or topic == "/initialpose_current" or (topic == "/tf" and m.transforms[0].header.frame_id != "world")'
