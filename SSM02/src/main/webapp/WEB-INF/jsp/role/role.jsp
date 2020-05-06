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


<button type="button" class="layui-btn" id="role_add">新增</button>
<button type="button" class="layui-btn layui-btn-danger" id="role_delete">删除</button>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo" >
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','element','layer'],function(){
        var element = layui.element;
        var table = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;

        table.render({
            elem: '#test'
            ,url:'${ctx}/role/role_list'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id',  title: 'ID', sort: true}
                ,{field:'role', title: '角色'}
                ,{field:'roleName',  title: '角色别名'}
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
        $("#role_add").on('click', function() {
            layer.open({
                type: 2,
                title :'添加',
                skin: 'layui-layer-molv',
                area: ['450px', '550px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'roleadd.jsp'
            });
            table.reload("test");
        });




        //批量删除
        $("#role_delete").on('click', function() {
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
                url:'${ctx}/role/delete'
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
                        url:'${ctx}/role/deleteOne'
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
                   content: "${ctx}/role/one?id="+data.id
               });
           }

        });








    });

</script>
</body>
</html>
