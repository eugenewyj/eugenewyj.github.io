安装JDK并设置JAVA_HOME
        参考“Ubuntu安装Oracle JDK“。

下载Zookeeper
        到Apache网站下载Zookeeper，我下载的是zookeeper-3.4.5.tar.gz
        
解压安装
        #解压
        $sudo tar xzvf zookeeper-3.4.5.tar.gz

        #将解压收的zookeeper-3.4.5 目录拷贝到 /usr/local/lib 下
        $sudo cp -r zookeeper-3.4.5 /usr/local/lib

        #修改/usr/local/lib/zookeeper-3.4.5 所有者及所属组
        $sudo chown -R /usr/local/lib/zookeeper-3.4.5

修改Zookeeper配置
        #切换到Zookeeper安装目录下的conf(配置文件)目录
        $cd /usr/local/lib/zookeeper-3.4.5/conf

        #复制样例配置为配置文件
        $cp zoo_sample.cfg zoo.cfg

        ###修改zookeeper数据存储目录为 /var/local/zookeeper###
        #新建目录 /usr/local/zookeeper
        $sudo mkdir /var/local/zookeeper
        #修改/usr/local/zookeeper所有者和所属组
        $sudo chown ubuntu:ubuntu /var/local/zookeeper
        #修改zoo.cf文件，将 dataDir=/tmp/zookeeper 改为 dataDir=/var/local/zookeeper
        $sed -i "s/dataDir=\/tmp\/zookeeper/dataDir=\/var\/local\/zookeeper/g" zoo.cfg

启动及停止Zookeeper
        #切换到bin目录
        $cd /usr/local/lib/zookeeper-3.4.5/bin

        #启动Zookeeper服务
        $./zkServer.sh start
        

        #启动Zookeeper客户端，如果输出示例内容说明成功
        $./zkCli.sh 
         ....                                                                 
        [zk:  localhost:2181(CONNECTED) 0]        

        #显示根目录
        $[zk:  localhost:2181(CONNECTED) 0] ls /
        [zookeeper]                                              
        [zk:  localhost:2181(CONNECTED) 1]      

        #停止Zookeeper服务
        $./zkServer.sh stop

        
        

        
