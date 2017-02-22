package io.renren.oss;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.request.UploadFileRequest;
import io.renren.utils.RRException;
import org.apache.commons.io.FileUtils;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * 腾讯云存储
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-26 20:51
 */
public class QcloudCloudStorageService extends CloudStorageService{
    private COSClient client;

    public QcloudCloudStorageService(CloudStorageConfig config){
        this.config = config;

        //初始化
        init();
    }

    private void init(){
        client = new COSClient(config.getQcloudAppId(), config.getQcloudSecretId(),
                config.getQcloudSecretKey());
    }

    @Override
    public String upload(byte[] data, String path) {
        return this.upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        String tmp = System.getProperty("java.io.tmpdir");
        File file = new File(tmp + path);
        try {
            FileUtils.copyInputStreamToFile(inputStream, file);
        } catch (IOException e) {
            throw new RRException("上传文件失败", e);
        }

        //腾讯云必需要以"/"开头
        if(!path.startsWith("/")) {
            path = "/" + path;
        }

        //上传到腾讯云
        UploadFileRequest request = new UploadFileRequest(config.getQcloudBucketName(), path, file.getPath());
        String response = client.uploadFile(request);

        //删除临时文件
        file.delete();

        JSONObject jsonObject = JSON.parseObject(response);
        if(jsonObject.getIntValue("code") != 0) {
            throw new RRException("文件上传失败，" + jsonObject.getString("message"));
        }

        return config.getQcloudDomain() + path;
    }

    @Override
    public String upload(byte[] data) {
        return upload(data, getPath(config.getQcloudPrefix()));
    }

    @Override
    public String upload(InputStream inputStream) {
        return upload(inputStream, getPath(config.getQcloudPrefix()));
    }
}
