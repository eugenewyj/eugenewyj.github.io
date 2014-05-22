---
layout: post
title: "Ubuntu安装Oracle JDK"
date: 2013-09-15 21:10
comments: true
categories: 软件开发
---

## 下载Oracle JDK    
到Oracle网站下载Oracle JDK，我下载的是[jdk-7u7-linux-x64.tar.gz](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 。    

## 解压安装    
* 创建 /usr/lib/jvm目录    
{% highlight bash %}
$sudo mkdir /usr/lib/jvm
{% endhighlight %}   

* 将jdk-7u7-linux-x64.tar.gz拷贝到/usr/lib/jvm下    
{% highlight bash %}
$cp jdk-7u7-linux-x64.tar.gz /usr/lib/jvm
{% endhighlight %}

* 切换到/usr/lib/jvm目录，并解压jdk-7u7-linux-x64.tar.gz    
{% highlight bash %}
$cd /usr/lib/jvm    
$sudo tar xzvf jdk-7u7-linux-x64.tar.gz
{% endhighlight %}   




        
## 配置环境变量(当前用户）    
* 只更改当前用户配置，修改~/.bashrc文件    
{% highlight bash %}
$vim ~/.bashrc
{% endhighlight %}

* 在文件末尾加入以下两行    
{% highlight bash %}
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_07    
export PATH=${JAVA_HOME}/bin:$PATH
{% endhighlight %}        

## 配置环境变量(所有用户）

* 对所有用户设置，修改/etc/profile文件    
{% highlight bash %}
$sudo vim /etc/profile
{% endhighlight %}

* 在文件末尾加入以下两行    
{% highlight bash %}
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_07    
export PATH=${JAVA_HOME}/bin:$PATH 
{% endhighlight %}     

## 设置系统JDK
* 设置系统候选Java    
{% highlight bash %}
$sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_07/bin/java 300
{% endhighlight %}

* 配置系统默认Java    
{% highlight bash %}
$sudo update-alternatives --config java
{% endhighlight %}