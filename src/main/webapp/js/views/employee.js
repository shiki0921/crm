$(function(){
    //1.抽取变量
    //2.将所有方法统一的管理
    //3.对按钮进行统一的监听
    var empDatagrid,empDialog,empForm,empDatagridEditAndDel;
    empDatagrid = $("#emp_datagrid");
    empDialog = $("#emp_dialog");
    empForm = $("#emp_form");
    empDatagridEditAndDel = $("#emp_datagrid_edit,#emp_datagrid_del");

    empDatagrid.datagrid({
        url:"/employee_list",
        fit:true,
        fitColumns:true,
        rownumbers:true,
        pagination:true,
        singleSelect:true,
        toolbar:"#emp_datagrid_tb",
        pageList:[1,5,10,20],
        onClickRow: function(rowIndex,rowData){
            if (rowData.state){
                empDatagridEditAndDel.linkbutton("enable");
            } else{
                empDatagridEditAndDel.linkbutton("disable");
            }
        },
        columns: [
            [
                {field: "username", title: "用户名", width: 1, align: 'center'},
                {field: "realname", title: "真实姓名", width: 1, align: 'center'},
                {field: "tel", title: "电话", width: 1, align: 'center'},
                {field: "email", title: "邮箱", width: 1, align: 'center'},
                {field: "dept", title: "部门", width: 1, align: 'center', formatter:deptFormatter},
                {field: "inputtime", title: "入职时间", width: 1, align: 'center'},
                {field: "state", title: "状态", width: 1, align: 'center',formatter:stateFormatter},
                {field: "admin", title: "是否超级管理员", width: 1, align: 'center',formatter:adminFormatter}
            ]
        ]
    });

    empDialog.dialog({
        width:400,
        height:400,
        buttons:"#emp_diglog_bt",
        closed:true
    });

    var cmdObj = {
        add:function() {
            empDialog.dialog("open");
            empDialog.dialog("setTitle","新增");
            empForm.form("clear");
        },

        save:function(){
            var idVal = $("#emp_form [name='id']").val();
            var url;
            // 如果有id，说明是编辑；否则，是保存。
            if (idVal) {
                url = "/employee_update";
            } else {
                url = "/employee_save";
            }
            empForm.form("submit",{
                url:url,
                onSubmit:function(param){
                    var ids = $("#employee_roleCombo").combobox("getValues");
                    console.log(ids);
                    for(var i = 0;i<ids.length;i++){
                        param["roles["+i+"].id"] = ids[i];
                    }
                },
                success:function (data) {
                    data = $.parseJSON(data);
                    console.log(data);
                    if (data.success){
                        $.messager.alert("温馨提示",data.msg,"info",function () {
                            //关闭对话框
                            empDialog.dialog("close");
                            //刷新数据表格
                            empDatagrid.datagrid("load");
                        });


                    } else{
                        $.messager.alert("温馨提示",data.msg,"info");
                    }
                }
            });
        },

        edit:function() {
            //获取选中的数据
            var rowData = empDatagrid.datagrid("getSelected");
            if (rowData){
                empDialog.dialog("open");
                empDialog.dialog("setTitle","编辑");
                empForm.form("clear");
                //特殊属性的处理
                if (rowData.dept){
                    rowData["dept.id"] = rowData.dept.id;
                }
                empForm.form("load",rowData);//基于同名匹配规则

                //发送请求到后台查询这个员工对应的角色id--->List<String>
                //$.post  $.get默认都是异步请求，同步请求必须使用$.ajax
                var html = $.ajax({
                    url: "/role_queryRoleIdByEid?eid="+rowData.id,
                    async: false
                }).responseText;
                html = $.parseJSON(html);
                $("#employee_roleCombo").combobox("setValues",html);
            } else{
                $.messager.alert("温馨提示","请选中一条需要编辑的数据","info");
            }

        },

        del:function() {
            //获取选中的数据
            var rowData = empDatagrid.datagrid("getSelected");
            if (rowData){
                $.messager.confirm("温馨提示","您确定需要删除这条数据吗?",function (yes) {
                    if (yes){
                        $.get("/employee_delete?id="+rowData.id,function (data) {
                            if (data.success){
                                $.messager.alert("温馨提示",data.msg,"info",function () {
                                    //刷新数据表格
                                    empDatagrid.datagrid("reload");
                                });
                            }else{
                                $.messager.alert("温馨提示",data.msg,"info");
                            }
                        },"json");
                    }
                });
            } else{
                $.messager.alert("温馨提示","请选中一条需要离职的员工","info");
            }
        },

        reload:function() {
            empDatagrid.datagrid("reload");
        },

        cancel:function() {
            empDialog.dialog("close");
        },

        find:function() {
            var keyword = $("[name='keyword']").val();
            empDatagrid.datagrid("load",{
                keyword:keyword
            });
        }

    };

    // 对按钮进行统一的监听
    $("a[data-cmd]").on("click", function () {
        var cmd = $(this).data("cmd");
        if (cmd) {
            cmdObj[cmd]();
        }
    });
});


function deptFormatter(value,record,index){
    return value ? value.name : value;
}

function stateFormatter(value, record, index) {
    return value ? "<font color='green'>正常</font>" : "<font color='red'>离职</font>";
}

function adminFormatter(value, record, index) {
    return value ? "是" : "否";
}