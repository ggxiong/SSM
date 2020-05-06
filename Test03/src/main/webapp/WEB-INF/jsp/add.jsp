<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/27
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/static/commons.jspf"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">id</label>
        <div class="layui-input-block">
            <input type="text" name="id" lay-verify="required|number" autocomplete="off" placeholder="请输入id" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">患者姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入患者姓名" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">患者年龄</label>
        <div class="layui-input-block">
            <input type="text" name="age" lay-verify="required|number" autocomplete="off" placeholder="患者年龄" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">疫情类型</label>
        <div class="layui-input-block">
            <input type="text" name="type" lay-verify="required" autocomplete="off" placeholder="请输入疫情类型" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">症状</label>
        <div class="layui-input-block">
            <input type="text" name="symptom" lay-verify="required" autocomplete="off" placeholder="请输入症状" class="layui-input">
        </div>
    </div>

    <div class="layui-input-inline">
        <select name="quiz1">
            <option value="">绑定角色</option>
            <c:forEach var="list" items="${list}">
                <option value="${list.id}" selected="">${list.province}${list.city}${list.county}${list.hospital}</option>
            </c:forEach>
        </select>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>


</form>




<script src="${ctx}/static/plugins/layui/layui.js"></script>

<script>
    layui.use(['form', 'jquery'], function(){
        var $ =layui.jquery;
        var form =layui.form;

        form.on('submit(demo1)', function(data){
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

            $.ajax({
                type: "POST",
                url: "/patient/add",
                data: data.field,
                success: function(msg){
                    alert( "添加成功！！ "  );
                }
            });


            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })


</script>


</body>
</html>
