<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>添加一个新的用户</title>
</head>
<body>
<div class="container-fluid">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><a href="${context.contextPath}/user/list/1">用户列表</a></li>
            <li class="active">增加用户</li>
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
                        <div class="col-sm-offset-3 col-sm-4 alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                    class="fa fa-times"></span></button>
                        ${error}
                        </div>
                    </div>
                </#if>
                <#if errors??>
                    <#list errors as error>
                        <div class="row">
                            <div class="col-sm-offset-3 col-sm-4 alert alert-danger">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        class="fa fa-times"></span></button>
                            ${error}
                            </div>
                        </div>
                    </#list>
                </#if>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">用户名(必须是英文): </label>

                        <div class="col-sm-4">
                            <input name="username" type="text" size="30" class="form-control"
                                   placeholder="用户名" value="${(form.username)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">用户密码: </label>

                        <div class="col-sm-4">
                            <input class="form-control" id="password" type="password" name="password"
                                   placeholder="用户密码"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">确认密码: </label>

                        <div class="col-sm-4">
                            <input class="form-control" id="confirmPwd" name="confirmPwd" type="password"
                                   placeholder="确认密码"/>
							<span class="help-inline col-xs-12 col-sm-7">
								<span class="middle"></span>
							</span>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">真实姓名: </label>

                        <div class="col-sm-4">
                            <input name="realName" type="text" size="30" class="form-control"
                                   placeholder="真实姓名" value="${(form.realName)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">年龄: </label>

                        <div class="col-sm-4">
                            <input name="age" type="number" size="30" class="form-control"
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

                        <div class="col-sm-4">
                            <input name="address" type="text" size="30" class="form-control" placeholder="地址"
                                   value="${(form.address)!''}"/>
                        <#--<sf:errors class="errorContainer" path="email"/>-->
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">电话: </label>

                        <div class="col-sm-4">
                            <input name="phone" type="tel" size="30" class="form-control" placeholder="电话"
                                   value="${(form.phone)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group" title="绑定IP">
                        <label class="col-sm-3 control-label no-padding-right">绑定IP</label>

                        <div class="col-sm-4">
                            <input name="limitedIp" type="text" size="30" class="form-control" placeholder="绑定IP"
                                   value="${(form.limitedIp)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" title="角色">角色</label>

                        <div class="col-sm-4"><select id="role" class="form-control" tabindex="1" name="role"
                                                      title="角色">
                        <#assign roleChecked><#if !(form.role)??>checked=""</#if></#assign>
                            <option ${roleChecked!''} value="">选择角色</option>
                        <#list roleTypes as roleType>
                            <option ${((form.role)?? && form.role.code=roleType.code)?string('selected="selected" ','')}value="${roleType.code}">${roleType.roleName}</option></#list>
                        </select></div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" title="角色">部门</label>

                        <div class="col-sm-4"><select class="form-control" tabindex="1" name="groupId"
                                                      title="部门">
                        <#assign groupChecked><#if !(form.groupId)??>checked=""</#if></#assign>

                            <option ${groupChecked!''} value="">选择部门</option>
                        <#list groups as group>
                            <option ${((form.groupId)?? && form.groupId=group.id)?string('selected="selected" ','')}value="${group.id}">${group.name}</option>
                        </#list>
                        </select></div>
                    </div>

                <#--<div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">角色: </label>

                    <div class="col-sm-9">
                        <select name="roleId" class="col-xs-10 col-sm-5">
                        <#list roleTypes as roleType>
                            <option value="${roleType.code}">${roleType.roleName}</option>
                        </#list>
                        </select>
                    </div>
                </div>-->

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>添加
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>清空表单
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