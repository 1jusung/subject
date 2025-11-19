#!/bin/bash
URL="$1"

# URL에서 이미지를 다운로드하여 input.jpg로 저장
wget -O input.jpg "$URL"

# YOLO 실행
/darknet/darknet detect /darknet/cfg/yolov3.cfg /darknet/yolov3.weights input.jpg
#!/bin/bash

# 1) URL에서 파일 다운로드
wget -O input.jpg "$1"

# 2) YOLO 실행
./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights input.jpg -dont_show
