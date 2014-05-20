一、Ubuntu端操作Windows
Ubuntu访问Windows共享目录
        1.  命令行模式
          $sudo mount //192.168.1.3/server_share  -o user=DOMIAN\\user,pass=passwd /mnt
            #注意两点
            #1、domain这里是域名，并且12.04要 必须大写，不知道的话在界面打开主文件夹点击网络来查看。
            #2、这里有两个\\,其中第一个是转义符，第二个是\
        2. 图形模式

            #打开主文件夹，按Ctrl+l,输入smb://192.168.1.3 ,出现图形界面，填写正确信息后即可访问。
scp命令（前提windows安装SSH Server）
        1. 从Ubuntu向Windows拷贝文件
            #将tmp目录下的a.txt拷贝到192.168.1.10机器的D盘根目录下
            $sudo scp /tmp/a.txt  administrator@192.168.1.10:/d:/

        2. 从Windows向Ubuntu拷贝文件
            #将192.168.1.10机器的D盘根目录下的a.txt拷贝到tmp目录下
            $sudo scp administrator@192.168.1.10:/d:/a.txt /tmp
windows访问Ubuntu
        1. 首先Ubuntu安装openssh-server。
        $sudo apt-get install openssh-server

        2. 查看ssh服务是否开启，如果未开启就启动ssh
        $sudo service ssh status
        $sudo service ssh restart

        3. 修改防火墙配置，打开22（ssh）端口
        #Ubuntu带了一个ufm的防火墙配置工具，相对iptables比较简单。
        #以后补充
        
        4、可以通过Putty访问Ubuntu机器

        5、通过pscp向Ubuntu拷贝文件
        #将当前Windows机器D:\downloads\a.txt拷贝到ubuntu的用户主目录下的download目录中
        $pscp D:\downloads\a.txt ubuntu@192.168.254.2:downloads
        #注意：ubuntu是192.168.254.2(Ubuntu系统)机器上的用户名
        
        