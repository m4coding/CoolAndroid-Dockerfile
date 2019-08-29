FROM ubuntu:14.04

ADD http://mirrors.163.com/.help/sources.list.trusty /etc/apt/sources.list

MAINTAINER m4coding <m4coding@qq.com>


# Install dependencies
RUN apt-get update -y && apt-get install -y apt-file expect git wget python curl make maven binutils pkg-config gcc build-essential autoconf libtool gperf gettext yasm python-lxml
RUN apt-file update -y
RUN apt-get install -y software-properties-common
RUN dpkg --add-architecture i386 && apt-get update -y && apt-get install -y --force-yes libc6-i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386

ENV JAVA_HOME /usr/lib/jvm/java-oracle
ENV JRE_HOME ${JAVA_HOME}/jre

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -P /tmp \
    https://github.com/frekele/oracle-java/releases/download/8u201-b09/jdk-8u201-linux-x64.tar.gz

RUN cd /tmp && tar -zxvf jdk-8u201-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm && mv /tmp/jdk1.8.0_201 "${JAVA_HOME}" && \
    rm -rf /tmp/*

RUN update-alternatives --install "/usr/bin/java" "java" "${JRE_HOME}/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set java "${JRE_HOME}/bin/java" && \
    update-alternatives --set javac "${JAVA_HOME}/bin/javac"


# Copy necessary files to install Android SDK components
COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools

# Install Android SDK
ENV ANDROID_HOME /opt/android-sdk
RUN mkdir -p ${ANDROID_HOME}
RUN cd ${ANDROID_HOME} && wget -O android-sdk-tools.zip -q https://dl.google.com/android/repository/tools_r25.2.3-linux.zip && unzip -q android-sdk-tools.zip && rm -f android-sdk-tools.zip

# Install Android NDK
RUN cd /opt && wget -O android-ndk-r14b.zip -q https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip && unzip -q android-ndk-r14b.zip && rm -f android-ndk-r14b.zip && ln -sf /opt/android-ndk-r14b /opt/android-ndk

# Setup additional environments
ENV ANDROID_SDK /opt/android-sdk
ENV ANDROID_NDK /opt/android-ndk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN ls -l /opt/tools

# RUN sh /opt/tools/expect-android-update.sh

# Install Android SDK components
RUN cd /opt/android-sdk && cp -a tools copy-tools && sh /opt/tools/expect-android-update.sh platform-tools,build-tools-23.0.3,build-tools-24.0.3,build-tools-25.0.3,android-21,android-22,android-23,android-24,android-25,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services && rm -rf temp

# Check
#RUN which adb
#RUN which android
#RUN java -version