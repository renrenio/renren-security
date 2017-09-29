package io.renren.config;

import io.renren.modules.sys.shiro.ShiroTag;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.util.HashMap;
import java.util.Map;

/**
 * Freemarker配置
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017/9/28 21:32
 */
@Configuration
public class FreemarkerConfig {

    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer(ShiroTag shiroTag){
        FreeMarkerConfigurer configurer = new FreeMarkerConfigurer();
        configurer.setTemplateLoaderPath("/WEB-INF/views/");

        Map<String, Object> variables = new HashMap<>();
        variables.put("shiro", shiroTag);
        configurer.setFreemarkerVariables(variables);

        return configurer;
    }
}
