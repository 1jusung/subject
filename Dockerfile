FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    git \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet.git /darknet
WORKDIR /darknet

RUN sed -i 's/OPENCV=0/OPENCV=1/' Makefile
RUN make

RUN wget https://pjreddie.com/media/files/yolov3.weights -O yolov3.weights

COPY run_yolo.sh /darknet/run_yolo.sh
RUN chmod +x /darknet/run_yolo.sh

ENTRYPOINT ["./run_yolo.sh"]

