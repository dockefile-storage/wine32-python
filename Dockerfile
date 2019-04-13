# This is a comment
FROM ubuntu:18.04

MAINTAINER Jiangxumin <cjiangxumin@gmail.com>

USER    root
WORKDIR /root

#COPY init.sh ./
#RUN ./init.sh
COPY run.sh ./

#ENV HOME /root
#ENV PY27_HOME "/root/.wine/drive_c/Python27"
#ENV PY34_HOME "/root/.wine/drive_c/Python34"
#ENV PY_HOME "/root/.wine/drive_c/Python37"

#sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

RUN dpkg --add-architecture i386 &&\ 
    apt-get update  &&\
    apt-get install -y wine32 &&\
    apt-get install -y curl &&\
    apt-get clean  

# ######################
# # install python 2.7
# ######################
# RUN curl -o python-2.7.15.msi https://www.python.org/ftp/python/2.7.15/python-2.7.15.msi && \
#    wine msiexec /i python-2.7.15.msi /qn   &&\
#    rm -f  python-2.7.15.msi  
#
# RUN wine  ${PY27_HOME}/python.exe ${PY27_HOME}/Scripts/pip.exe install pyinstaller    &&\
#    wine  ${PY27_HOME}/python.exe ${PY27_HOME}/Scripts/pip.exe install --upgrade pip  

######################
# install python 3.4
######################
RUN curl -o python-3.4.0.msi https://www.python.org/ftp/python/3.4.0/python-3.4.0.msi &&\
    wine msiexec /i python-3.4.0.msi /qn  &&\
    rm -f  python-3.4.0.msi  

#RUN wine  ${PY34_HOME}/python.exe ${PY34_HOME}/Scripts/pip.exe install --upgrade pip &&\
#    wine  ${PY34_HOME}/python.exe ${PY34_HOME}/Scripts/pip.exe install pyinstaller 

ENV WINEPATH="c:\Python34;c:\Python34\Scripts"

RUN wine pip install --upgrade pip &&\
    wine pip.exe install pyinstaller 

#RUN wine pip install pyinstaller   -i  https://pypi.mirrors.ustc.edu.cn/simple &&\
#    wine pip install --upgrade pip -i  https://pypi.mirrors.ustc.edu.cn/simple 

# ###########################################
# # install python 3.7 error ???????
# ###########################################
# RUN curl -o python-3.7.0.exe https://www.python.org/ftp/python/3.7.0/python-3.7.0.exe && \
#     wine msiexec /i python-3.7.0.exe  /q   &&\
#     rm -f  python-3.7.0.exe  

CMD ["/root/run.sh"]

