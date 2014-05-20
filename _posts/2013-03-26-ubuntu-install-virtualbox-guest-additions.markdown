---
layout: post
title: "Ubuntu安装VirtualBox增强功能"
date: 2013-03-26 21:10
comments: true
categories: 软件应用
---

## Ubuntu 12.10 Desktop      
首先，通过VirtualBox菜单（设备->安装增强功能）加载增强包加载到光盘。    

1. 安装linux-headers。    
    $ sudo apt-get install linux-headers-$(uname -r)   
      
2. 切换到光盘路径，eugene为当前用户名    
    $ cd /media/eugene/VBOXADDITIONS_4.2.6_82870   

3. 安装增强功能    
    $ sudo ./VBoxLinuxAdditions.run

## Ubuntu 12.10 Server
首先，通过VirtualBox菜单（设备->安装增强功能）加载增强包加载到光盘。
        
1. 安装linux-headers。    
    $sudo apt-get install linux-headers-$(uname -r)  

2. 安装build-essential（编译环境套件：g++,dpkg-dev,libc6-dev,make）    
    $sudo apt-get install build-essential

3. 挂载光驱    
    $sudo mount /dev/cdrom /media/cdrom

4. 安装增强功能，如果出现以下错误是因为Server未安装图形界面，不影响使用        
    Installing the Window System drivers ...fail!    
    (Could not find the X.Org or XFree86 Window System.)    
    $sudo /media/cdrom/VBoxLinuxAdditions.run    

5. 卸载cdrom    
    $sudo umount /media/cdrom

6. 将共享文件夹(share)挂载到mnt下    
    $sudo mount -t vboxsf share /mnt

        
        