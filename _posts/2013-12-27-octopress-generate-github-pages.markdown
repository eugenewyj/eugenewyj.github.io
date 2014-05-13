---
layout: post
title: "利用Octopress创建Github Pages个人博客"
date: 2013-12-27 22:19
comments: true
categories: Octopress
---

## Octopress 简介
[Octopress](http://octopress.org/)是由[Brandon Mathis](http://brandonmathis.com/)设计的基于[Jekyll](http://github.com/mojombo/jekyll)的静态站点生成框架，用于在[Github Pages](http://pages.github.com/)上创建个人博客。基于Jekyll写博客，你必须自己创建HTML模板，CSS，Javascripts和进行个性化配置。采用Octopress所有这些工作你都不需要自己做，你只需要`clone`或者`fork`Octopress，安装相关依赖和主题就可以了。

## 前期准备
### Windows
#### 安装Git
1. 下载最新版本的Git for Windows([`PortableGit-1.8.4-preview20130916.7z`](https://msysgit.googlecode.com/files/PortableGit-1.8.4-preview20130916.7z))。
2. 将下载后的`PortableGit-1.8.4-preview20130916.7z`文件解压到`D:\Tools\Git`下。
3. 将`D:\Tools\Git\bin`添加到`Path`环境变量中。
4. 在命令行执行`git version`命令,如果输出`git version 1.8.4.msysgit.0`，说明安装成功，如下图：
```
C:\> git version
git version 1.8.4.msysgit.0
```
#### 安装Ruby
1. 下载Ruby for Windows`--RubyInstaller`([`ruby-1.9.3-p484-i386-mingw32.7z`](http://dl.bintray.com/oneclick/rubyinstaller/ruby-1.9.3-p484-i386-mingw32.7z))，Octopress需要Ruby 1.9.3以上版本。
2. 将下载后的`ruby-1.9.3-p484.zip`解压到`D:\Tools`下。
3. 将`D:\Tools\ruby-1.9.3-p484-i386-mingw32\bin`添加到`Path`环境变量中。
4. 在命令行执行`ruby --version`命令，如果输出`ruby 1.9.3p484 (2013-11-22) [i386-mingw32]`，说明安装成功，如下图：
```
C:\> ruby --version
ruby 1.9.3p484 (2013-11-22) [i386-mingw32]
```
#### 安装RubyInstaller DevKit
1. 下载DevKit([`DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe`](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe))。
2. 执行下载后的`DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe`自解压程序，解压到`D:\Tools\DevKit`目录下。
3. 在`D:\Tools\DevKit`目录下执行以下命令完成安装：
```
D:\Tools\DevKit> ruby dk.rb init
D:\Tools\DevKit> ruby db.rk install
--如果执行ruby dk.rb install报以下错误：
Invalid configuration or no Rubies listed. Please fix 'config.yml' and rerun 'ruby dk.rb install'
--在config.yml文件末尾加入`- D:\Tools\ruby-1.9.3-p484-i386-mingw32`之后执行：
D:\Tools\DevKit> ruby dk.rb install
```
#### 添加环境变量
`LANG=zh_CN.UTF-8`     
`LC_ALL=zh_CN.UTF-8`     
          
## 安装Octopress
### Clone Octopress
```
D:\> git clone https://github.com/imathis/octopress.git octopress
D:\> cd octopress
```
### 安装依赖 
```
D:\octopress> gem install bundler
D:\octopress> bundle install
```
### 安装Octopress默认主题
```
D:\octopress> rake install
```

## 部署到Github Pages
创建一个新的Github仓库，采用`username.github.io`格式进行命名，其中`username`是你的Github用户名或者组织名。
Github Pages用`username.github.io`仓库的`master`分支（象web服务器的public目录一样）为`http://username.github.io`提供静态文件。因此，你可能希望将你的blog的源文件放到`username.github.io`仓库的`source`分支，并提交产生的内容到`master`分支。Octopress通过一个配置任务来帮助完成这项工作。
```
D:\octopress> rake setup_github_pages
```
这个任务会提示你输入一个Github仓库的URL，此时输入你的Github仓库的地址（`https://github.com/username/username.github.io.git`）。  


这个任务产生以下结果:    
1. 请求并存储你的Github Pages仓库url.    
2. 将远程库`imathis/octopress`对应的分知名从`origin`修改为`octopress`.    
3. 添加你的Github Pages仓库（`username.github.io`）作为默认的`origin`远程分支    
4. 当前分支从`master`分支切换到`source`.    
5. 根据你的仓库配置你的博客的url.    
6. 在`_deploy`目录下设置`master`分支用于部署。    
接下来运行：
```
D:\octopress> rake generate
D:\octopress> rake deploy
```
这两个任务创建你的博客，并拷贝生成的文件到`_deploy`目录，将这些文件添加到版本库、提交并推到远程仓库的`master`分支下。过几秒或几十秒后，你提交的内容已经发布到你的个人博客网站`http://username.github.io`。
不用忘记提交你的源文件到远程仓库上。
```
D:\octopress> git add .
D:\octopress> git commit -m "你的提交注释"
D:\octopress> git push origin source
```

## 创建博客
常见博客的命令是：
```
D:\octopress> rake new_post["title"]
```
此命令会在`source/_post/`目录下创建格式为`YYYY-MM-DD-title.markdown`文件。  
编辑创建的`YYYY-MM-DD-title.markdown`文件后可以运行以下命令
```
D:\octopress> rake generate   #创建posts和pages到public目录。
D:\octopress> rake watch      #监视source/ 和 sass/ 目录变化并重新生成。
D:\octopress> rake preview    #监视和启动一个webserver，访问地址为http://localhost:4000
D:\octopress> rake deploy     #发布博客到Github中。
```
           
##参考链接
1. http://octopress.org/
2. http://sinosmond.github.io/blog/2012/03/12/install-and-deploy-octopress-to-github-on-windows7-from-scratch/
3. http://www.cnblogs.com/oec2003/archive/2013/05/27/3100896.html
