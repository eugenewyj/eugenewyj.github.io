#!/bin/bash

passwd="$1"

#未输入sudo密码，提示后退出。
if [[ "$passwd" == "" ]]
then
    echo "请输入sudo密码"
    exit 1
fi

# 安装ruby
which_ruby=$(which ruby)
if [[ "$which_ruby" == "" ]]
then
    echo "开始安装ruby..."
    echo "$passwd"|sudo -S apt-get install ruby
    echo "结束安装ruby..."
fi

# 安装gem
which_gem=$(which gem)
if [[ "$which_gem" == "" ]]
then
    echo "开始安装rubygems..."
    echo "$passwd"|sudo -S apt-get install rubygems
    echo "结束安装rubygems..."
fi

# 升级gem
which_gem=$(which gem)
if [[ "$which_gem" != "" ]]
then
    echo "开始升级rubygems..."
    echo "$passwd"|sudo -S gem install rubygems-update
    echo "$passwd"|sudo -S update_rubygems
    echo "结束升级rubygems..."
fi

# 安装jekyll
which_jekyll=$(which jekyll)
if [[ "$which_jekyll" == "" ]]
then
    echo "开始安装jekyll..."
    echo "$passwd"|sudo -S gem install jekyll
    echo "结束安装jekyll..."
fi

# 升级jekyll
which_jekyll=$(which jekyll)
if [[ "$which_jekyll" != "" ]]
then
    echo "开始升级jekyll..."
    echo "$passwd"|sudo -S gem update jekyll
    echo "结束升级jekyll..."
fi

# 安装pygments
which_pygments=$(which pygmentize)
if [[ "$which_pygments" == "" ]]
then
    echo "开始安装python-pygments..."
    echo "$passwd"|sudo -S apt-get install python-pygments
    echo "结束安装python-pygments..."
fi
