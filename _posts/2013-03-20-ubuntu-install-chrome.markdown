---
layout: post
title: "Ubuntu下安装Chrome"
date: 2013-03-20 22:10
comments: true
categories: 软件应用
---

## Ubuntu 32位系统

1. 下载Chrome 32位安装包    
    $wget  -O  google-chrome_i386.deb http://goo.gl/itppy

2. 安装需要的第三方包    
    $sudo apt-get install libnss3-1d libxss1

3. 安装Chrome    
    $sudo dpkg -i google-chrome_i386.deb

## Ubuntu 64位系统

1. 下载Chrome 64位安装包    
    $wget -O google-chrome_amd64.deb http://goo.gl/iXDWk

2. 安装需要的第三方包    
    $sudo apt-get install libnss3-1d libxss1

3. 安装Chrome    
    $sudo dpkg -i google-chrome_amd64.deb
