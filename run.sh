#!/bin/bash
docker kill yolomark
docker rm yolomark
xhost + && docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD/trainingImages:/app/Yolo_mark/x64/Release/data/img/ --name yolomark yolomark