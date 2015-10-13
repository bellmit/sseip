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

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><a href="${context.contextPath}/customer/list/1">客户资源列表</a></li>
            <li class="active">更新客户资源资料</li>
        </ul>
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
                            <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                        </div>
                    </#list>
                </#if>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">姓名</label>

                        <div class="col-sm-9">
                            <input name="name" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="姓名" value="${(customer.name)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">性别</label>

                        <div class="col-sm-9">
                            <select class="col-xs-10 col-sm-5" name="sex">
                            <#list sexTypes as sexType>
                                <option value="${sexType.code}"
                                        <#if (customer.sex)?? && customer.sex.code=sexType.code>selected=""</#if>>${sexType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">年龄</label>

                        <div class="col-sm-9">
                            <input class="col-xs-10 col-sm-5" name="age" type="text" placeholder="年龄"
                                   value="${(customer.age)!''}"/>
							<span class="help-inline col-xs-12 col-sm-7">
								<span class="middle"></span>
							</span>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">地址</label>

                        <div class="col-sm-9">
                            <input name="address" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="地址" value="${(customer.address)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">症状</label>

                        <div class="col-sm-9">
                            <input name="symptom" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="症状" value="${(customer.symptom)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">电子邮件</label>

                        <div class="col-sm-9">
                            <input name="email" type="email" size="30" class="col-xs-10 col-sm-5" placeholder="电子邮件"
                                   value="${(customer.email)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">电话</label>

                        <div class="col-sm-9">
                            <input name="tel" type="tel" size="30" class="col-xs-10 col-sm-5" placeholder="电话"
                                   value="${(customer.tel)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">网站: </label>

                        <div class="col-sm-9">
                            <select name="website" class="col-xs-10 col-sm-5" size="5">
                            <#list websites as website>
                                <option
                                    <#if (customer.website)?? && customer.website.code=website.code>selected=""</#if>
                                    value="${website.code}">${website.textName}</option>
                            </#list>
                            </select>
                        <#--<sf:errors class="errorContainer" path="email"/>-->
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">疾病类型: </label>

                        <div class="col-sm-9">
                            <select name="diseaseType" class="col-xs-10 col-sm-5" size="5">
                            <#list diseaseTypes as diseaseType>
                                <option
                                    <#if (customer.diseaseType)?? && customer.diseaseType.code=diseaseType.code>selected=""</#if>
                                    value="${diseaseType.code}">${diseaseType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">客户接入点类型: </label>

                        <div class="col-sm-9">
                            <select name="accessPointType" class="col-xs-10 col-sm-5" size="6">
                            <#list accessPointTypes as accessPointType>
                                <option
                                    <#if (customer.accessPointType)?? && customer.accessPointType.code=accessPointType.code>selected=""</#if>
                                    value="${accessPointType.code}">${accessPointType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">遥远: </label>

                        <div class="col-sm-9">
                            <select name="faraway" class="col-xs-10 col-sm-5">
                                <option <#if (customer.faraway)?? && customer.faraway>selected=""</#if> value="1">遥远
                                </option>
                                <option <#if !(customer.faraway)?? || !(customer.faraway)>selected=""</#if> value="0">不远
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">急救: </label>

                        <div class="col-sm-9">
                            <select name="emergency" class="col-xs-10 col-sm-5">
                                <option <#if (customer.emergency)?? && customer.emergency>selected=""</#if> value="1">急救
                                </option>
                                <option <#if !((customer.emergency)??) || !(customer.emergency)>selected=""</#if>
                                        value="0">不急救
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">提交者: </label>

                        <div class="col-sm-9"><#if (loginUser.realName)??>${loginUser.realName}<#else><span
                                class="label">没有部门</span></#if></div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">归属部门: </label>

                        <div class="col-sm-9">
                        <#if (loginUser.group.name)??>${loginUser.group.name}<#else>
                            <span
                                    class="label">没有部门</span></#if>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交更改
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置表单
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
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>
<script type="text/javascript">
    $(function () {
        $("#addForm").cmsvalidate();
    });
</script>
</body>
</html>