    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@include file="/static/commons.jspf"%>
        <html>
        <head>
        <title>Title</title>
        </head>
        <body>
            <input type="hidden" id="reflush">
        <button type="button" class="layui-btn" id="menu_add">新增</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm open-all">全部展开</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm close-all">全部关闭</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm change-icon">随机更换小图标</button>

        <table class="layui-table layui-form" id="tree-table" lay-size="sm"></table>


        <script type="text/javascript">
        layui.config({
        base: "${ctx}/static/plugins/layui_ext/treeTable/",
        })
        layui.use(['treeTable','layer','code','form','jquery','tree'],function(){
         var form = layui.form;
         var layer = layui.layer;
         var treeTable = layui.treeTable;
        var $=layui.jquery;
        var table = layui.table;
        var tree =layui.tree;

        // 直接下载后url: './data/table-tree.json',这个配置可能看不到数据，改为data:[],获取自己的实际链接返回json数组
        var	re = treeTable.render({
        elem: '#tree-table',
        id: 'demoId',//定义唯一索引
        url:'${ctx}/menu/menu_list',
        icon_key: 'menuName',
        primary_key: 'id',
        parent_key: 'pid',
        is_click_icon: false,
        end: function(e){
        form.render();
        },
        icon: {
        open: 'layui-icon layui-icon-triangle-d',
        close: 'layui-icon layui-icon-triangle-r',
        left: 16,
        },
        cols: [
        {
        key: 'menuName',
        title: '菜单名称',
        },
        {
        key: 'id',
        title: 'ID',
        },
        {
        key: 'permission',
        title: '权限',
        align: 'center',
        },
        {
        key: 'type',
        title: 'type',
        align: 'center',
        },
        {
        key: 'icon',
        title: 'icon',
        align: 'center',
        },
        {
        key: 'url',
        title: 'url',
        align: 'center',
        },
        {
        title: '操作',
        align: 'center',
        template: function(item){
        return '  <a lay-filter="add">添加</a>|<a lay-filter="delete">删除</a>|<a lay-filter="update">修改</a>';
        }
        }
        ]
        });
        treeTable.openAll(re);

        //刷新
        $('#reflush').on('click',function() {
            treeTable.render(re);
            })

        /*// 监听展开关闭
        treeTable.on('tree(flex)',function(data){
        layer.msg(JSON.stringify(data));
        })


        // 监听checkbox选择
        treeTable.on('tree(box)',function(data){
        if(o(data.elem).parents('#tree-table1').length){
        var text = [];
        o(data.elem).parents('#tree-table1').find('.cbx.layui-form-checked').each(function(){
        o(this).parents('[data-pid]').length && text.push(o(this).parents('td').next().find('span').text());
        })
        o(data.elem).parents('#tree-table1').prev().find('input').val(text.join(','));
        }
        layer.msg(JSON.stringify(data));
        })*/


        /*// 监听自定义
        treeTable.on('tree(add)',function(data){
        layer.msg(JSON.stringify(data));
        })



        // 获取选中值，返回值是一个数组（定义的primary_key参数集合）
        o('.get-checked').click(function(){
        layer.msg('选中参数'+treeTable.checked(re).join(','))
        })*/




        // 监听删除
        treeTable.on('tree(delete)',function(data){

        console.log(data.item.id);
        //利用ajax来完成单一删除

        $.ajax({
        url:'${ctx}/menu/deleteOne'
        ,type:'post'
        ,data:data.item.id
        ,dataType:'json'
        ,contentType:'application/json'
        ,success: function(msg){
        if (msg.rs){
        layer.msg("成功！",{icon:1});
            treeTable.render(re);
        }else {
        layer.msg("失败！",{icon:2});
        }
        }
        })

        });

        // 监听修改
        treeTable.on('tree(update)',function(data){
        layer.msg(JSON.stringify(data));

        //利用ajax来完成单一查询
        layer.open({
        type: 2,
        title :'修改',
        skin: 'layui-layer-molv',
        area: ['500px', '500px'],
        fixed: false, //不固定
        maxmin: true,
        content: "${ctx}/menu/one?id="+data.item.id
        });




        });

            // 监听添加
            treeTable.on('tree(add)',function(data){
            layer.msg(JSON.stringify(data));

            //利用ajax来完成单一查询
            layer.open({
            type: 2,
            title :'添加',
            skin: 'layui-layer-molv',
            area: ['500px', '500px'],
            fixed: false, //不固定
            maxmin: true,
            content: "${ctx}/menu/addone?id="+data.item.id
            });


            });



        // 新增顶级菜单操作
        $("#menu_add").on('click', function() {

            layer.open({
            type: 2,
            title :'新增',
            skin: 'layui-layer-molv',
            area: ['500px', '550px'],
            fixed: false, //不固定
            maxmin: true,
            content: 'menuadd.jsp'
            });

        })


        // 全部展开
            $('.open-all').click(function(){
        treeTable.openAll(re);
        })


        // 全部关闭
            $('.close-all').click(function(){
        treeTable.closeAll(re);
        })


        // 随机更换小图标
            $('.change-icon').click(function(){
        var arr = [
        {
        open: 'layui-icon layui-icon-set',
        close: 'layui-icon layui-icon-set-fill',
        left: 16,
        },
        {
        open: 'layui-icon layui-icon-rate',
        close: 'layui-icon layui-icon-rate-solid',
        left: 16,
        },
        {
        open: 'layui-icon layui-icon-tread',
        close: 'layui-icon layui-icon-praise',
        left: 16,
        },
        {
        open: 'layui-icon layui-icon-camera',
        close: 'layui-icon layui-icon-camera-fill',
        left: 16,
        },
        {
        open: 'layui-icon layui-icon-user',
        close: 'layui-icon layui-icon-group',
        left: 16,
        },
        ];
        var round = Math.round(Math.random()*(arr.length - 1));
        re.icon = arr[round];
        treeTable.render(re);
        })
            $('#tree1').on('click','[data-down]',function(){
            $(this).find('span').length && $(this).parents('.layui-unselect').find('input').val($(this).text());
        })
            $('.layui-select-title').click(function(){
            $(this).parent().hasClass('layui-form-selected') ? $(this).next().hide() : $(this).next().show(),$(this).parent().toggleClass('layui-form-selected');
        })
            $(document).on("click", function(i) {
        !$(i.target).parent().hasClass('layui-select-title') && !$(i.target).parents('table').length && !(!$(i.target).parents('table').length && $(i.target).hasClass('layui-icon')) && $(".layui-form-select").removeClass("layui-form-selected").find('.layui-anim').hide();
        })


        })

</script>
</body>
</html>

