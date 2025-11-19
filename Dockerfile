FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git wget build-essential libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet.git /darknet

WORKDIR /darknet

RUN sed -i 's/GPU=1/GPU=0/' Makefile && \
    sed -i 's/OPENCV=1/OPENCV=0/' Makefile

RUN make

RUN wget https://data.pjreddie.com/files/yolov3.weights

ENTRYPOINT ["./darknet", "detector", "test", "cfg/coco.data", "cfg/yolov3.cfg", "yolov3.weights"]
