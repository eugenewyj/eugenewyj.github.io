---
layout: post
title: "Ubuntu安装zookeeper集群"
date: 2013-12-10 21:10
comments: true
categories: 软件开发
---

## 安装单机版
参照“[Zookeeper单机安装(Ubuntu Server)](./2013-05-10-ubuntu-install-zookeeper-standalone.markdown)”安装3台单机版。    
如果采用VirtualBox虚拟机的，可以安装一台后，通过虚拟机复制功能完成。

## 修改3台机器配置
* 修改方法参照“[Ubuntu网卡配置]()”和“Ubuntu笔记”的“修改机器名”部分

* 3台机器的名称及IP地址分别为：     
{% highlight bash %}
192.168.237.20     zoo1            
192.168.237.21     zoo2            
192.168.237.22     zoo3 
{% endhighlight %}
         

* 修改/etc/hosts文件，加入以下内容（机器名解析，使可以通过机器名互相访问）    
{% highlight bash %}
192.168.237.20     zoo1            
192.168.237.21     zoo2            
192.168.237.22     zoo3
{% endhighlight %}
        

## 修改zookeeper配置
* 在3台机器上，修改zookeeper配置文件（zoo.cfg），增加下面内容   
{% highlight bash %}
server.1=zoo1:2888:3888            
server.2=zoo2:2888:3888            
server.3=zoo3:2888:3888
{% endhighlight %}           

* 在zoo1机器上执行如下命令，创建myid文件并写入1  
{% highlight bash %}
$echo 1 > /var/local/zookeeper/myid   # /var/local/zookeeper为dataDir
{% endhighlight %}

* 在zoo2机器上执行如下命令    
{% highlight bash %}
$echo 2 > /var/local/zookeeper/myid    
{% endhighlight %}

* 在zoo3机器上执行如下命令    
{% highlight bash %}
$echo 3 > /var/local/zookeeper/myid    
{% endhighlight %}

## 启动zookeeper服务    
* 在三台机器上执行如下命令，启动zookeeper服务    
{% highlight bash %}
$/usr/local/lib/zookeeper-3.4.5/bin/zkServer.sh start    
{% endhighlight %}

* 连接zoo1服务器，并增加 /test   znode    
{% highlight bash %}
$/usr/local/lib/zookeeper-3.4.5/bin/zkCli.sh -server zoo1 2181
....                                                                                           
[zk:  localhost:2181(CONNECTED) 0] create /test test     
[test, zookeeper]                                                                   
[zk:  localhost:2181(CONNECTED) 1]                                  
{% endhighlight %}

* 连接到zoo2服务器，看是否同步
{% highlight bash %}
$/usr/local/lib/zookeeper-3.4.5/bin/zkCli.sh -server zoo2 2181
....                                                                                           
[zk:  localhost:2181(CONNECTED) 0] ls /                          
[test, zookeeper]                                                                
{% endhighlight %}

## 两台服务器数据不同步
* 一种情况是因为防火墙，导致集群机器无法通讯，可以通过以下命令关闭防火墙    
{% highlight bash %}
$sudo iptables -P INPUT ACCEPT    
$sudo iptables -P OUTPUT ACCEPT
{% endhighlight %}     

