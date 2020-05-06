#!/bin/bash
#test.cpp
filename_test="/home/ethan/Documents/Gaussian_src/localization_build/test/test_localization_service.cpp"
str_test=.*srv.request.storage_path.*
current=$(echo $PWD | sed 's_/_\\/_g')
newstr="    srv.request.storage_path\=\"\ $current/map/\"\;"
sed -i "s=$str_test=$newstr=" $filename_test

#BUILD
filename_BUILD="/home/ethan/Documents/Gaussian_src/localization_build/BUILD"
str_BUILD_1=.*LASER_VERIFY_KEY.*
str_BUILD_2=.*TEST_INITIALIZE.*
new_str1="         \# \"LASER_VERIFY_KEY\=c636d97c70481dbbfbf9239f29ff3cbb\"\,"
new_str2="         \"TEST_INITIALIZE\"\,"
sed -i "s=$str_BUILD_1=$new_str1=" $filename_BUILD
sed -i "s=$str_BUILD_2=$new_str2=" $filename_BUILD

#build.sh
filename_build="/home/ethan/Documents/Gaussian_src/localization_build/build.sh"
sed -i 's/build \/\/\:all/build \/\/\:all \-\-jobs 5/g' $filename_build

#test50.launch
filename_launch="/home/ethan/Documents/Gaussian_src/localization_build/launch/test_50.launch"
str_launch=.*P78.*
newstr_launch=" "
sed -i "s=$str_launch=$newstr_launch=" $filename_launch 
str_rviz=.*rviz.*
sed -i "s=$str_rviz=$newstr_launch=" $filename_launch 
str_strategy=.*strategy.*
sed -i "s=$str_strategy=$newstr_launch=" $filename_launch 
str_republish_camera=.*republish_camera.*
sed -i "s=$str_republish_camera=$newstr_launch=" $filename_launch &

#filter bags
./gmapping_filter.bash $1 &
cd /home/ethan/Documents/Gaussian_src/localization_build
./build.sh release_kinetic
