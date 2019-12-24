<%--
  Created by IntelliJ IDEA.
  User: shiki
  Date: 2019/12/1
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.shiki.com/java/crm" prefix="myFn"%>
<html>
<head>
    <title>员工管理</title>
    <%@include file="common.jsp"%>
    <script type="text/javascript" src="/js/views/employee.js"></script>
</head>
<body>
<table id="emp_datagrid"></table>
<!--数据表格的顶部按钮-->
<div id="emp_datagrid_tb">
    <div>
        <c:if test="${myFn:checkPermission('com.shiki.crm.web.controller.EmployeeController:save')}">
            <a class="easyui-linkbutton" iconCls="icon-add" plain="true" data-cmd="add">新增</a>
        </c:if>
        <c:if test="${myFn:checkPermission('com.shiki.crm.web.controller.EmployeeController:update')}">
            <a id="emp_datagrid_edit" class="easyui-linkbutton" iconCls="icon-edit" plain="true" data-cmd="edit">编辑</a>
        </c:if>
        <a id="emp_datagrid_del" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-cmd="del">离职</a>
        <a class="easyui-linkbutton" iconCls="icon-reload" plain="true" data-cmd="reload" data-cmd="reload">刷新</a>
    </div>
    <div>
        关键字查询：<input name="keyword"><a class="easyui-linkbutton" iconCls="icon-search" data-cmd="find">搜索</a>
    </div>
</div>

<!--对话框-->
<div id="emp_dialog">
    <form id="emp_form" method="post">
        <table align="center" style="margin-top: 15px">
            <!--隐藏域，用于判断是新增还是编辑-->
            <input type="hidden" name="id">
            <tr>
                <td>账号</td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td>真实姓名</td>
                <td><input type="text" name="realname"/></td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td><input type="text" name="tel"/></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email"/></td>
            </tr>
            <tr>
                <td>部门</td>
                <td>
                    <input type="text" name="dept.id" class="easyui-combobox"
                           data-options="valueField:'id', textField:'name', url:'/department_queryForEmployee'">
                </td>
            </tr>
            <tr>
                <td>角色</td>
                <td>
                    <input type="text" class="easyui-combobox" id="employee_roleCombo"
                           data-options="valueField:'id', textField:'name', url:'/role_queryRoleForEmp',multiple:true">
                </td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td><input type="text" name="inputtime" class="easyui-datebox"/></td>
            </tr>
        </table>
    </form>
</div>
<!--对话框底部按钮-->
<div id="emp_diglog_bt">
    <a class="easyui-linkbutton" iconCls="icon-save" plain="true" data-cmd="save">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" data-cmd="cancel">取消</a>
</div>
</body>
</html>
