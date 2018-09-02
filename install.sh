sudo dpkg --add-architecture i386 # 开启32位架构支持
sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list
apt-get update

apt-get install -y curl 
apt-get install -y wine32 
#apt-get install -y --fix-missing winetricks 

curl -o python-2.7.15.msi https://www.python.org/ftp/python/2.7.15/python-2.7.15.msi
wine msiexec /i python-2.7.15.msi /q 
rm -f  python-2.7.15.msi

PY_HOME=${HOME}/.wine/drive_c/Python27
wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install pyinstaller   -i  https://pypi.mirrors.ustc.edu.cn/simple
wine ${PY_HOME}/python.exe ${PY_HOME}/Scripts/pip.exe install --upgrade pip -i  https://pypi.mirrors.ustc.edu.cn/simple
