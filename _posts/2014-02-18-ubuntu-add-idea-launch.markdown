---
layout: post
title: "Ubuntu 14.04 定义 Intellij IDEA 启动器"
date: 2014-02-18 16:14:41 +0800
comments: true
categories: Ubuntu
---

#### 创建 `usr\share\applications\idea.desktop` 文件，内容如下：
```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=IntelliJ IDEA
GenericName=Java IDE
Comment=IntelliJ IDEA is a code-centric IDE focused on developer productivity. The editor deeply understands your code and knows its way around the codebase, makes great suggestions right when you need them, and is always ready to help you shape your code.
Exec=/usr/local/lib/idea/bin/idea.sh
Icon=/usr/local/lib/idea/bin/idea.png
Terminal=false
Type=Application
Categories=Development;IDE
```
