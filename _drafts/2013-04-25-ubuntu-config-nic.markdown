配置IP地址
        #用vim打开IP地址配置文件
        $sudo vim /etc/network/interfaces

        #IP地址配置文件样例
        #回路（loopback）网络接口                                                                 
        auto lo                                                                                                    
        iface lo inet loopback                                                                           
                                                                                                                       
        #主要网络接口                                                                                         
        auto eth0                         #自动挂载网卡0                                             
        iface eth0  inet dhcp      #通过DHCP自动分配网址                               
                                                                                                                            
        auto eht1                         #自动挂载网卡1                                             
        iface eth1 inet static       #指定静态IP                                                     
        address 192.168.237.10   #IP地址                                                            
        netmask 255.255.255.0    #子网掩码                                                        
        gateway 192.168.237.1    #网关（如果只访问子网外，不需要设置网关）

控制网卡
        #启用网卡
        $sudo ifup eth0

        #停用网卡
        $sudo ifdown eth0

重启网络服务使IP修改生效
        $sudo /etc/init.d/networking restart

网卡名及MAC地址绑定配置文件
        /etc/udev/rules.d/70-persistent-net.rules