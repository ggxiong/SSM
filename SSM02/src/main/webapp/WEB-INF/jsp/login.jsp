<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/static/commons.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body background="${ctx}/login/img/bg.jpg">
<div align="left"></div>
<div style="padding: 20px;">
    <div class="layui-row layui-col-md6 layui-col-md-offset4">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header"><i class="layui-icon layui-icon-username ">登录</i></div>
                <div class="layui-card-body">
                    <form class="layui-form" action="/login" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">账号：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" required
                                       lay-verify="required" placeholder="请输入账号" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码：</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" required
                                           lay-verify="required" placeholder="请输入密码" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-mid layui-word-aux">${msg}</div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

        <script src="${ctx}/static/plugins/layui/layui.js"></script>
        <script>
            //Demo
            layui.use(['form','element','jquery'], function() {
                var element = layui.element;
                var $ = layui.jquery;
                var form = layui.form;

                //监听提交
                form.on('submit(formDemo)', function(data) {
                    layer.msg(JSON.stringify(data.field));
                    return true;
                });
            });
        </script>
</body>
</html>
