---
layout: post
title: "Sprint MVC REST指定HTTP状态码"
date: 2014-05-15 19:48
comments: true
categories: 软件开发
---
### 问题描述
基于Spring MVC实现REST风格的服务，如何指定返回时HTTP头的状态码。
例如：
{% highlight java %}
@RequestMapping(value = "/entity", method = RequestMethod.POST)
public @ResponseBody Entity create() {
    Entity created = new Entity();
    return created;
}
{% endhighlight %}
以上代码返回的HTTP状态码为HttpStatus.OK(200),而根据规范应该返回HttpStatus.CREATED（201）。
   

### 解决方案
Spring MVC中可以通过注解（@ResponseStatus）和返回（ResponseEntity）两种方式来指定方法返回时HTTP的状态码。
{% highlight java %}
@RequestMapping(value = "/entity", method = RequestMethod.POST)
@ResponseStatus(HttpStatus.CREATED)
public @ResponseBody Entity create() {
    Entity created = new Entity();
    return created;
}
{% endhighlight %}
或
{% highlight java %}
@RequestMapping(value = "/entity", method = RequestMethod.POST)
public ResponseEntity<Entity> create() {
    Entity created = new Entity();
    ResponseEntity<Entity> response = new ResponseEntity<>(created, HttpStatus.CREATED);
    return response;
}
{% endhighlight %}