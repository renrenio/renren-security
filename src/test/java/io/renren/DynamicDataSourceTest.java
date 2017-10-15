package io.renren;


import io.renren.datasources.DataSourceTestService;
import io.renren.modules.sys.entity.SysUserEntity;
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
        SysUserEntity user = dataSourceTestService.queryObject(1L);
        System.out.println(ToStringBuilder.reflectionToString(user));

        //数据源2
        SysUserEntity user2 = dataSourceTestService.queryObject2(1L);
        System.out.println(ToStringBuilder.reflectionToString(user2));

        //数据源1
        SysUserEntity user3 = dataSourceTestService.queryObject(1L);
        System.out.println(ToStringBuilder.reflectionToString(user3));
    }

}
