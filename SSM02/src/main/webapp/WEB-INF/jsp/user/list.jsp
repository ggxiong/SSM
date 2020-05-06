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
<button type="button" class="layui-btn layui-btn-danger" id="user_delete">删除</button>
<button type="button" class="layui-btn layui-btn-warm" id="user_set">修改</button>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo" >
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','element','layer','form'],function(){
        var element = layui.element;
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

        table.render({
            elem: '#test'
            ,url:'${ctx}/user/user_list'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id',  title: 'ID', sort: true}
                ,{field:'username', title: '用户名'}
                ,{field:'nickname',  title: '中文别名'}
                ,{field:'status', title: '状态', templet:function (res) {
                    if (res.status =="1") {
                        return '<input type="checkbox" data= "'+res.id+'" checked=""  lay-skin="switch" lay-filter="switchTest" lay-text="启用|禁用" value="1">';
                    }else {
                        return '<input type="checkbox" data= "'+res.id+'"  lay-skin="switch" lay-filter="switchTest" lay-text="启用|禁用" value="1">';
                    }


                    }}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": "0", //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res.records //解析数据列表
                };
            }
        });


        //添加
        $("#user_add").on('click', function() {
            layer.open({
                type: 2,
                title :'添加',
                skin: 'layui-layer-molv',
                area: ['450px', '550px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'useradd.jsp'
            });
            table.reload("test");
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


        //批量删除
        $("#user_delete").on('click', function() {
            console.log("我进来了");

            var checkStatus = table.checkStatus('test');
            console.log(checkStatus.data.length)

            if (checkStatus.data.length<=0){
                layer.msg("请选择要删除的数据！",{icon:2});
                return;
            }

            console.log(checkStatus.data);
            var ids =[];
            for (var o in checkStatus.data){
                ids.push(checkStatus.data[o].id)
            }


            //利用ajax来完成批量删除
            $.ajax({
                url:'${ctx}/user/delete'
                ,type:'post'
                ,data:JSON.stringify(ids)
                ,dataType:'json'
                ,contentType:'application/json'
                ,success: function(msg){
                    if (msg.rs){
                        layer.msg("成功！",{icon:1});
                        //重新渲染
                        table.reload("test")
                    }else {
                        layer.msg("失败！",{icon:2});
                    }
                }
            })


        });


        //单一删除
        table.on('tool(test)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event;
            var tr = obj.tr;

           if(layEvent === 'del'){ //删除
                layer.confirm('真的要删除吗', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);

                    console.log(data.id);

                    //利用ajax来完成单一删除
                    $.ajax({
                        url:'${ctx}/user/deleteOne'
                        ,type:'post'
                        ,data:data.id
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,success: function(msg){
                            if (msg.rs){
                                layer.msg("成功！",{icon:1});
                            }else {
                                layer.msg("失败！",{icon:2});
                            }
                        }
                    })

                });
            }else if(layEvent === 'edit') {
               console.log("进入了编辑")
               //编辑
               //利用ajax来完成单一查询
               layer.open({
                   type: 2,
                   title :'修改',
                   skin: 'layui-layer-molv',
                   area: ['450px', '550px'],
                   fixed: false, //不固定
                   maxmin: true,
                   content: "${ctx}/user/one?id="+data.id
               });
           }

        });


     //监听状态
        form.on('switch(switchTest)', function(data){

            var o ={};
            o.id = $(this).attr("data");
            o.status=data.elem.checked?1:-1;


            $.ajax({
                url:'${ctx}/user/set'
                ,type:'post'
                ,data:JSON.stringify(o)
                ,dataType:'json'
                ,contentType:'application/json'
                ,success: function(msg){
                    if (msg.rs){
                       layer.msg("成功！",{icon:1});
                    }else {
                        layer.msg("失败！",{icon:2});
                    }
                }
            });


        });





    });

</script>
</body>
</html>
