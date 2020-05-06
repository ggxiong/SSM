<%--
  Created by IntelliJ IDEA.
  User: 10539
  Date: 2020/4/22
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/static/commons.jspf" %>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body>
<div style="padding: 30px;">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required"  placeholder="请输入ID" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <input type="hidden" name="pid" value="${id==null?0:id}">
        <div class="layui-form-item">
            <label class="layui-form-label">菜单名</label>
            <div class="layui-input-inline">
                <input type="text" name="menuName" required lay-verify="required" placeholder="请输入菜单名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单类型</label>
            <div class="layui-input-inline">
                <input type="radio" name="type" value="目录" title="目录">
                <input type="radio" name="type" value="菜单" title="菜单" checked>
                <input type="radio" name="type" value="按钮" title="按钮">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标</label>
            <div class="layui-input-inline">
                <input type="text" name="icon" required lay-verify="required" placeholder="请输入图标" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限</label>
            <div class="layui-input-inline">
                <input type="text" name="permission" required lay-verify="required" placeholder="请输入权限" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">url</label>
            <div class="layui-input-inline">
                <input type="text" name="url" required lay-verify="required" placeholder="请输入url" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div style="width:200px;text-align: center;">
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        var $ = layui.jquery;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.ajax({
                url:'${ctx}/menu/add'
                ,type:'post'
                ,data:JSON.stringify(data.field)
                ,dataType:'json'
                ,contentType:'application/json'
                ,success: function(msg){
                    if (msg.rs){
                        parent.layer.msg("成功！",{icon:1});
                        $('#reflush',parent.document).click();
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
