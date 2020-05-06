package com.blb.ssm.utils;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @author 小熊
 * @date 2020/4/21 -19:52
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Response {

    private boolean rs =true;

    private String msg ="操作成功";

    private Object object;

    public Response(String msg) {
        this.msg = msg;
    }

    //返回成功的方法
    public static  Response success() {
        return new Response();
    }

    public static  Response success(String msg) {
        return new Response(msg);
    }

    //返回失败的方法
    public static  Response error() {

        Response response = new Response();
        response.setRs(false);
        response.setMsg("操作失败");
        return response ;
    }


}
