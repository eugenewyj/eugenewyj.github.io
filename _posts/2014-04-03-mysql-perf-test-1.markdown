---
layout: post
title: "MySQL性能测试调优"
date: 2014-04-03 19:45
comments: true
categories: MySQL
---

操作系统
====

基本操作
----

 1. 查看磁盘分区mount选项

    `$ mount`

 2. 永久修改分区mount选项（系统重启后生效）

    `修改文件 /etc/fstab 中对应分区的mount options列的值`

 3. 在线修改分区mount选项（系统重启后失效）

    `$sudo -t ext4 -o remount,noatime,errors=remount-or /`

文件系统优化
----

 1. ext4文件系统优化

    `分区mount选项加noatime
$sudo -t ext4 -o remount,noatime,errors=remo`

    注意：刚开始加了 nodelalloc 发现mysql写入不如去掉此参数（原因需分析)[参考：http://blog.tao.ma/?p=58]

MySQL
====

基本操作
----

 1. 显示innodb引擎状态

    `mysql> show engine innodb status;`

 2. 查看配置参数

    `mysql> show variables [like ''];`

 3. 查看运行状态值

    `mysql> show global status [like ''];`

 4. 修改配置参数方法

    4.1. 修改配置文件（重启服务生效，适用于所有参数）

       `文件位置： /etc/my.cnf`

    4.2. 命令动态修改（重启服务失效，适用于动态参数）

       `&deg;mysql> set global [参数]=[值]`

 5. 重启MySQL服务

    `$ sudo service [mysql.server] restart`

 6. 赋权同时添加用户，刷新权限
    - 语法：
    
    `mysql> grant [权限] privileges on [数据库].[对象] to [用户名]%'[机器名]' identified by '[密码]';`

    - 示例：
    
    `mysql> grant all privileges on *.* to user1@'%' identified by 'pass1';`
    `mysql> grant all privileges on *.* to user1@'localhost' identified by 'pass1';`
    `mysql> flush privileges;`

参数调整
----

 1. innodb\_buffer\_pool\_size [参考][1]
    - 作用：
> InnoDB用于缓存表及索引数据的内存缓冲区，InnoDB加速优化首要参数
    - 说明：
> InnoDB用于缓存表及索引数据的内存缓冲区容量的字节数。默认是128M。最大值受限于CPU架构;32位系统最大4294967295 (2的32次方减1)，64位系统最大18446744073709551615 (2的64次方减1)。在32位系统中,CPU架构和操作系统可以使用的实际最大值可能小于理论上的最大值。当缓冲区大小超过1GB时，设置innodb_buffer_pool_instances为大于1的值，能够改进一个负荷较大的服务器的可扩展性。  
> 如果你将这个值设的较大，当多次访问数据表中相同的数据时可以减少磁盘IO.专用的数据库服务器上，你可以将此值设置为机器物理内存的80%。如果出现以下问题，请缩小该参数的值。  
> 1.物理内存争用，导致操作系统进行页调度  
> 2.InnoDB用额外的内存进行缓冲和控制结构，所以总共分配的内存将比指定的约大10%   
> 3.地址空间必须是连续的，这在Windows系统中某些DLL需要加载指定地址时可能是一个问题   
> 4.初始化缓冲池的时间与它的大小成正比，如果缓冲池太大，初始化时间可能比较长。例如，在一个现代的Linux x86_64服务器，初始化10GB的缓冲池大约需要6秒。
    - 修改方法：
> 静态参数，必须通过配置文件修改: innodb_buffer_pool_size=8G

 2. 日志相关参数

    2.1. innodb\_log\_file\_size [参考][2]
    - 作用：
> 日志组中每个日志文件大小
    - 说明：
> 日志组中每个日志文件的大小. 所有日志文件大小总和(innodb_log_file_size * innodb_log_files_in_group)不能超过一个最大值(略小于512GB)。例如，两个255G的日志文件刚好接近但未超过最大值。默认值是48M。合理的取值范围是1MB到缓冲池大小的1/N,N是日志组中日志文件个数。这个值越大，缓冲池就需要更少的刷新检查，减少磁盘IO。但是值过大会加大宕机恢复时间，虽然自MySQL5.5改进了恢复性能，但是还是要考虑下这个值的合理性。
    - 修改方法：
> 静态参数，必须通过配置文件修改: innodb_log_file_size=256M

    2.2. innodb\_log\_files\_in\_group [参考][3]
    - 作用：
> 日志组中日志文件个数。InnoDB循环方式写日志文件。默认值（也是建议值）是2。日志文件的位置通过innodb_log_group_home_dir指定。所有日志文件大小总和(innodb_log_file_size * innodb_log_files_in_group)不能超过一个最大值(略小于512GB)。
    - 说明：
> 日志组中日志文件个数。
    - 修改方法：
> 静态参数，必须通过配置文件修改: innodb_log_files_in_group=3

    2.3. innodb\_log\_buffer\_size [参考][4]
    - 作用：
> InnoDB写日志文件到磁盘的缓冲区大小
    - 说明：
> InnoDB写日志文件到磁盘的缓冲区大小。默认值是8M。大的日志缓冲区支持大事务运行，在事务提交前不需要将日志写到磁盘。如果你有些事务update,insert或delete很多行，加大日志缓冲可以减少磁盘IO。
    - 修改方法：
> 静态参数，必须通过配置文件修改: innodb_log_buffer_size=16M

 3. innodb\_flush\_method [参考][5]

    - 作用：
> 控制InnoDB flush数据和日志文件采用的系统调用
    - 说明：
> Windows不用设置   
> Linux可选择：fdatasync（默认），O_DSYNC，O_DIRECT（直接写入磁盘，禁止系统Cache），O_DIRECT_NO_FSYNC（>=5.6.7版本支持）
    - 修改方法：
> 静态参数，必须通过配置文件修改: innodb_flush_method=O_DIRECT

 4. innodb\_flush\_log\_at\_trx\_commit（未修改） [参考][6]
    - 作用：
> 控制事务符合ACID和提高系统性能之间的权衡
    - 说明：
> 这个参数在事务符合ACID和高性能之间进行平衡，你可以通过调整这个参数达到高性能，但是宕机时可能丢失1秒的事务。  
> 这个参数有3个值选项0,1,2：   
> 1（默认值）：严格遵从ACID，事务提交时log buffer被写到日志文件中，并将日志文件内容flush到磁盘。  
> 0：任何mysqld进程崩溃丢失1秒钟的事务。log buffer每隔1秒被写入日志文件并将日志文件刷新到磁盘，事务提交时不执行log buffer写入日志文件的操作。因为系统调度问题，不能保证每秒日志文件都刷新到磁盘百分之百执行。   
> 2：任何mysqld进程崩溃丢失1秒钟的事务。事务提交时log buffer被写入日志文件，每隔1秒将日志文件刷新到磁盘。因为系统调度问题，不能保证每秒日志文件都刷新到磁盘百分之百执行。
    - 修改方法：
> 动态参数，可以通过配置文件和命令修改：innodb_flush_log_at_trx_commit=2 


  [1]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_buffer_pool_size
  [2]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_log_file_size
  [3]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_log_files_in_group
  [4]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_log_buffer_size
  [5]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_flush_method
  [6]: http://dev.mysql.com/doc/refman/5.6/en/innodb-parameters.html#sysvar_innodb_flush_log_at_trx_commit
