---
layout: post
title: "监控远程JVM设置"
date: 2014-01-15 20:22
comments: true
categories: 软件开发
---


## JMX配置
{% highlight bash %}
-Dcom.sun.management.jmxremote
-Dcom.sun.management.jmxremote.port=9999
-Dcom.sun.management.jmxremote.ssl=false
-Dcom.sun.management.authenticate=false
-Djava.rmi.server.hostname=192.168.56.101
{% endhighlight %}
注意：最后一行必须存在，否则无法只能从本机监测，无法通过其他机器远程监测。

## jstatd配置
* 准备java.policy文件，保存到/home/admin/jstatd.java.policy    
{% highlight bash %}
grant codebase "file:${java.home}/../lib/tools.jar" {
     permission java.security.AllPermission;
}
{% endhighlight %}


* 启动jstatd:    
{% highlight bash %}
jstatd -J-Djava.security.policy=/home/admin/jstatd.java.policy -p 1099
{% endhighlight %}

注意：jstatd默认监控端口为1099，可以通过-p参数调整。