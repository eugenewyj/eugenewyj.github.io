---
layout: post
title: "Ubuntu安装zookeeper单机版"
date: 2013-11-20 22:10
comments: true
categories: 软件开发
---

## 安装JDK并设置JAVA_HOME    
参考“[Ubuntu安装Oracle JDK](http://fengbaoxp.github.io/2014-01/orinstall-oracle-jdk/)“。    

## 下载Zookeeper        
到Apache网站下载Zookeeper，我下载的是[zookeeper-3.4.5.tar.gz](http://www.fayea.com/apache-mirror/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz)。
        
## 解压安装
* 解压    
{% highlight bash %}
$sudo tar xzvf zookeeper-3.4.5.tar.gz    
{% endhighlight %}

* 将解压收的zookeeper-3.4.5 目录拷贝到`/usr/local/lib`下    
{% highlight bash %}
$sudo cp -r zookeeper-3.4.5 /usr/local/lib    
{% endhighlight %}

* 修改`/usr/local/lib/zookeeper-3.4.5`所有者及所属组    
{% highlight bash %}
$sudo chown -R /usr/local/lib/zookeeper-3.4.5
{% endhighlight %}

## 修改Zookeeper配置     
* 切换到Zookeeper安装目录下的conf(配置文件)目录    
{% highlight bash %}
$cd /usr/local/lib/zookeeper-3.4.5/conf    
{% endhighlight %}

* 复制样例配置为配置文件    
{% highlight bash %}
$cp zoo_sample.cfg zoo.cfg    
{% endhighlight %}

## 修改zookeeper数据存储目录为`/var/local/zookeeper`
* 新建目录 /usr/local/zookeeper   
{% highlight bash %}
$sudo mkdir /var/local/zookeeper    
{% endhighlight %}

* 修改/usr/local/zookeeper所有者和所属组    
{% highlight bash %}
$sudo chown ubuntu:ubuntu /var/local/zookeeper    
{% endhighlight %}

* 修改zoo.cf文件，将 dataDir=/tmp/zookeeper 改为 dataDir=/var/local/zookeeper    
{% highlight bash %}
$sed -i "s/dataDir=\/tmp\/zookeeper/dataDir=\/var\/local\/zookeeper/g" zoo.cfg    
{% endhighlight %}

## 启动及停止Zookeeper    
* 切换到bin目录    
{% highlight bash %}
$cd /usr/local/lib/zookeeper-3.4.5/bin    
{% endhighlight %}  

* 启动Zookeeper服务
{% highlight bash %}
$./zkServer.sh start    
{% endhighlight %}    
        
* 启动Zookeeper客户端，如果输出示例内容说明成功
{% highlight bash %}
$./zkCli.sh         
....                                                                     
[zk:  localhost:2181(CONNECTED) 0] 
{% endhighlight %}

* 显示根目录
{% highlight bash %}
$[zk:  localhost:2181(CONNECTED) 0] ls /    
[zookeeper]                                                  
[zk:  localhost:2181(CONNECTED) 1]
{% endhighlight %}    

* 停止Zookeeper服务    
{% highlight bash %}
$./zkServer.sh stop
{% endhighlight %}