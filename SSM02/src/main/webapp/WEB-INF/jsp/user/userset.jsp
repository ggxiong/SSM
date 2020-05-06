<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/21
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/commons.jspf"%>
<html>
<head>
    <title>添加</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body>
<div style="padding: 30px;">
    <form class="layui-form layui-form-pane" >
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" value=${user.id} lay-verify="required"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder=${user.username} autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" value=${user.password} autocomplete="off" class="layui-input">
            </div>
        </div>

        <div style="display: none">
        <div class="layui-form-item">
            <label class="layui-form-label">盐</label>
            <div class="layui-input-inline">
                <input type="text" name="salt" lay-verify="required" value=${user.salt}  autocomplete="off" class="layui-input">
            </div>
        </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">别名</label>
            <div class="layui-input-inline">
                <input type="text" name="nickname" lay-verify="required" placeholder=${user.nickname} autocomplete="off" class="layui-input">
            </div>
        </div>

        <div style="display: none">
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <input type="text" name="status" lay-verify="required" value=${user.status} autocomplete="off" class="layui-input">
            </div>
        </div>
        </div>

        <div style="width:200px;text-align: center;">
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="demo3">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div></div>

    </form>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //Demo
    layui.use(['form','element','jquery'], function() {
        var element = layui.element;
        var $ = layui.jquery;
        var form = layui.form;

        //监听提交
        form.on('submit(demo3)', function(data) {

            $.ajax({
                url:'${ctx}/user/set'
                ,type:'post'
                ,data:JSON.stringify(data.field)
                ,dataType:'json'
                ,contentType:'application/json'
                ,success: function(msg){
                    if (msg.rs){
                        parent.layer.msg("成功！",{icon:1});
                        parent.layui.table.reload("test")
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    }else {
                        layer.msg("失败！",{icon:2});
                    }
                }
            });



            return false;
        });
    });
</script>

</body>
</html>
