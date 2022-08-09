/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.oss.cloud;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import io.renren.common.exception.ErrorCode;
import io.renren.common.exception.RenException;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 腾讯云存储
 *
 * @author Mark sunlightcs@gmail.com
 */
public class QcloudCloudStorageService extends AbstractCloudStorageService {
    private COSCredentials credentials;
    private ClientConfig clientConfig;

    public QcloudCloudStorageService(CloudStorageConfig config){
        this.config = config;

        //初始化
        init();
    }

    private void init(){
        //1、初始化用户身份信息(secretId, secretKey)
        credentials = new BasicCOSCredentials(config.getQcloudSecretId(), config.getQcloudSecretKey());
    	
    	//2、设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
        clientConfig = new ClientConfig(new Region(config.getQcloudRegion()));
    }

    @Override
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
    	try {
            COSClient client = new COSClient(credentials, clientConfig);

            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(inputStream.available());
            String bucketName = config.getQcloudBucketName() +"-"+ config.getQcloudAppId();
            PutObjectRequest request = new PutObjectRequest(bucketName, path, inputStream, metadata);
            PutObjectResult result = client.putObject(request);
            
            client.shutdown();
            if(result.getETag() == null){
                throw new RenException(ErrorCode.OSS_UPLOAD_FILE_ERROR, "");
            }
        } catch (IOException e) {
            throw new RenException(ErrorCode.OSS_UPLOAD_FILE_ERROR, e, "");
        }

        return config.getQcloudDomain() + "/" + path;
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        return upload(data, getPath(config.getQcloudPrefix(), suffix));
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        return upload(inputStream, getPath(config.getQcloudPrefix(), suffix));
    }
}