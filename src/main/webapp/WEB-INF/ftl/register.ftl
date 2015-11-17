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
            /*try {
                ace.settings.check('breadcrumbs', 'fixed');
            } catch (e) {
            }*/
        </script>

        <ul class="breadcrumb">
            <li class="active">注册用户</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form method="post" id="addForm" class="form-horizontal">
                    <!-- #section:elements.form -->
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
                                   placeholder="用户名" value="${(form.username)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">用户密码: </label>

                        <div class="col-sm-9">
                            <input class="col-xs-10 col-sm-5" id="password" type="password" name="password"
                                   placeholder="用户密码"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">确认密码: </label>

                        <div class="col-sm-9">
                            <input class="col-xs-10 col-sm-5" id="confirmPwd" name="confirmPwd" type="password"
                                   placeholder="确认密码"/>
							<span class="help-inline col-xs-12 col-sm-7">
								<span class="middle"></span>
							</span>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">真实姓名: </label>

                        <div class="col-sm-9">
                            <input name="realName" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="真实姓名" value="${(form.realName)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">年龄: </label>

                        <div class="col-sm-9">
                            <input name="age" type="number" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="年龄" value="${(form.age)!''}"/>
                        </div>
                    </div>

                <#--
                                    <div class="space-4"></div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right">身份证号: </label>

                                        <div class="col-sm-9">
                                            <input name="idNumber" type="text" size="30" class="col-xs-10 col-sm-5" placeholder="身份证号"
                                                   value="${(form.idNumber)!''}"/>
                                        </div>
                                    </div>
                -->

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">地址: </label>

                        <div class="col-sm-9">
                            <input name="address" type="text" size="30" class="col-xs-10 col-sm-5" placeholder="地址"
                                   value="${(form.address)!''}"/>
                        <#--<sf:errors class="errorContainer" path="email"/>-->
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">电话: </label>

                        <div class="col-sm-9">
                            <input name="phone" type="tel" size="30" class="col-xs-10 col-sm-5" placeholder="电话"
                                   value="${(form.phone)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-9">
                            <a href="javascript:;" id="refresh"><img
                                    id="captchaImg" src="${context.contextPath}/login/captcha"/></a></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">验证码: </label>

                        <div class="col-sm-9">
                            <input name="captcha" type="tel" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="验证码"/>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-check bigger-110"></span>
                                注册
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                清空表单
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
            $('#captchaImg').attr('src', '${context.contextPath}/login/captcha?' + Date.now());
        });
    });
</script>

</body>
</html>