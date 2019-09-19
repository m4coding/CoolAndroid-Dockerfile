### 介绍

构建Android基础编译环境的docker，包含gradle、sdk、ndk等基础包

包含的编译环境：

    （1）jdk1.8
    （2）android sdk
    （3）android ndk


### 如何使用

    //构建镜像
    docker build -t m4coding/coolandroid .

    //运行容器，并进入交互命令行环境
    docker run -it m4coding/coolandroid /bin/bash

### 遇到的问题

    1、gradle打包：
        gradle assemble过程中出现Gradle build daemon disappeared unexpectedly (it may have been killed or may have crashed)
        系统内存不足时会有这个错误。
    
        gradle --no-daemon assemble --info 使用--no-daemon可减低内存，同时提高下打包速度


