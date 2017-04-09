#!/bin/bash
v4l2-ctl --device=/dev/video0 --set-fmt-video=width=1920,height=1080
ffmpeg -y -re -ar 44100 -ac 2 -acodec pcm_s16le -f alsa -ac 2 -i hw:1 -itsoffset 0.5 -f v4l2 -input_format h264 -i /dev/video0 -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/YOUR-STREAM_CODE_HERE
