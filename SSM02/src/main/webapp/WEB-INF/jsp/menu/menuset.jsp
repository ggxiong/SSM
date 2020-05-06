<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/static/commons.jspf" %>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body>
<div padding: 30px;>
    <form class="layui-form">
        <input type="hidden" name="id" value="${menu.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">父级菜单</label>
            <div class="layui-input-inline">
                <input type="text" name="pid" required lay-verify="required" value="${menu.pid}" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单名</label>
            <div class="layui-input-inline">
                <input type="text" name="menuName" required lay-verify="required" value="${menu.menuName}" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单类型</label>
            <div class="layui-input-inline">
                <input type="radio" name="type" value="目录" title="目录">
                <input type="radio" name="type" value="菜单" title="菜单">
                <input type="radio" name="type" value="按钮" title="按钮">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标</label>
            <div class="layui-input-inline">
                <input type="text" name="icon" required lay-verify="required" value="${menu.icon}" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">url</label>
            <div class="layui-input-inline">
                <input type="text" name="url" required lay-verify="required" value="${menu.url}" autocomplete="off"
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
                url : '${ctx}/menu/set'
                ,type:'post'
                ,data:JSON.stringify(data.field)
                ,dataType:'json'
                ,contentType:'application/json'                          //表示服务器返回给我们的数据是json格式
                ,success : function (res) {
                    if (res.rs) {
                        parent.layer.msg(res.msg, {icon: 1});
                        $('#reflush',parent.document).click();
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    }else {
                        layer.msg(res.msg, {icon: 2});
                    }
                },
                error : function (res) {
                    layer.alert("修改失败：" + res.data);
                }
            })
            return false;
        });
    });
</script>
</body>
</html>

