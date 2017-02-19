**项目说明** 
- renren-security是一个轻量级权限管理系统，其核心设计目标是开发迅速、学习简单、轻量级、易扩展
- 使用renren-security搭建项目，只需编写30%左右代码，其余的代码交给系统自动生成
- 一个月的工作量，一周就能完成，剩余的时间可以陪家人、朋友、撩妹、钓凯子等，从此踏入高富帅、白富美行业


**具有如下特点** 
- 轻量级的权限系统，只涉及Spring、Shiro、Mybatis后端框架，降低学习使用成本
- 友好的代码结构及注释，便于阅读及二次开发
- 支持HTML、JSP、Velocity、Freemarker等视图，零技术门槛
- 灵活的权限控制，可控制到页面或按钮，满足绝大部分的权限需求(如需控制到按钮级别，需使用Shiro标签，控制按钮的显示或隐藏)
- 页面交互使用Vue2.x，极大的提高了开发效率
- 完善的代码生成机制，可在线生成entity、xml、dao、service、html、js代码，减少70%以上的开发任务
- 引入quartz定时任务，可动态完成任务的添加、修改、删除、暂停、恢复及日志查看等功能
- 引入路由机制，刷新页面会停留在当前页


**如何交流、反馈、参与贡献？** 
- 项目主页：http://www.renren.io/open/
- 开发文档：http://www.renren.io/open/doc.html
- oschina仓库：http://git.oschina.net/babaio/renren-security
- github仓库：https://github.com/sunlightcs/renren-security
- [编程入门教程](http://www.renren.io)：http://www.renren.io   
- 官方QQ群：324780204、145799952
- 如需关注项目最新动态，请Watch、Star项目，同时也是对项目最好的支持
- 技术讨论、二次开发等咨询、问题和建议，请移步到QQ群324780204、145799952，我会在第一时间进行解答和回复！


![输入图片说明](http://cdn.renren.io/img/3c744febfa944b26b3b9594ae73d4f80 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/f3cc56b411c542d6aa4c01aaa8513995 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/4319bad87a9f4cc5a1d19a70b4288dbb "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/12f1ff16350d44e2a03f3698a9d2e5ee "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/1181f88d52494b7296b53824dda47115 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/ef65919f507d4e82900b323680789bf0 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/087d9b845de3401589e606d43e68e4f2 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/a3e55c6b2c2e4ab3aa05c3f3cf9fd96a "在这里输入图片标题")




 **技术选型：** 
核心框架：Spring Framework 4.2
安全框架：Apache Shiro 1.3
视图框架：Spring MVC 4.2
持久层框架：MyBatis 3.3
定时器：Quartz 2.2
数据库连接池：Druid 1.0
日志管理：SLF4J 1.7、Log4j
页面交互：Vue2.x


 **软件需求** 
JDK1.7+
MySQL5.5+
Tomcat7.0+
Maven3.0+



 **本地部署**
- 通过git下载源码
- 创建数据库renren-security，数据库编码为UTF-8
- 执行doc/db.sql文件，初始化数据
- 修改db.properties文件，更新MySQL账号和密码
- Eclipse、IDEA执行【clean package tomcat7:run】命令，即可运行项目
- 项目访问路径：http://localhost
- 非Maven方式启动，则默认访问路径为：http://localhost:8080/renren-security


建议使用阿里云的Maven仓库：
```
<mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
</mirror>
```
**项目打赏** 
如果您觉得作者的权限系统能帮助到您，您可以打赏作者一瓶汽水
![输入图片说明](http://cdn.renren.io/img/10e0f63b327d4e7ab9113e7b9568381a "在这里输入图片标题")