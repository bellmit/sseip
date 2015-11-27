<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>编辑用户的角色</title>
</head>
<body class="">
<div class="container-fluid">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            /*try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }*/
        </script>

        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb">
                            <li>
                                <span class="ace-icon fa fa-home home-icon"></span>
                                <a href="${context.contextPath}/" target="_top">Home</a>
                            </li>
                            <li><a href="${context.contextPath}/user/list/1">用户列表</a></li>
                            <li class="active">修改用户<span class="label">${user.realName}</span>的部门</li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb">
                            <li>
                                <span class="ace-icon fa fa-home home-icon"></span>
                                <a href="${context.contextPath}/" target="_top">Home</a>
                            </li>
                            <li><a href="${context.contextPath}/group/list/1">部门列表</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <!-- #section:elements.form -->
            <#if success??>
                <div class="row">
                    <div class="col-sm-offset-3 col-sm-4 alert alert-success">${success}</div>
                </div>
            </#if>
            <#if error??>
                <div class="row">
                    <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                </div>
            </#if>
            <#if errors??>
                <#list errors as error>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-4 alert alert-danger">${error}</div>
                    </div>
                </#list>
            </#if>

                <dl class="dl-horizontal">
                    <dt>用户名</dt>
                    <dd>${user.username}</dd>
                    <dt>角色</dt>
                    <dd>${(user.role.roleName)!'没有授予角色'}</dd>
                    <dt>真实姓名</dt>
                    <dd>${(user.realName)!''}</dd>
                    <dt>年龄</dt>
                    <dd>${(user.age)!''}</dd>
                    <dt>地址</dt>
                    <dd>${(user.address)!''}</dd>
                    <dt>电话</dt>
                    <dd>${(user.phone)!''}</dd>
                    <dt>所在部门</dt>
                    <dd>${(user.group.name)!''}</dd>
                </dl>
                <form method="post" class="form-horizontal" id="group-form">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <label><input type="radio" name="group" value="" <#if !((group.id)??)>checked=""</#if>>置空</label>
                            </div>
                        </div>
                    <#list groups as group>
                        <div class="row">
                            <div class="col-md-12">
                                <label><input type="radio" name="group" value="${group.id?long?c}"
                                              <#if (user.groupId)?? && group.id==user.groupId>checked=""</#if>>${group.name}
                                </label>
                            </div>
                        </div>
                    </#list>
                    </div>
                </form>
                <div class="space-4"></div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9"><span class="btn-group btn-corner">
                        <button class="btn btn-info" type="submit" form="group-form">
                            <span class="ace-icon fa fa-check bigger-110"></span>
                            提交部门修改
                        </button>
                        <button class="btn" type="reset">
                            <span class="ace-icon fa fa-undo bigger-110"></span>
                            重置
                        </button>
                    </span></div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>
<script type="text/javascript">
    $(function () {
//        $("#addForm").cmsvalidate();
        $("#refresh").click(function () {
            $('#captcha').attr('src', '${context.contextPath}/captcha?' + Date.now());
        });
    });
</script>

</body>
</html>