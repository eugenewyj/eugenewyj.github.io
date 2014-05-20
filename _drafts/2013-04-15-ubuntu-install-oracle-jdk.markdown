下载Oracle JDK
            到Oracle网站下载Oracle JDK，我下载的是 jdk-7u7-linux-x64.tar.gz 。

解压安装
            #创建 /usr/lib/jvm目录
            $sudo mkdir /usr/lib/jvm

            #将jdk-7u7-linux-x64.tar.gz拷贝到/usr/lib/jvm下
            $cp jdk-7u7-linux-x64.tar.gz /usr/lib/jvm

            #切换到/usr/lib/jvm目录，并解压jdk-7u7-linux-x64.tar.gz
            $cd /usr/lib/jvm
            $sudo tar xzvf jdk-7u7-linux-x64.tar.gz

配置环境变量(当前用户）
            #只更改当前用户配置，修改~/.bashrc文件
            $vim ~/.bashrc

            #在文件末尾加入以下两行
            export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_07
            export PATH=${JAVA_HOME}/bin:$PATH

配置环境变量(所有用户）

            #对所有用户设置，修改/etc/profile文件
            $sudo vim /etc/profile

            #在文件末尾加入以下两行
            export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_07
            export PATH=${JAVA_HOME}/bin:$PATH

设置系统JDK

            #设置系统候选Java
            $sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_07/bin/java 300

            #配置系统默认Java
            $sudo update-alternatives --config java
