/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.oss.cloud;


import io.renren.common.validator.group.AliyunGroup;
import io.renren.common.validator.group.QcloudGroup;
import io.renren.common.validator.group.QiniuGroup;
import lombok.Data;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 云存储配置信息
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
public class CloudStorageConfig implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 类型 1：七牛  2：阿里云  3：腾讯云
     */
    @Range(min=1, max=3, message = "类型错误")
    private Integer type;

    @NotBlank(message="七牛绑定的域名不能为空", groups = QiniuGroup.class)
    @URL(message = "七牛绑定的域名格式不正确", groups = QiniuGroup.class)
    private String qiniuDomain;
    private String qiniuPrefix;
    @NotBlank(message="七牛AccessKey不能为空", groups = QiniuGroup.class)
    private String qiniuAccessKey;
    @NotBlank(message="七牛SecretKey不能为空", groups = QiniuGroup.class)
    private String qiniuSecretKey;
    @NotBlank(message="七牛空间名不能为空", groups = QiniuGroup.class)
    private String qiniuBucketName;

    @NotBlank(message="阿里云绑定的域名不能为空", groups = AliyunGroup.class)
    @URL(message = "阿里云绑定的域名格式不正确", groups = AliyunGroup.class)
    private String aliyunDomain;
    private String aliyunPrefix;
    @NotBlank(message="阿里云EndPoint不能为空", groups = AliyunGroup.class)
    private String aliyunEndPoint;
    @NotBlank(message="阿里云AccessKeyId不能为空", groups = AliyunGroup.class)
    private String aliyunAccessKeyId;
    @NotBlank(message="阿里云AccessKeySecret不能为空", groups = AliyunGroup.class)
    private String aliyunAccessKeySecret;
    @NotBlank(message="阿里云BucketName不能为空", groups = AliyunGroup.class)
    private String aliyunBucketName;

    @NotBlank(message="腾讯云绑定的域名不能为空", groups = QcloudGroup.class)
    @URL(message = "腾讯云绑定的域名格式不正确", groups = QcloudGroup.class)
    private String qcloudDomain;
    private String qcloudPrefix;
    @NotNull(message="腾讯云AppId不能为空", groups = QcloudGroup.class)
    private Integer qcloudAppId;
    @NotBlank(message="腾讯云SecretId不能为空", groups = QcloudGroup.class)
    private String qcloudSecretId;
    @NotBlank(message="腾讯云SecretKey不能为空", groups = QcloudGroup.class)
    private String qcloudSecretKey;
    @NotBlank(message="腾讯云BucketName不能为空", groups = QcloudGroup.class)
    private String qcloudBucketName;
    @NotBlank(message="所属地区不能为空", groups = QcloudGroup.class)
    private String qcloudRegion;

}
