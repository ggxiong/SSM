<%--
  Created by IntelliJ IDEA.
  User: 10539
  Date: 2020/4/20
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/commons.jspf"%>
<html>
<head>
    <title>Title</title>

</head>
<body>
<button type="button" class="layui-btn" id="user_add">新增</button>
<button type="button" class="layui-btn layui-btn-danger">删除</button>
<button type="button" class="layui-btn layui-btn-warm" id="user_set">修改</button>

<table class="layui-hide" id="test"></table>



<script>
    layui.use(['table','element','layer'],function(){
        var element = layui.element;
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;

        table.render({
            elem: '#test'
            ,url:'${ctx}/user/user_list'
            ,cols: [[
                {field:'userId', width:80, title: 'ID', sort: true}
                ,{field:'userName', width:80, title: '用户名'}
                ,{field:'password', width:80, title: '密码', sort: true}
                ,{field:'email', width:80, title: '电子邮箱'}
                ,{field:'phone', width:80, title: '手机号码', sort: true}
                ,{field:'salt', width:80, title: '盐', sort: true}
                ,{field:'status',  title: '状态1:启用 0：禁用', minWidth: 120}
                ,{field:'createTime', width:135, title: '创造时间'}
                ,{field:'updateTime', width:135, title: '修改时间', sort: true}
            ]]
            ,page: true
        });


        //添加
        $("#user_add").on('click', function() {
            layer.open({
                type: 2,
                area: ['700px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'useradd.jsp'
            });
        });


        //修改
        $("#user_set").on('click', function() {
            layer.open({
                type: 2,
                area: ['700px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'userset.jsp'
            });
        });





    });

</script>
</body>
</html>
