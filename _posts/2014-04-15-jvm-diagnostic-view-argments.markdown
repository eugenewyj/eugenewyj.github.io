---
layout: post
title: "JVM诊断之查看运行参数"
date: 2014-04-15 19:48
comments: true
categories: 软件开发
---
### 问题描述
> 为了分析和定位一个Java线上系统问题，我们需要查看JVM启动时的一些参数设置，例如：垃圾回收算法、堆大小等等。这些参数可能在启动脚本中明确指明，也可能采用默认值。在系统运行过程中其他人也许动态调整了系统参数。 如何实时查看正在运行的JVM的参数呢？    

### 解决方案
> 可以采用jcmd来查看正在运行的JVM的参数。jcmd从JDK 7开始引入的一个JVM诊断命令行工具，可以向运行中的JVM发送诊断命令。    




### 查看JVM进程的PID
{% highlight bash %}
$ jcmd -l
27940 sun.tools.jcmd.JCmd -l
24684 org.codehaus.plexus.classworlds.launcher.Launcher -Prun
23839 com.intellij.idea.Main
23951 org.jetbrains.idea.maven.server.RemoteMavenServer
{% endhighlight %}
### 查看进程24684的参数
{% highlight bash %}
$ jcmd 24684 VM.flags
24684:
-XX:InitialHeapSize=98566144 -XX:MaxHeapSize=1547698176 -XX:MaxNewSize=515899392 -XX:MinHeapDeltaBytes=524288 -XX:NewSize=1572864 -XX:OldSize=96993280 -XX:+UseCompressedClassPointers -XX:+UseCompressedOops -XX:+UseParallelGC 
{% endhighlight %}
堆大小设置，垃圾回收算法等一目了然。