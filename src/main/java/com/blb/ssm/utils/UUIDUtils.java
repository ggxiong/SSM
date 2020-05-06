package com.blb.ssm.utils;

import java.util.UUID;

public class UUIDUtils {

    public static String getId(){
        return UUID.randomUUID().toString().replace("-", "");
    }
}
