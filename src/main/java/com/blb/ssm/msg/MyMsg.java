package com.blb.ssm.msg;


import java.util.List;


/**
 * @author 小熊
 * @date 2020/4/21 -11:28
 */
public class MyMsg {

    //返回状态码，0：成功 ；200：失败
    private Integer code;

    private String msg;

    private Integer count;

    //用户放回的数据，放在map里面
    private Object[] data ;


    //返回成功的方法
    public static <T> MyMsg success(List<T> object) {

        MyMsg result = new MyMsg();
        result.setCode(0);
        result.setMsg("");
        result.setCount(object.size());
        return result;

    }

    //返回失败的方法
    public static <T> MyMsg fail(List<T> object) {

        MyMsg result = new MyMsg();
        result.setCode(200);
        result.setMsg("处理失败！");
        result.setCount(object.size());
        return result;

    }


    public <T>  MyMsg add(List<T> object) {

        data = object.toArray(new Object[object.size()]);

        return this;

    }

    public Object[] getData() {
        return data;
    }

    public void setData(Object[] data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }



    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
