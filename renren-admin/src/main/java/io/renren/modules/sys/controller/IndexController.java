package io.renren.modules.sys.controller;

import io.renren.common.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页提示
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
public class IndexController {

    @GetMapping("/")
    public Result<String> index(){
        String tips = "你好，renren-admin已启动，请启动renren-ui，才能访问页面！";
        return new Result<String>().ok(tips);
    }
}
