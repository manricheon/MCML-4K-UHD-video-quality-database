#!/bin/bash

# create directory
cur_dir=$(pwd)
echo "current dir:" $cur_dir
dataset_dir=$cur_dir/"dataset"
dir_codec=$dataset_dir/"AVC"
mkdir -p $dir_codec

# download encoded video sequences from server
root_url="http://mcml.yonsei.ac.kr/files/dataset/4kuhdvideo/"
codec_type="AVC"

for seq_num in 0{1..10}
do
    if [ ${seq_num} = 010 ]
    then
        file_url=${root_url}"S"${seq_num:1}_${codec_type}"_enc.zip"
    else
        file_url=${root_url}"S"${seq_num}_${codec_type}"_enc.zip"
    fi
    wget -P ${dir_codec} ${file_url}
    unzip ${dir_codec}/"S"${seq_num}_${codec_type}"_enc.zip" -d ${dir_codec}/"S"${seq_num}
done

# decode (and resize) video sequence using ffmpeg 
for seq_num in 0{1..10}
do
    for res_type in 0{1..2}
    do
        for dst_type in 0{1..4}
        do

            if [ ${seq_num} = 010 ]
            then
                file_path=${dir_codec}/"S"${seq_num:1}/"S"${seq_num}_H_${res_type}_${dst_type}
            else
                file_path=${dir_codec}/"S"${seq_num}/"S"${seq_num}_H_${res_type}_${dst_type}
            fi
            echo ${file_path}

            if [ ${res_type} == 01 ]
            then
                ffmpeg -i ${file_path}.bin ${file_path}_temp.yuv
                ffmpeg -s hd1080 -r 30 -i ${file_path}_temp.yuv -vcodec rawvideo -sws_flags lanczos -s 3840x2160 -r 30 ${file_path}.yuv
                rm ${file_path}_temp.yuv
            else
                ffmpeg -i ${file_path}.bin ${file_path}.yuv
            fi

        done
    done
done