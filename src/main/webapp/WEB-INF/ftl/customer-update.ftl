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
                <form id="customer-update-form" method="post" class="form-horizontal">
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

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">姓名 </label>

                        <div class="col-xs-6">
                            <input name="patientName" type="text" size="30" class="col-xs-12"
                                   placeholder="姓名" value="${(customer.patientName)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">性别 </label>

                        <div class="col-sm-2">
                            <select class="col-sm-12" name="sex">
                            <#list sexTypes as sexType>
                                <option value="${sexType.code}"
                                        <#if ((customer.sex.code)!-1)=sexType.code>selected=""</#if>>${sexType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <div class="space-4"></div>
                        <label class="col-sm-1 control-label no-padding-right">年龄 </label>

                        <div class="col-sm-2">
                            <input class="col-sm-12" name="age" type="number" placeholder="年龄"
                                   value="${(customer.age)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">患者地址 </label>

                        <div class="col-xs-6">
                            <input name="patientAddress" type="text" size="30" class="col-xs-12"
                                   placeholder="患者地址" value="${(customer.patientAddress)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">患者国家 </label>

                        <div class="col-sm-2">
                            <select name="patientCountryId" class="col-xs-12" size="6">
                            <#list countries as country>
                                <option
                                    <#if (customer.patientCountryId)?? && customer.patientCountryId=country.id>selected=""</#if>
                                    value="${country.id}">${country.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">疾病类型 </label>

                        <div class="col-sm-6">
                            <select name="diseaseTypeId" class="col-xs-12" size="5">
                            <#list diseaseTypes as diseaseType>
                                <option
                                    <#if (customer.diseaseTypeId)?? && customer.diseaseTypeId=diseaseType.id>selected=""</#if>
                                    value="${diseaseType.id}">${diseaseType.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">症状 </label>

                        <div class="col-xs-6">
                            <input name="symptom" type="text" size="30" class="col-xs-12"
                                   placeholder="症状" value="${(customer.symptom)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">咨询人姓名 </label>

                        <div class="col-xs-6">
                            <input name="liaisonName" type="text" size="30" class="col-xs-12"
                                   placeholder="咨询人姓名" value="${(customer.liaisonName)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">咨询人地址 </label>

                        <div class="col-xs-6">
                            <input name="liaisonAddress" type="text" size="30" class="col-xs-12"
                                   placeholder="咨询人地址" value="${(customer.liaisonAddress)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">咨询人国家 </label>

                        <div class="col-sm-6">
                            <select name="liaisonCountryId" class="col-xs-12" size="6">
                            <#list countries as country>
                                <option
                                    <#if (customer.liaisonCountryId)?? && customer.liaisonCountryId=country.id>selected=""</#if>
                                    value="${country.id}">${country.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">咨患关系 </label>

                        <div class="col-xs-6">
                            <input name="relationship" type="text" size="30" class="col-xs-12"
                                   placeholder="咨患关系" value="${(customer.relationship)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">住院情况 </label>

                        <div class="col-sm-6">
                            <select name="hospitalization" class="col-xs-12" size="5">
                            <#list hospitalizationTypes as hospitalizationType>
                                <option
                                    <#if (customer.hospitalization)?? && customer.hospitalization.code=hospitalizationType.code>selected=""</#if>
                                    value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">紧急 </label>

                        <div class="col-sm-2">
                            <select name="emergency" class="col-xs-12">
                                <option <#if (customer.emergency)?? && customer.emergency>selected=""</#if> value="1">紧急
                                </option>
                                <option <#if !((customer.emergency)??) || !(customer.emergency)>selected=""</#if>
                                        value="0">不紧急
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">邮件地址 </label>

                        <div class="col-xs-6">
                            <input name="email" type="email" size="30" class="col-xs-12"
                                   placeholder="邮件地址" value="${(customer.email)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">电话 </label>

                        <div class="col-xs-6">
                            <input name="tel" type="tel" size="30" class="col-xs-12"
                                   placeholder="电话" value="${(customer.tel)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">网站 </label>

                        <div class="col-sm-6">
                            <select name="websiteId" class="col-xs-12" size="5">
                            <#list websites as website>
                                <option <#if (customer.websiteId)?? && customer.websiteId=website.id>selected=""</#if>
                                        value="${website.id}">${website.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">备忘</label>

                        <div class="col-xs-6">
                            <input name="memo" id="customer-memo" type="hidden" value="${(customer.memo?xhtml)!''}"/>
                        <#--<input name="memo" type="tel" size="30" class="col-xs-12" placeholder="备忘" value="${(customer.memo)!''}"/>-->
                            <div class="wysiwyg-editor" id="memo-editor">${(customer.memo)!''}</div>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">星级</label>

                        <div class="col-xs-6">
                            <input name="stars" type="tel" size="30" class="col-xs-12"
                                   placeholder="星级" value="${(customer.stars)!''}"/>
                        </div>
                    </div>


                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">有效性</label>

                        <div class="col-sm-2">
                            <select name="valid" class="col-xs-12">
                                <option <#if (customer.valid)?? && customer.valid>selected=""</#if> value="1">有效
                                </option>
                                <option <#if (customer.valid)?? && !(customer.valid)>selected=""</#if> value="0">无效
                                </option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">提交者: </label>

                        <div class="col-sm-2">
                            <div class="col-sm-12"><#if (customer.user.realName)??>${customer.user.realName}<#else><span
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

<script src="${context.contextPath}/resources/ace/assets/js/jquery.hotkeys.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootstrap-wysiwyg.js"></script>

<script type="text/javascript">
    $(function () {
        $('#memo-editor').ace_wysiwyg();
        $('#customer-update-form').on('submit', function () {
            $('#customer-memo').val($('#memo-editor').html());
        });
        $("#customer-update-form").cmsvalidate();
    });
</script>
</body>
</html>