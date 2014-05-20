查看当前网卡IP配置
        #显示当前所有网卡配置        
        >ipconfig /all               

        #也可以使用下面的命令查看
        >net interface IP show config
配置网卡IP地址
        #为"本地连接"新增一个IP地址为：192.168.0.100，子网掩码为：255.255.255.0。static参数可选
        >netsh interface IP add address "本地连接" [static] 192.168.0.100 255.255.255.0

        #更新"本地连接"IP地址为：192.168.0.100，子网掩码为：255.255.255.0。static参数可选
        >netsh interface IP set address "本地连接" [static] 192.168.0.100 255.255.255.0
        
        #设置本地连接网关为：192.168.0.1，网关跃点数为1
        >netsh interface IP set address "本地连接" gateway=192.168.0.1 gwmetric=1

        #设置DNS
        >netsh interface IP set dns "本地连接" static 172.20.20.40
        #增加一个候选DNS
        >netsh interface IP add dns "本地连接”172.20.20.10 index=2

        #删除"本地连接"一个IP配置
        >netsh interface IP delete address "本地连接" 192.168.0.100 255.255.255.0