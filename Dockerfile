# FROM ubuntu:16.04
# # WORKDIR /app
# # RUN apt update
# # RUN apt-get install libopencv-dev python-opencv git -y
# # RUN apt install -y cmake
# # RUN git clone https://github.com/AlexeyAB/Yolo_markWORKDIR /app

# RUN apt update
# RUN apt-get install build-essential -y
# COPY initopencv.sh .
# RUN /bin/bash initopencv.sh
# COPY installopencv.sh .
# RUN /bin/bash installopencv.sh
FROM spmallick/opencv-docker:opencv
WORKDIR /app
RUN git clone https://github.com/AlexeyAB/Yolo_mark
RUN apt update
RUN apt-get install build-essential -y
# RUN apt install libgtk2.0-dev pkg-config
RUN cd Yolo_mark && cmake . && make -j
# CMD ls /app/Yolo_mark
RUN rm Yolo_mark/x64/Release/data/img/*
CMD cd /app/Yolo_mark/ && /bin/bash ./linux_mark.sh
# CMD tail -f /dev/null