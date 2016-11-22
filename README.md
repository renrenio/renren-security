renren-security是一个轻量级权限管理系统，其核心设计目标是开发迅速、学习简单、轻量级、易扩展。

**具有如下特点** 
- 轻量级的权限系统，只涉及Spring、Shiro、Mybatis后端框架，降低学习使用成本
- 友好的代码结构及注释，便于阅读及二次开发
- 支持HTML、JSP、Velocity、Freemarker等视图，零技术门槛
- 灵活的权限控制，可控制到页面或按钮，满足绝大部分的权限需求(如需控制到按钮级别，需使用Shiro标签，控制按钮的显示或隐藏)
- 页面交互使用Vue2.0，极大的提高了开发效率
- 引入路由机制，刷新页面会保留在当前页


**如何交流、反馈、参与贡献？** 
- 演示地址：http://security.renren.io   (账号密码：admin/admin)
- 编程教程：http://www.renren.io
- 官方QQ群：324780204
- 技术讨论、二次开发等咨询、问题和建议，请稳步到QQ群324780204，我会在第一时间进行解答和回复！


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


 **软件需求** 
JDK1.7+
Tomcat7.0+
Maven3.0+



 **本地部署**
- 创建数据库renren-security，并执行doc/db.sql文件
- 执行mvn clean package tomcat7:run   
- 访问路径：http://localhost


建议使用阿里云的Maven仓库：
```
<mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
</mirror>
```
