<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>编辑用户的角色</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <div>
            <ul class="breadcrumb">
                <li>
                    <span class="ace-icon fa fa-home home-icon"></span>
                    <a href="${context.contextPath}/" target="_top">Home</a>
                </li>
                <li><a href="${context.contextPath}/role/list">角色列表</a></li>
                <li class="active">修改用户<span class="label">${user.realName}</span>角色</li>
            </ul>
        </div>
        <div>
            <ul class="breadcrumb">
                <li>
                    <span class="ace-icon fa fa-home home-icon"></span>
                    <a href="${context.contextPath}/" target="_top">Home</a>
                </li>
                <li><a href="${context.contextPath}/user/list/1">用户列表</a></li>
            </ul>
        </div>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form method="post" class="form-horizontal">
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
                        <dd><select id="role" tabindex="1" name="role">
                        <#if !(user.role.code)??>
                            <option checked=""></option></#if>
                        <#list roleTypes as roleType>
                            <option ${(((user.role.code)!(-1))=roleType.code)?string('selected="selected" ','')}value="${roleType.code}">${roleType.roleName}</option></#list>
                        </select></dd>
                        <dt>真实姓名</dt>
                        <dd>${(user.realName)!''}</dd>
                        <dt>年龄</dt>
                        <dd>${(user.age)!''}</dd>
                        <dt>地址</dt>
                        <dd>${(user.address)!''}</dd>
                        <dt>电话</dt>
                        <dd>${(user.phone)!''}</dd>
                        <dt>部门</dt>
                        <dd>${(user.group.name)!''}</dd>
                    </dl>
                    <div class="space-4"></div>
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-check bigger-110"></span>
                                提交角色修改
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                重置
                            </button>
                        </div>
                    </div>
                </form>
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