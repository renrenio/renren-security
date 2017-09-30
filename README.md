**项目说明** 
- 采用Spring、MyBatis、Shiro框架，开发的一套权限系统，极低门槛，拿来即用。设计之初，就非常注重安全性，为企业系统保驾护航，让一切都变得如此简单。
- 提供了代码生成器，只需编写30%左右代码，其余的代码交给系统自动生成，可快速完成开发任务
- 提供了SpringBoot版，方便SpringBoot开发者，获取[SpringBoot版](../../tree/renren-security-boot)
<br><br>


**具有如下特点** 
- 支持HTML、Freemarker、JSP视图，可与现有项目快速集成
- 灵活的权限控制，可控制到页面或按钮，满足绝大部分的权限需求
- 完善的部门管理及数据权限，通过注解实现数据权限的控制
- 完善的XSS防范及脚本过滤，彻底杜绝XSS攻击
- 支持分布式部署，session存储在redis中
- 友好的代码结构及注释，便于阅读及二次开发

**项目结构** 
```
renren-security
├─doc  项目SQL语句
├─common  公共
├─modules 模块
│  ├─gen 代码生成器
│  ├─job 定时任务
│  ├─oss 文件存储
│  └─sys 系统管理(核心)
│ 
├─resources 
│  ├─mapper   MyBatis配置文件
│  ├─template 代码生成器模板（可增加或修改相应模板）
│  ├─db.properties  数据库配置文件
│  └─generator.properties  代码生成器配置文件
│ 
├─webapp 
│  ├─statics   静态资源
│  ├─swagger   swagger ui
│  ├─db.properties   数据库配置文件
│  └─WEB-INF/views   系统页面
│     ├─modules      模块页面
│     ├─index.html   AdminLTE主题风格（默认主题）
│     └─index1.html  Layui主题风格
│

```

<br><br>

**如何交流、反馈、参与贡献？** 
- 项目主页：http://www.renren.io/open/
- oschina仓库：https://gitee.com/babaio/renren-security
- github仓库：https://github.com/sunlightcs/renren-security
- [人人开源](http://www.renren.io)：http://www.renren.io   
- 官方QQ群：324780204、145799952
- 如需关注项目最新动态，请Watch、Star项目，同时也是对项目最好的支持
- 技术讨论、二次开发等咨询、问题和建议，请移步到QQ群324780204、145799952，我会在第一时间进行解答和回复！

<br><br>

**Layui主题风格：**
![输入图片说明](http://cdn.renren.io/img/2f6a43b9081e421ab8aa596155cd0ffc "在这里输入图片标题")

**AdminLTE主题风格：**
![输入图片说明](http://cdn.renren.io/img/44907148dd254064922a80cfddcc9b53 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/f38a062145b141bf81157b495277d224 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/65d7fb1906934e56abf8b8ca7e1c4541 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/de740e471280429cb888f521e02ee787 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/a8bc68f69288424697682f170ee40744 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/92cd56f397754292a1a182f662a7e883 "在这里输入图片标题")
![输入图片说明](http://cdn.renren.io/img/0b56efe56fd64ed18e33a9e6dbb6e88c "在这里输入图片标题")

<br><br>

 **技术选型：** 
- 核心框架：Spring Framework 4.3
- 安全框架：Apache Shiro 1.3
- 视图框架：Spring MVC 4.3
- 持久层框架：MyBatis 3.3
- 定时器：Quartz 2.2
- 数据库连接池：Druid 1.1
- 日志管理：SLF4J 1.7、Log4j
- 页面交互：Vue2.x

<br><br>

 **软件需求** 
- JDK1.7+
- MySQL5.5+
- Tomcat7.0+
- Maven3.0+

<br><br>

 **本地部署**
- 通过git下载源码
- 创建数据库renren_security，数据库编码为UTF-8
- 执行doc/db.sql文件，初始化数据【按需导入表结构及数据】
- 修改db.properties文件，更新MySQL账号和密码
- Eclipse、IDEA执行【clean package tomcat7:run】命令，即可运行项目
- 项目访问路径：http://localhost:8080
- 账号密码：admin/admin

<br><br>

![捐赠](http://cdn.renren.io/donate.jpg "捐赠") 