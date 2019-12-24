$(function(){
    //1.抽取变量
    //2.将所有方法统一的管理
    //3.对按钮进行统一的监听
    var roleDatagrid,roleDialog,roleForm,allPermissions,selfPermissions;
    roleDatagrid = $("#role_datagrid");
    roleDialog = $("#role_dialog");
    roleForm = $("#role_form");
    allPermissions = $("#allPermissions");
    selfPermissions = $("#selfPermissions");

    roleDatagrid.datagrid({
        url: "/role_list",
        fit: true,
        fitColumns: true,
        rownumbers: true,
        pagination: true,
        singleSelect: true,
        toolbar: '#role_datagrid_tb',
        pageList: [1, 5, 10, 20],
        columns: [
            [
                {field: "sn", title: "角色编号", width: 1, align: 'center'},
                {field: "name", title: "角色名称", width: 1, align: 'center'}
            ]
        ]
    });

    //--------------------------------------大弹窗------------------------------------------
    roleDialog.dialog({
        width: 700,
        height: 450,
        buttons: '#role_diglog_bt',
        closed: true
    });


    //--------------------------------------弹窗左侧------------------------------------------
    allPermissions.datagrid({
        width: 300,
        height: 300,
        title:"所有权限",
        url:'/permission_list',
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        singleSelect:true,
        onDblClickRow:function(rowIndex,rowData){
            //判断
            //获取selfPermissions的权限集合，逐个判断
            //如果出现相同id，选中，否则新增
            var selfRows = selfPermissions.datagrid("getRows");
            var flag = false;
            var index = -1;
            for(var i = 0;i<selfRows.length;i++){
                if(selfRows[i].id==rowData.id){
                    flag = true;
                    index = i;
                    break;
                }
            }
            if (flag){
                //选中
                selfPermissions.datagrid("selectRow",index);
            } else{
                selfPermissions.datagrid('appendRow',rowData);
            }
        },
        columns:[[
            {title:"权限名", field:"name", width:1, align:"center"}
        ]]
    });
    var pagerOfAllPermissions = allPermissions.datagrid("getPager");
    pagerOfAllPermissions.pagination({
        showPageList:false,
        showRefresh:false,
        displayMsg:''
    });



    //--------------------------------------弹窗右侧------------------------------------------
    selfPermissions.datagrid({
        width: 300,
        height: 300,
        title:"已有权限",
        fitColumns:true,
        rownumbers:true,
        singleSelect:true,
        pagination:true,
        columns:[[
            {title:"权限名", field:"name", width:1, align:"center"}
        ]],
        onDblClickRow:function(rowIndex,rowData){
            selfPermissions.datagrid("deleteRow",rowIndex);
        }
    });
    var pagerOfSelfPermissions = selfPermissions.datagrid("getPager");
    pagerOfSelfPermissions.pagination({
        showPageList:false,
        showRefresh:false,
        displayMsg:''
    });

    //------------------------------------统一管理方法--------------------------------------
    var cmdObj = {

        //------------弹窗相关：跳转新增角色弹窗----------
        add: function () {
            roleDialog.dialog("open");
            roleDialog.dialog("setTitle", "新增");
            $("[name='id'],[name='sn'],[name='name']").val("");
            // 右侧载入空数据，而左侧会请求后端，查询所有的permission_list
            selfPermissions.datagrid("loadData", {rows:[]})// TODO 其实最好是能做一个支持再双击就删除的效果
        },

        //------------弹窗相关：新增/编辑角色----------
        save: function () {

            var idVal = $("#role_form [name='id']").val();
            var url;

            // 如果有id，说明是编辑；否则，是保存。
            if (idVal) {
                url = "/role_update";
            } else {
                url = "/role_save";
            }

            // 发送异步请求
            roleForm.form("submit", {
                url: url,
                // 由于roleForm表单提交只会拿到角色的sn和name，所以在提交前要设法把选择的权限也捎上
                onSubmit: function (param) {
                    // 从selfPermissions获取已选权限，额外添加一些参数到param，一同提交后台
                    var rows = selfPermissions.datagrid("getRows");
                    for (var i = 0; i < rows.length; i++) {
                        // 把右侧选中的权限id都设置进param中的permission数组：permission[0].id = xx, permission[1].id = xx, ...
                        param["permissions["+i+"].id"] = rows[i].id;
                    }
                },
                success: function (data) {
                    data = $.parseJSON(data);
                    if (data.success) {
                        $.messager.alert("温馨提示", data.msg, "info", function () {
                            // 关闭对话框
                            roleDialog.dialog("close");
                            // 刷新数据表格
                            roleDatagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", data.msg, "info")
                    }
                }
            });
        },

        //------------弹窗相关：跳转编辑角色弹窗----------
        edit: function () {
            // 获取到选中的数据（一整行，也就是一个role对象信息）
            var rowData = roleDatagrid.datagrid("getSelected");
            // 这里rowData不是boolean，但是只要非false都是true，所以这样判断也可
            if (rowData) {
                roleDialog.dialog("open");
                roleDialog.dialog("setTitle", "编辑");
                $("[name='id'], [name='sn'], [name='name']").val("");

                // 让右侧框也向后台发起请求，根据角色id查询对应的permission。而左侧本来就能向后台请求权限列表，不必额外设置
                var options = selfPermissions.datagrid("options");
                options.url = "/permission_queryByRid";
                selfPermissions.datagrid("load", {
                    rid:rowData.id,
                });

                // 把选中的数据显示到大的弹窗中
                roleForm.form("load", rowData);//把rowData加载到弹窗显示
            } else {
                $.messager.alert("温馨提示", "请选中一条需要编辑的数据", "info");
            }
        },

        //------------弹窗相关：取消弹窗----------
        cancel: function () {
            roleDialog.dialog("close");
        },

        //------------角色页面：删除角色----------
        del: function () {
            // 获取到选中的数据
            var rowData = roleDatagrid.datagrid("getSelected");
            if (rowData) {
                // 刷新数据表格
                $.messager.confirm("温馨提示", "您确定要删除这条数据吗？", function (yes) {
                    if (yes) {
                        $.get("/role_delete?id=" + rowData.id, function (data) {
                            if (data.success) {
                                $.messager.alert("温馨提示", data.msg, "info", function () {
                                    // 刷新表格数据
                                    roleDatagrid.datagrid("reload");
                                });
                            } else {
                                $.messager.alert("温馨提示", data.msg, "info");
                            }
                        }, "json");
                    }
                });
            } else {
                $.messager.alert("温馨提示", "请选择需要删除的角色", "info");
            }
        },

        //------------角色页面：刷新数据----------
        reload: function () {
            roleDatagrid.datagrid("reload");
        },

        //------------角色页面：高级查询----------
        find: function () {
            var keyword = $("[name='keyword']").val();
            roleDatagrid.datagrid("load", {
                keyword: keyword
            });

        }
    };

    //------------------------------------对按钮进行统一的监听-----------------------------------------
    $("a[data-cmd]").on("click", function () {
        var cmd = $(this).data("cmd");
        if (cmd) {
            cmdObj[cmd]();
        }
    });
});

