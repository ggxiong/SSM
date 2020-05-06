package com.blb.ssm.utils;

import com.blb.ssm.entity.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class ShiroUtils {

    /**
     * 密码加密
     * @param user
     */
    public static void enPass(User user){
        String salt = UUIDUtils.getId();

        String hashAlgorithmName = "MD5";
        String credentials = user.getPassword();
        int hashIterations = 1024;
        ByteSource credentialsSalt = ByteSource.Util.bytes(salt);

        Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);

        user.setSalt(salt);
        user.setPassword(obj.toString());
    }

    public static void main(String[] args) {
        String hashAlgorithmName = "MD5";
        String credentials = "123";
        int hashIterations = 1024;
        ByteSource credentialsSalt = ByteSource.Util.bytes("bcd");
        /**
         * 参数1：算法名称
         * 参数2：密码
         * 参数3：加密值
         * 参数4：加密次数
         */
        Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);
        System.out.println(obj);
    }
}
