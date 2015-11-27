<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>当前用户资料页</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active">个人资料</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <dl class="dl-horizontal">
                    <dt>id</dt>
                    <dd>${loginUser.id?long?c}</dd>
                    <dt>用户名</dt>
                    <dd>${loginUser.username}</dd>
                    <dt>真实姓名</dt>
                    <dd>${(loginUser.realName)!'没写'}</dd>
                    <dt>年龄</dt>
                    <dd>${(loginUser.age)!'没写'}</dd>
                    <dt>身份证号</dt>
                    <dd>${(loginUser.idNumber)!'没写'}</dd>
                    <dt>地址</dt>
                    <dd>${(loginUser.address)!'没写'}</dd>
                    <dt>电话</dt>
                    <dd>${(loginUser.phone)!'没写'}</dd>
                    <dt>注册时间</dt>
                    <dd>${loginUser.added?string('yyyy-MM-dd, HH:mm:ss')}</dd>
                    <dt>部门</dt>
                    <dd>${(loginUser.group.name)!'<span class="label">不属于部门</span>'}</dd>
                    <dt>角色</dt>
                    <dd>${(loginUser.role.roleName)!'<span class="label">没有角色</span>'}</dd>
                </dl>
            </div>
            <div class="col-xs-12">
                <a href="javascript:history.go(-1);"><span class="fa fa-backward"></span>“后退”</a>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
</body>
</html>