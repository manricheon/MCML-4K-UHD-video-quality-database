# MCML 4K UHD video quality database


## Introduction
We present a subjective quality assessment of compressed 4K ultra-high-definition (UHD) videos in an immersive viewing environment. Three state-of-the-art video coding techniques, i.e., advanced video coding (AVC), high efficiency video coding (HEVC), and VP9. We aim at investigating added values of UHD over conventional high definition (HD) in terms of perceptual quality. The database includes video sequences and subjective ratings. Details of the data can be found in our paper.

- [M. Cheon and J.-S. Lee, "Subjective and objective quality assessment of compressed 4K UHD videos for immersive experience", IEEE Trans. Circuits and Systems for Video Technology, vol. 28, no. 7, pp. 1467-1480, Jul. 2018.](https://ieeexplore.ieee.org/abstract/document/7879860)

<!-- Noe that this repository is a clone of the [MCML 4K UHD video quality database](http://mcml.yonsei.ac.kr/downloads/4kuhdvideoquality) page.
However, the latest quick download links may be kept available in this repository. -->

### Download

Check your storage before downloading full database. Each .yuv file is about 5.6 GB in size...

- [Download from OneDrive](https://1drv.ms/u/s!AruYFpEm1xLPgbZpEMppacKyanfecg?e=mcapSL) (faster way)
- [Download from server](http://mcml.yonsei.ac.kr/downloads/4kuhdvideoquality)
- Donwload from server using bash script
  - Run ```bash download.sh``` in order to obtain all .yuv sequences. (10 reference + 240 distorted videos)
  - Script to download depending on the codec types can be found in script folder.
  - Script [reference.sh](/script/reference.sh) downloads 10 reference .yuv files and subjective ratings.
  - Script [avc.sh](script/avc.sh) includes the following step:
    1. Download and unzip 10 zip files. Each zip file includes 8 decoded .yuv files.
  - Scripts, [hevc.sh](script/hevc.sh) and [vp9.sh](script/vp9.sh), include the following steps:
    1. Download and unzip 10 zip files. Each zip file includes 8 encoded sequences.
    2. Decode the encoded sequences and save them in .yuv format.
    3. If needed, upscale the decoded FHD video to UHD resolution before saving.

- Note that there exists some problem decoding .264 bitstreams using ffmpeg. If you want to decode them, please refer to this [description](http://mcml.yonsei.ac.kr/files/dataset/4kuhdvideo/readme_decode.txt) and attached [zip file](http://mcml.yonsei.ac.kr/files/dataset/4kuhdvideo/decode.zip).




### Updates
    - 2022-11 : Download scripts are added.
    - 2022-11 : Faster download link is added.
    - 2020-06 : Raw scores are added.
    - 2018-11 : Description for decoding bitstreams is added.
    - 2018-10 : VP9 bitstream sequences are added.
    - 2018-09 : AVC and HEVC bitstream sequences are added.

### To Do
- [ ] Add preview of all content
- [x] Add script to download video sequences from server
- [ ] Add script to extract frames from encoded video sequence
- [ ] Add dataset class for deep learning framework (e.g., Pytorch, Tensorflow, etc.)


## Contents
- [MCML 4K UHD video quality database](#mcml-4k-uhd-video-quality-database)
  - [Introduction](#introduction)
    - [Download](#download)
    - [Updates](#updates)
    - [To Do](#to-do)
  - [Contents](#contents)
  - [Description](#description)
    - [Source videos](#source-videos)
    - [Distorted videos](#distorted-videos)
    - [Subjective ratings](#subjective-ratings)
    - [Format](#format)
  - [License \& Citation](#license--citation)
  - [Contact](#contact)


## Description
### Source videos
Ten source videos (nine recorded sequences and one selected from the open source video) were considered in database. Source video sequences were captured using a RED EPIC-M digital cinematographic camera with the RED PRO ZOOM 18-85 mm lens. The recorded raw video sequences were saved in the equipment's own format, i.e., REDCODE (.r3d) raw data, which are virtually lossless. Recording parameters (e.g., ISO, shutter speed, focal length, etc.) were carefully adjusted depending on the scene. The original videos had the 5K resolution (5120x2700 pixels) at a frame rate of 30 fps, which were cropped to the 4K UHD resolution (3840x2160).

### Distorted videos
Total 240 distorted videos were generated from 10 reference videos. The resolutions of the stimuli used in our experiments are 4K UHD and 4K UHD up-scaled from FHD, where the latter assumes watching FHD videos at the 4K UHD resolution on a 4K UHD screen. To obtain reference FHD videos having the same contents with the reference 4K UHD videos, the 4K UHD sources were down-scaled to the FHD resolution. We employed three state-of-the-art video compression methods, AVC, HEVC, and VP9. Distorted video sequences that having various quality levels (low to high quality) and bitrates (low to high bitrates) based on extensive preliminary experiments. Four quality levels wre selected for each combinations of encoding methods and resolutions. The compressed videos having the FHD resolution were up-scaled to the 4K UHD resolution.

### Subjective ratings
Subjective ratings were collected from twenty four subjects (eight females and sixteen males). Only part from start to 10 seconds was used in the experiment. The absolute category rating with hidden reference (ACR-HR) with 11 levels methodology was used. The excel table contains subjective scores.

### Format
The videos are formatted as .yuv for all codecs. The encoded bitstream sequences are formatted as .264, .bin, and .webm for AVC, HEVC, and VP9, respectively. These files are named as follows:

```(source video)_(codec type)_(resolution type)_(distortion level)```

- Source video : S01 to S10 (Park, Lake, Basketball, Flowers, Construction, Maples, Dolls, Bunny, Crowd, and Characters)
- Codec type : A (AVC), H (HEVC), and V (VP9)
- Resolution type
  - Video sequences: 01 (4K UHD up-scaled from FHD) and 02 (4K UHD)
  - Bitstream sequences : 01 (FHD) and 02 (4K UHD)
- Distortion level : 01 to 04 (from high quality to low quality)
- Examples : ``S01_A_02_03.yuv``, ``S04_A_01_04.264``, ``S10_H_02_01.bin``, etc.

For decoding bistreams (.264, .bin, and .webm), please refer the description and attached zip file.


## License & Citation
Video sequences and subjective data may be used for research and development puposes only. Commercial applications are not allowed. Please cite following paper when you use this database:

    @article{cheon2017subjective,
        title={Subjective and objective quality assessment of compressed 4K UHD videos for immersive experience},
        author={Cheon, Manri and Lee, Jong-Seok},
        journal={IEEE Transactions on Circuits and Systems for Video Technology},
        volume={28},
        number={7},
        pages={1467--1480},
        year={2017},
        publisher={IEEE}
    }


## Contact
- Manri Cheon
  - E-mail : manri.cheon at gmail.com
  - Website : https://manricheon.github.io/
- Jong-Seok Lee
  - E-mail : jong-seok.lee at yonsei.ac.kr
  - Website : [MCML Group](https://mcml.yonsei.ac.kr/)