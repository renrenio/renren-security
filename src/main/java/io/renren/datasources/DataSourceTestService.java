package io.renren.datasources;

import io.renren.datasources.annotation.DataSource;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 测试
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017/9/16 23:10
 */
@Service
public class DataSourceTestService {
    @Autowired
    private SysUserService sysUserService;

    public SysUserEntity queryObject(Long userId){
        return sysUserService.queryObject(userId);
    }

    @DataSource(name = DataSourceNames.SECOND)
    public SysUserEntity queryObject2(Long userId){
        return sysUserService.queryObject(userId);
    }
}
