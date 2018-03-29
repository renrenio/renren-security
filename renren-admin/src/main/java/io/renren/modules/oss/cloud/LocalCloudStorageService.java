package io.renren.modules.oss.cloud;

import io.renren.common.exception.RRException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

/**
 * @author 李帅超
 * @Description: TODO
 * @date 2018-03-06 12:49
 */
@Component
public class LocalCloudStorageService extends CloudStorageService {
    @Value("${upload.base.dir}")
    private String baseDir;


    public LocalCloudStorageService(){

    }

    @Override
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        try {
            FileUtils.copyInputStreamToFile(inputStream,new File(getBaseDir() + path));
        } catch (Exception e){
            throw new RRException("上传文件失败，请检查配置信息", e);
        }

        return path;
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        String path = getPathBySuffix(suffix);
        return upload(data, path);
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        String path = getPathBySuffix(suffix);
        return upload(inputStream, path);
    }

    /**
     * 通过文件后缀生成文件本地路径
     * @param suffix
     * @return
     */
    private String getPathBySuffix(String suffix) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String str = "/";
        String dir = "/resource/";
        return dir + localDate.format(dateTimeFormatter) + str +System.currentTimeMillis() + new Random().nextInt(10000)+suffix;
    }

    private String getBaseDir(){
        if(StringUtils.isBlank(baseDir)){
            try {
                baseDir = ResourceUtils.getURL("classpath:public").getPath();
            } catch (FileNotFoundException e) {
                throw new RRException("上传文件失败，请检查本地路径配置信息", e);
            }
        }
        return baseDir;
    }
}
