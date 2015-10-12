<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>添加一个新的用户</title>
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

        <div class="row">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <span class="ace-icon fa fa-home home-icon"></span>
                        <a href="${context.contextPath}/" target="_top">Home</a>
                    </li>
                    <li><a href="${context.contextPath}/user/list/1">用户列表</a></li>
                    <li class="active">修改用户<span class="label">${user.realName}</span>的信息</li>
                </ul>
            </div>
        </div>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form method="post" id="addForm" class="form-horizontal"><input type="hidden" name="referer"
                                                                                value="${referer}">
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
                            <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                        </div>
                    </#list>
                </#if>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">用户名(必须是英文): </label>

                        <div class="col-sm-9">
                            <input name="username" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="用户名" value="${(user.username)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">真实姓名: </label>

                        <div class="col-sm-9">
                            <input name="realName" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="真实姓名" value="${(user.realName)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">年龄: </label>

                        <div class="col-sm-9">
                            <input name="age" type="number" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="年龄" value="${(user.age)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">身份证号: </label>

                        <div class="col-sm-9">
                            <input name="idNumber" type="text" size="30" class="col-xs-10 col-sm-5" placeholder="身份证号"
                                   value="${(user.idNumber)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">地址: </label>

                        <div class="col-sm-9">
                            <input name="address" type="text" size="30" class="col-xs-10 col-sm-5" placeholder="地址"
                                   value="${(user.address)!''}"/>
                        <#--<sf:errors class="errorContainer" path="email"/>-->
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">电话: </label>

                        <div class="col-sm-9">
                            <input name="phone" type="tel" size="30" class="col-xs-10 col-sm-5" placeholder="电话"
                                   value="${(user.phone)!''}"/>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交修改
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>恢复原状
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
        $("#addForm").cmsvalidate();
        $("#refresh").click(function () {
            $('#captcha').attr('src', '${context.contextPath}/captcha?' + Date.now());
        });
    });
</script>

</body>
</html>