---
layout: post
title: "Ubuntu下安装Chrome"
date: 2013-08-20 22:10
comments: true
categories: 软件应用
---

## Ubuntu 32位系统

* 下载Chrome 32位安装包    
{% highlight bash %}
$wget  -O  google-chrome_i386.deb http://goo.gl/itppy
{% endhighlight %}    

* 安装需要的第三方包    
{% highlight bash %}
$sudo apt-get install libnss3-1d libxss1
{% endhighlight %}  

* 安装Chrome    
{% highlight bash %}
$sudo dpkg -i google-chrome_i386.deb
{% endhighlight %}   

## Ubuntu 64位系统

* 下载Chrome 64位安装包    
{% highlight bash %}
$wget -O google-chrome_amd64.deb http://goo.gl/iXDWk
{% endhighlight %}

* 安装需要的第三方包    
{% highlight bash %}
$sudo apt-get install libnss3-1d libxss1
{% endhighlight %}

* 安装Chrome   
{% highlight bash %}
$sudo dpkg -i google-chrome_amd64.deb
{% endhighlight %} 