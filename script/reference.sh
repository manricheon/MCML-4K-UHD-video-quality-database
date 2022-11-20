#!/bin/bash

# create directory
cur_dir=$(pwd)
echo "current dir:" $cur_dir
dataset_dir=$cur_dir/"dataset"
dir_codec=$dataset_dir/"Ref"
mkdir -p $dir_codec

# download encoded video sequences from server
root_url="http://mcml.yonsei.ac.kr/files/dataset/4kuhdvideo/"


wget http://mcml.yonsei.ac.kr/files/dataset/4kuhdvideo/mcml_4kuhdquality_subjectivescore.xlsx

for seq_num in 0{1..10}
do
    if [ ${seq_num} = 010 ]
    then
        file_url=${root_url}/ref/"S"${seq_num:1}_R_00_00.yuv
    else
        file_url=${root_url}/ref/"S"${seq_num}_R_00_00.yuv
    fi
    wget -P ${dir_codec} ${file_url}
done

