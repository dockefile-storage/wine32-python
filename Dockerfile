# This is a comment
FROM ubuntu:18.04

MAINTAINER Jiangxumin <cjiangxumin@gmail.com>

USER    root
WORKDIR /root

#COPY init.sh ./
#RUN ./init.sh
COPY run.sh ./
ENV PY_HOME "${HOME}/.wine/drive_c/Python27"

#sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

RUN sudo dpkg --add-architecture i386 &&\ 
    apt-get update   &&\
    apt-get install -y python curl &&\
    apt-get clean && \
    curl -o python-2.7.15.msi https://www.python.org/ftp/python/2.7.15/python-2.7.15.msi && \
    wine msiexec /i python-2.7.15.msi /q   &&\
    rm -f  python-2.7.15.msi  

RUN wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install pyinstaller   -i  https://pypi.mirrors.ustc.edu.cn/simple &&\
    wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install --upgrade pip -i  https://pypi.mirrors.ustc.edu.cn/simple 

CMD ["/root/run.sh"]


