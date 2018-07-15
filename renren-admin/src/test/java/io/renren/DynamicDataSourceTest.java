package io.renren;


import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.service.DataSourceTestService;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class DynamicDataSourceTest {
    @Autowired
    private DataSourceTestService dataSourceTestService;

    @Test
    public void test(){
        //数据源1
        SysUserEntity user1 = dataSourceTestService.queryUser(1L);
        System.out.println(ToStringBuilder.reflectionToString(user1));

        //数据源2
        SysUserEntity user2 = dataSourceTestService.queryUser2(1L);
        System.out.println(ToStringBuilder.reflectionToString(user2));

        //数据源1
        SysUserEntity user3 = dataSourceTestService.queryUser(1L);
        System.out.println(ToStringBuilder.reflectionToString(user3));
    }

}
