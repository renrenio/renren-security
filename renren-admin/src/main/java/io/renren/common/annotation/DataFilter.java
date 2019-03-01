/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.common.annotation;

import java.lang.annotation.*;

/**
 * 数据过滤
 *
 * @author Mark sunlightcs@gmail.com
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataFilter {
    /**  表的别名 */
    String tableAlias() default "";

    /**  true：没有本部门数据权限，也能查询本人数据 */
    boolean user() default true;

    /**  true：拥有子部门数据权限 */
    boolean subDept() default false;

    /**  部门ID */
    String deptId() default "dept_id";

    /**  用户ID */
    String userId() default "user_id";
}

