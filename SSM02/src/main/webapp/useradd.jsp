<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/21
  Time: 13:39
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
            <input type="text" name="id" lay-verify="required" autocomplete="off" placeholder="请输入id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">别名</label>
        <div class="layui-input-inline">
            <input type="text" name="nickname" lay-verify="required" placeholder="请输入别名" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" name="status" lay-skin="switch" lay-filter="switchTest" lay-text="启用|禁用" value="1">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">绑定角色</label>
        <div class="layui-input-inline">
            <div id="demo1"></div>
        </div>
        <div class="layui-form-mid layui-word-aux">一个用户只能绑定一个角色</div>
    </div>
    <div style="width:200px;text-align: center;">
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div></div>

  </form>
</div>
        <script src="${ctx}/static/plugins/layui/layui.js"></script>
        <script src="${ctx}/static/plugins/xm-select/xm-select.js"></script>
        <script>
            //Demo
            layui.use(['form','element','jquery'], function() {
                var element = layui.element;
                var $ = layui.jquery;
                var form = layui.form;
                var demo1 = xmSelect.render({
                    el: '#demo1',
                    language: 'zn',
                    name: 'roles',
                    prop: {
                        name:'roleName',
                        value:'id',
                    },
                    data: []
                })

                $.get('${ctx}/role/roleList',function (response) {
                    demo1.update({
                        data:JSON.parse(response)
                        ,autoRow:true
                    })
                    
                })


                form.on('submit(demo2)', function (data) {

                    $.ajax({
                        url : '${ctx}/user/add',
                        type : 'post',
                        data: data.field,
                        dataType : 'json',                          //表示服务器返回给我们的数据是json格式
                        success : function (res) {
                            if (res.rs) {
                                parent.layer.msg("成功！",{icon:1});
                                parent.layui.table.reload("test")
                                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                parent.layer.close(index); //再执行关闭
                            }else {
                                layer.msg(res.msg, {icon: 2});
                            }
                        },
                        error : function (res) {
                            layer.alert("添加失败：" + res.data);
                        }
                    })
                    return false;
                });




            });
        </script>

</body>
</html>
