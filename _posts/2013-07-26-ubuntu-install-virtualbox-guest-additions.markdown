---
layout: post
title: "Ubuntu安装VirtualBox增强功能"
date: 2013-07-26 21:10
comments: true
categories: 软件应用
---

## Ubuntu 12.10 Desktop      
首先，通过VirtualBox菜单（设备->安装增强功能）加载增强包加载到光盘。    

* 安装linux-headers    
{% highlight bash %}
$ sudo apt-get install linux-headers-$(uname -r)  
{% endhighlight %}     
      
* 切换到光盘路径，eugene为当前用户名     
{% highlight bash %}
$ cd /media/eugene/VBOXADDITIONS_4.2.6_82870
{% endhighlight %}

* 安装增强功能    
{% highlight bash %}
$ sudo ./VBoxLinuxAdditions.run
{% endhighlight %}

## Ubuntu 12.10 Server
首先，通过VirtualBox菜单（设备->安装增强功能）加载增强包加载到光盘。
        
* 安装linux-headers。    
{% highlight bash %}
$sudo apt-get install linux-headers-$(uname -r)  
{% endhighlight %}

* 安装build-essential（编译环境套件：g++,dpkg-dev,libc6-dev,make）    
{% highlight bash %}
$sudo apt-get install build-essential
{% endhighlight %}

* 挂载光驱    
{% highlight bash %}
$sudo mount /dev/cdrom /media/cdrom
{% endhighlight %}

* 安装增强功能，如果出现以下错误是因为Server未安装图形界面，不影响使用        
{% highlight bash %}
Installing the Window System drivers ...fail!
(Could not find the X.Org or XFree86 Window System.)
$sudo /media/cdrom/VBoxLinuxAdditions.run
{% endhighlight %}

* 卸载cdrom    
{% highlight bash %}
$sudo umount /media/cdrom
{% endhighlight %}

* 将共享文件夹(share)挂载到mnt下    
{% highlight bash %}
$sudo mount -t vboxsf share /mnt
{% endhighlight %}        