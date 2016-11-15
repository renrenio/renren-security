Renren-security是一个轻量级权限管理系统，其核心设计目标是开发迅速、学习简单、轻量级、易扩展。

Renren-security的权限级别，可控制到页面或按钮级别，如果控制到按钮级别，需要使用shiro标签，控制按钮的显示或隐藏（没有相应的按钮权限，则会隐藏）。

![输入图片说明](http://git.oschina.net/uploads/images/2016/1115/164909_ec3e9d0e_63154.png "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1115/164921_e01a411e_63154.png "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1115/164930_b5e99ba8_63154.png "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1115/164936_c9e23be5_63154.png "在这里输入图片标题")

 **技术选型：** 
核心框架：Spring Framework 4.2
安全框架：Apache Shiro 1.3
视图框架：Spring MVC 4.2
持久层框架：MyBatis 3.2
数据库连接池：Druid 1.0
日志管理：SLF4J 1.7、Log4j
页面交互：Vue2.0

 **支持JSP、Velocity、Freemarker等视图** 

 **软件需求** 
JDK1.7+
Tomcat7.0+
Maven3.0+


 **测试环境**
http://security.renren.io
账号：admin   密码：admin


 **本地启动方法**
clean package tomcat7:run


建议使用阿里云的Maven仓库：
```
<mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
</mirror>
```
