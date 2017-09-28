package io.renren;

import io.renren.common.utils.RedisUtils;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mvc.xml","classpath:spring-jdbc.xml",
        "classpath:spring-redis.xml","classpath:spring-scheduler.xml",})
public class RedisTest {
    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private SysUserService sysUserService;

    @Test
    public void test(){
        SysUserEntity user = sysUserService.queryObject(1L);
        System.out.println(ToStringBuilder.reflectionToString(user));

        redisUtils.set("user", user);

        user = redisUtils.get("user", SysUserEntity.class);
        System.out.println(ToStringBuilder.reflectionToString(user));
    }
}
