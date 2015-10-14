<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>填写顾客资料</title>
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

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><a href="${context.contextPath}/customer/list/1">顾客资源列表</a></li>
            <li class="active">填写顾客资源资料</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
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
        </div>
        <div class="row">
            <form method="post" class="form-horizontal">
                <div class="col-xs-6">
                <#--左列-->

                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">提交者: </label>

                        <div class="col-sm-2">
                            <div class="col-sm-12"><#if (loginUser.realName)??>${loginUser.realName}<#else><span
                                    class="label">不知道</span></#if></div>
                        </div>

                        <label class="col-sm-1 control-label no-padding-right">部门: </label>

                        <div class="col-sm-2">
                            <div class="col-sm-12">
                            <#if (loginUser.group.name)??>${loginUser.group.name}<#else>
                                <span class="label">没有部门</span></#if>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">姓名</label>

                        <div class="col-xs-6">
                            <input name="name" type="text" size="30" class="col-xs-12"
                                   placeholder="姓名" value="${(form.name)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">性别</label>

                        <div class="col-sm-2">
                            <select class="col-sm-12" name="sex">
                            <#list sexTypes as sexType>
                                <option value="${sexType.code}"
                                        <#if ((form.sex.code)!-1)=sexType.code>selected=""</#if>>${sexType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    <#--</div>-->

                    <#--<div class="form-group">-->
                    <#--<div class="space-4"></div>-->
                        <label class="col-sm-1 control-label no-padding-right">年龄</label>

                        <div class="col-sm-2">
                            <input class="col-sm-12" name="age" type="number" placeholder="年龄"
                                   value="${(form.age)!''}"/>
                        </div>

                        <label class="col-sm-1 control-label no-padding-right">边远: </label>

                        <div class="col-sm-2">
                            <select name="faraway" class="col-xs-12">
                                <option <#if (form.faraway)?? && form.faraway>selected=""</#if> value="1">边远</option>
                                <option <#if !(form.faraway)?? || !(form.faraway)>selected=""</#if> value="0">不边远
                                </option>
                            </select>
                        </div>

                        <label class="col-sm-1 control-label no-padding-right">紧急: </label>

                        <div class="col-sm-2">
                            <select name="emergency" class="col-xs-12">
                                <option <#if (form.emergency)?? && form.emergency>selected=""</#if> value="1">紧急
                                </option>
                                <option <#if !((form.emergency)??) || !(form.emergency)>selected=""</#if> value="0">不紧急
                                </option>
                            </select>
                        </div>
                    </div>

                <#--
                                    <div class="space-4"></div>
                                    <div class="form-group">
                                    </div>

                                    <div class="space-4"></div>
                                    <div class="form-group">
                                    </div>
                -->

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">地址</label>

                        <div class="col-sm-11">
                            <input name="address" type="text" size="30" class="col-xs-12"
                                   placeholder="地址" value="${(form.address)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">症状</label>

                        <div class="col-sm-11">
                            <input name="symptom" type="text" size="30" class="col-xs-12"
                                   placeholder="症状" value="${(form.symptom)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">邮件</label>

                        <div class="col-sm-6">
                            <input name="email" type="email" size="30" class="col-xs-12" placeholder="邮件"
                                   value="${(form.email)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">电话</label>

                        <div class="col-sm-5">
                            <input name="tel" type="tel" size="30" class="col-xs-12" placeholder="电话"
                                   value="${(form.tel)!''}"/>
                        </div>
                    </div>

                </div>
                <div class="col-xs-6">
                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">网站: </label>

                        <div class="col-sm-6">
                            <select name="website" class="col-xs-12" size="5">
                            <#list websites as website>
                                <option <#if (form.website.code)?? && form.website.code=website.code>selected=""</#if>
                                        value="${website.code}">${website.textName}</option>
                            </#list>
                            </select>
                        <#--<sf:errors class="errorContainer" path="email"/>-->
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">疾病类型: </label>

                        <div class="col-sm-6">
                            <select name="diseaseType" class="col-xs-12" size="5">
                            <#list diseaseTypes as diseaseType>
                                <option <#if ((form.diseaseType.code)!-1)=diseaseType.code>selected=""</#if>
                                        value="${diseaseType.code}">${diseaseType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">推广方式: </label>

                        <div class="col-sm-3">
                            <select name="accessPointType" class="col-xs-12" size="6">
                            <#list accessPointTypes as accessPointType>
                                <option
                                    <#if (form.accessPointType.code)?? && form.accessPointType.code=accessPointType.code>selected=""</#if>
                                    value="${accessPointType.code}">${accessPointType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-2 col-md-10">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>
<script type="text/javascript">
    $(function () {
        $("#addForm").cmsvalidate();
    });
</script>
</body>
</html>