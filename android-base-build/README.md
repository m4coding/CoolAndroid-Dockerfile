### 介绍

构建Android基础编译环境的docker

包含的编译环境：

    （1）jdk1.8
    （2）android sdk
    （3）android ndk


### 如何使用

    //构建镜像
    docker build -t m4coding/coolandroid .

    //运行容器，并进入交互命令行环境
    docker run -it m4coding/coolandroid /bin/bash



