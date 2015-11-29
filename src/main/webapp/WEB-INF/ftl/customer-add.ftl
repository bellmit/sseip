<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>填写顾客资料</title>
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/self/select2/css/select2.css"/>
    <link rel="stylesheet" href="${context.contextPath}/resources/self/daterangepicker.css"/>
    <style>
        .form-group {
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
<div class="container-fluid"><!-- #section:basics/content.breadcrumbs -->
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
            <li class="active"><span class="fa fa-file-o light-grey"></span>添加资源</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
        <#if (RequestParameters.success)??>
            <div class="row">
                <div class="col-sm-offset-3 col-sm-4 alert alert-success">执行完成</div>
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
            <div class="col-xs-12">
            <#--左列-->
                <form method="post" class="form-horizontal" id="customer-add-form">
                    <div class="col-sm-12">

                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-11">
                                <div style="margin-bottom: 4px;"><span class="btn-group btn-corner">
                            <button class="btn btn-success btn-sm" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn btn-warning btn-sm" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button></span></div>
                            </div>
                        </div>
                        <div class="space-4"></div>

                        <div class="row">
                            <div class="col-xs-12">
                            <#--折叠栏开始-->
                                <div class="accordion-style1 panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle collapsed" data-toggle="collapse"
                                                   data-parent="#accordion" href="#collapseOne">
                                            <span data-icon-show="ace-icon fa fa-plus-square"
                                                  data-icon-hide="ace-icon fa fa-minus-square-o"
                                                  class="bigger-110 ace-icon fa fa-plus-square"></span>展开补充咨询人信息</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <#--折叠栏内容开始-->

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                            <#--<label class="col-md-2 control-label no-padding-right">姓名</label>-->

                                                                <input data-toggle="tooltip-a" name="liaisonName"
                                                                       type="text" size="30" class="form-control"
                                                                       placeholder="咨询人姓名" title="咨询人姓名"
                                                                       value="${(customer.liaisonName)!''}"/>

                                                            <#--<div class="col-md-12">
                                                            </div>-->
                                                            </div>
                                                        </div>

                                                        <div data-toggle="tooltip-a" class="col-md-3" title="咨询人国家">
                                                            <div class="form-group">
                                                            <#--<label class="col-md-2 control-label no-padding-right">国家</label>-->

                                                                <select name="liaisonCountryId"
                                                                        class="form-control select2-ui"
                                                                        style="width:100%">
                                                                    <option value=""
                                                                            <#if !(customer.liaisonCountryId)?? >selected=""</#if>>
                                                                        选择咨询人国家
                                                                    </option>
                                                                <#list countries as country>
                                                                    <option
                                                                        <#if (customer.liaisonCountryId)?? && customer.liaisonCountryId=country.id>selected=""</#if>
                                                                        value="${country.id?long?c}">${country.a2Code}
                                                                        - ${country.name}
                                                                        - ${country.nameEn}</option>
                                                                </#list>
                                                                </select>
                                                            <#--<div class="col-md-12">
                                                            </div>-->
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                            <#--<label class="col-md-2 control-label no-padding-right">关系 </label>-->

                                                                <div class="col-md-12">
                                                                    <input data-toggle="tooltip-a" name="relationship"
                                                                           type="text" size="30" class="form-control"
                                                                           placeholder="咨患关系" title="咨患关系"
                                                                           value="${(customer.relationship)!''}"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                <#--左列结束-->
                                                </div>

                                            <#--折叠栏内容结束-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#--折叠栏结束-->
                            </div>
                        </div>

                    <#--资料填写主题内容行-->
                        <div class="row">
                            <div class="col-md-12">

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-md-2 control-label no-padding-right">姓名</label>-->

                                            <div class="col-md-12">
                                                <input data-toggle="tooltip-a" name="patientName" type="text" size="30"
                                                       class="form-control" placeholder="患者姓名"
                                                       value="${(customer.patientName)!''}" title="患者姓名"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">年龄 </label>-->

                                            <div class="col-md-12">
                                                <input data-toggle="tooltip-a" class="form-control" name="age"
                                                       type="number" placeholder="年龄" title="年龄"
                                                       value="${(customer.age)!''}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-2 control-label no-padding-right">性别</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" class="form-control" name="sex"
                                                        title="性别">
                                                    <option value="">选择性别</option>
                                                <#list sexTypes as sexType>
                                                    <option value="${sexType.code}"
                                                            <#if (customer.sex.code)?? && customer.sex.code=sexType.code>selected=""</#if>>${sexType.textName}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        <#--<label class="col-md-2 control-label no-padding-right">症状</label>-->

                                            <div class="col-md-12">
                                                <input data-toggle="tooltip-a" name="symptom" class="form-control"
                                                       placeholder="症状" title="症状"
                                                       value="${(customer.symptom?xhtml)!''}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">Email</label>-->

                                            <div class="col-md-12">
                                                <input data-toggle="tooltip-a" name="email" type="email"
                                                       class="form-control" placeholder="电子邮件地址" title="电子邮件地址"
                                                       value="${(customer.email)!''}"/></div>
                                        </div>

                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">电话 </label>-->

                                            <div class="col-md-12">
                                                <input data-toggle="tooltip-a" name="tel" type="tel" size="30"
                                                       class="form-control" title="电话号码" placeholder="电话号码"
                                                       value="${(customer.tel)!''}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-toggle="tooltip-a" class="col-md-2" title="网站群组">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">群组</label>-->

                                            <div class="col-md-12">
                                                <select name="websiteId" class="form-control select2-ui"
                                                        style="width:100%;">
                                                    <option <#if (customer.websiteId)??>selected=""</#if> value="">
                                                        选择网站群组
                                                    </option>
                                                <#list websites as website>
                                                    <option
                                                        <#if (customer.websiteId)?? && customer.websiteId=website.id>selected=""</#if>
                                                        value="${website.id?long?c}">${website.name}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right"
                                               title="是否报备">报备</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" name="ifReport" class="form-control"
                                                        title="是否报备">
                                                    <option
                                                    <#if !((customer.ifReport)??) || !(customer.ifReport)>selected=""</#if>
                                                    value="0">不报备
                                                    </option>
                                                    <option
                                                    <#if (customer.ifReport)?? && customer.ifReport>selected=""</#if>
                                                    value="1">报备
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right">有效性</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" name="valid" class="form-control"
                                                        title="是否有效">
                                                    <option <#if (customer.valid)?? && customer.valid>selected=""</#if>
                                                            value="1">有效
                                                    </option>
                                                    <option
                                                    <#if (customer.valid)?? && !(customer.valid)>selected=""</#if>
                                                    value="0">无效
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div data-toggle="tooltip-a" class="col-md-3" title="疾病类型">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right">疾病类型</label>-->

                                            <div class="col-md-12">
                                                <select name="diseaseTypeId" class="form-control select2-ui"
                                                        style="width:100%;">
                                                    <option <#if !(customer.diseaseTypeId)??>selected=""</#if> value="">
                                                        选择疾病类型
                                                    </option>
                                                <#list diseaseTypes as diseaseType>
                                                    <option
                                                        <#if (customer.diseaseTypeId)?? && customer.diseaseTypeId=diseaseType.id>selected=""</#if>
                                                        value="${diseaseType.id?long?c}">${diseaseType.name}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div data-toggle="tooltip-a" class="col-md-3" title="患者国家">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">地址</label>-->

                                            <div class="col-md-12">
                                                <select name="patientCountryId" class="form-control select2-ui"
                                                        style="width:100%;">
                                                    <option
                                                    <#if !(customer.patientCountryId)?? >selected=""</#if>
                                                    value="">选择患者国家
                                                    </option>
                                                <#list countries as country>
                                                    <option
                                                        <#if (customer.patientCountryId)?? && customer.patientCountryId=country.id>selected=""</#if>
                                                        value="${country.id?long?c}">${country.a2Code} - ${country.name}
                                                        - ${country.nameEn}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-4 control-label no-padding-right">紧急</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" name="emergency" class="form-control"
                                                        title="是否紧急">
                                                    <option
                                                    <#if (customer.emergency)?? && customer.emergency>selected=""</#if>
                                                    value="1">紧急
                                                    </option>
                                                    <option
                                                    <#if !((customer.emergency)??) || !(customer.emergency)>selected=""</#if>
                                                    value="0">不紧急
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-4 control-label no-padding-right"
                                               title="住院情况">是否住院</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" name="hospitalization"
                                                        class="form-control" title="是否住院">
                                                    <option<#if !(customer.hospitalization)?? > selected=""</#if>
                                                                                                value="">
                                                        选择是否住院
                                                    </option>
                                                <#list hospitalizationTypes as hospitalizationType>
                                                    <option
                                                        <#if (customer.hospitalization)?? && customer.hospitalization.code=hospitalizationType.code>selected=""</#if>
                                                        value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-toggle="tooltip-a" class="col-md-2">
                                        <div class="form-group" title="患者意向">
                                        <#--<label class="col-sm-3 control-label no-padding-right"
                                               title="患者意向">意向</label>-->

                                            <div class="col-md-12">
                                                <input name="stars" id="form-stars" type="hidden"
                                                       value="${(customer.stars)!'3'}"/>

                                                <div id="stars-ui" data-init-score="${(customer.stars)!'3'}"
                                                     class="rating inline"
                                                     title="患者意向"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-md-2 control-label no-padding-right"></label>-->

                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-sm btn-default" type="button"
                                                                id="revisit-date-clear">清除
                                                        </button>
                                                    <#--<span class="ace-icon fa fa-calendar bigger-110"></span>-->
                                                    </span>

                                                    <div data-toggle="tooltip-a" class="input-icon input-icon-right"
                                                         title="选择下次回访日期">
                                                        <input type="text" class="form-control" id="revisit-date-picker"
                                                               placeholder="选择下次回访日期"
                                                               value="${(customer.revisitDate?string("yyyy年MM月dd日"))!''}"/>
                                                    <#--class="form-control input-mask-date"-->
                                                    <#--<input type="date" name="revisitDate" class="form-control"
                                                           placeholder="回访日期"/>-->
                                                        <span class="ace-icon fa fa-calendar red2"></span>
                                                    </div>
                                                    <input type="hidden" id="revisit-date-field" name="revisitDate"
                                                           data-init-value="${(customer.revisitDate?string("yyyy-MM-dd"))!''}">
                                                <#--${(customer.revisitDate?long?c)!''}-->
                                                </div>
                                            </div>

                                        <#--<div class="col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-sm btn-default"
                                                            type="button">
                                                        <span class="ace-icon fa fa-calendar bigger-110"></span>Go!
                                                    </button>
                                                </span>
                                                <input class="form-control input-mask-date" type="date"/>4
                                            </div>
                                        </div>-->

                                        <#--<div class="col-md-12">
                                            <div class="input-icon input-icon-right ">
                                                <input type="date" name="revisitDate" class="form-control"
                                                       placeholder="回访日期"/>
                                                <span class="ace-icon fa fa-calendar green"></span>
                                            </div>
                                        </div>-->

                                        <#--<div class="col-md-12">
                                            <input name="revisitDate" type="date" class="form-control"
                                                   placeholder="回访日期" value="${(customer.revisitDate)!''}"
                                                   title="回访日期"/>
                                        </div>-->

                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-4 control-label no-padding-right">紧急</label>-->

                                            <div class="col-md-12">
                                                <select data-toggle="tooltip-a" name="emailSent" class="form-control"
                                                        title="是否发送了邮件">
                                                    <option
                                                    <#if (customer.emailSent)?? && customer.emailSent>selected=""</#if>
                                                    value="1">邮件已发送
                                                    </option>
                                                    <option
                                                    <#if !((customer.emailSent)??) || !(customer.emailSent)>selected=""</#if>
                                                    value="0">邮件未发送
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#--第四行结束-->

                            </div>
                        <#--第一列结束-->
                        </div>
                    <#--第一大行结束-->

                    <#--第二大行，放置两个框-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12" title="备注">
                                    <#--<label class="col-xs-1 control-label no-padding-right"></label>-->
                                        <div class="row">
                                        <#--col-md-offset-1-->
                                            <div class="col-md-12">
                                                <label>备注</label>
                                            <#--<span class="btn-group btn-corner"><a
                                                class="btn btn-success btn-minier" id="memo-submit-control"><span
                                                class="ace-icon fa fa-plus bigger-110"></span>提交
                                        </a></span>-->
                                            </div>
                                        </div>

                                        <div class="row">
                                        <#--col-md-offset-1-->
                                            <div class="col-md-12">
                                                <textarea data-toggle="tooltip-a" name="memoItem" class="form-control"
                                                          style="resize: vertical;" placeholder="备注" id="textarea-memo"
                                                          title="备注"></textarea>
                                            </div>
                                        </div>

                                    <#--col-md-offset-1-->
                                    <#--<div class="row">
                                        <div class="col-md-12">
                                            <div class="well"
                                                 style="min-height:10em;max-height:30em;word-wrap:break-word;overflow-y:auto;">
                                                <ul id="memo-ul-container">
                                                <#if (customer.memos)?? && customer.memos?size gt 0>
                                                    <#list customer.memos as memo>
                                                        <li><span class="blue">${memo.content?html}</span> -
                                                            <span class="text-warning">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                            -
                                                            <span class="text-primary">${(memo.user.realName)!''}</span>
                                                        </li>
                                                    </#list>
                                                </#if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>-->
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12" title="通讯记录">

                                        <div class="row">
                                        <#--<div class="col-md-12">
                                            <label>通讯记录</label>
                                        </div>-->
                                        <#--col-sm-offset-1-->
                                            <div class="col-md-12">
                                            <#--<span id="source-website" title="来源域名" class="col-xs-12"></span>-->
                                                <label title="来源域名">来源域名: <span id="source-website"
                                                                                class="gold"></span></label>
                                            <#--<div class="col-xs-12">
                                            </div>-->
                                            </div>
                                        </div>
                                        <div class="row">
                                        <#--col-md-offset-1-->
                                            <div class="col-md-12">
                                                <div class="btn-toolbar smaller-80" data-role="editor-toolbar"
                                                     data-target="#contact-records-editor">
                                                    <div class="btn-group">
                                                        <a data-toggle="tooltip-a" class="btn btn-default"
                                                           data-edit="undo" title="反悔 (Ctrl/Cmd+Z)"><span
                                                                class="ace-icon fa fa-undo"></span></a>
                                                        <a data-toggle="tooltip-a" class="btn btn-default"
                                                           data-edit="redo" title="撤销 (Ctrl/Cmd+Y)"><span
                                                                class="fa fa-repeat"></span></a>
                                                    <#--<a class="btn btn-default" data-edit="html"
                                                       title="Clear Formatting"><span
                                                            class='glyphicon glyphicon-pencil'></span></a>-->
                                                        <a data-toggle="tooltip-a" class="btn btn-default"
                                                           data-edit="clearformat" title="清除格式"
                                                           onClick="$('#contact-records-editor').text($('#contact-records-editor').text());"><span
                                                                class="glyphicon glyphicon-fire"></span></a>
                                                        <a data-toggle="tooltip-a" class="btn btn-default"
                                                           id="control-append-newline"
                                                           title="结尾填充新行"><span class="fa fa-code"></span></a>
                                                        <a data-toggle="tooltip-a" class="btn btn-default" title="源码编辑"
                                                           data-edit="html"><span
                                                                class="glyphicon glyphicon-pencil"></span></a>
                                                    </div>
                                                </div>
                                                <div data-toggle="tooltip-a" class="wysiwyg-editor"
                                                     id="contact-records-editor" title="聊天记录粘贴" data-placeholder="聊天记录"
                                                     style="word-wrap:break-word;overflow-y:auto;height:auto;max-height:750px;min-height:8em;">${(customer.contactRecords?html)!''}</div>
                                            </div>

                                        </div>

                                        <input name="contactRecords" id="contact-records" type="hidden"
                                               value="${(customer.contactRecords)!''}"/>

                                    <#--<div class="row" title="通讯记录">
                                        <div class="col-sm-11 col-sm-offset-1">
                                        </div>
                                    </div>-->
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="space-4"></div>
                        <div class="row">
                            <div class="col-md-offset-1 col-md-11">
                                <div style="margin-bottom: 4px;"><span class="btn-group btn-corner">
                            <button class="btn btn-success btn-sm" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn btn-warning btn-sm" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button></span></div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<#--<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>-->

<#--<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>-->

<#--<script src="${context.contextPath}/resources/ace/assets/js/bootstrap-wysiwyg.js"></script>-->
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.hotkeys.js"></script>

<#--<script type="text/javascript" src="${context.contextPath}/resources/self/jquery.validate.min.js"></script>-->
<script src="${context.contextPath}/resources/self/autogrow.min.js"></script>
<script src="${context.contextPath}/resources/self/bootstrap-wysiwyg.min.js"></script>

<script src="${context.contextPath}/resources/self/select2/js/select2.min.js"></script>

<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>

<script type="text/javascript">
    $(function () {
        $('#stars-ui').raty({
            noRatedMsg: "I'am readOnly and I haven't rated yet!",
            starType: 'span',
//            score: 0,
//            cancel: true,
//            cancelHint: '零意向',
            hints: ['一般', '好', '很好', '非常好', '棒极了'],
            space: false,
            score: function () {
                return $(this).attr('data-init-score');
            },
            click: function (score, evt) {
                $('#form-stars').val(score);
//                alert('ID: ' + this.id + "\nscore: " + score + "\nevent: " + evt);
            }
        });
        $('#textarea-symptom,#textarea-memo').autogrow({
//            speed: 100,
            onInitialize: true,
            animate: false
        });
//        $('#contact-records-editor').ace_wysiwyg();
        {
            var t = $('#contact-records-editor').wysiwyg();
            t.on('paste', function (e) {
                range = document.createRange();
                range.selectNodeContents(document.getElementById('contact-records-editor'));
                range.collapse(false);
                selection = window.getSelection();
                selection.removeAllRanges();
                selection.addRange(range);
            });
        }

        {
            var ff = function () {
                //            $('#source-website').text($('#contact-records-editor').html());
                var i = $('#contact-records-editor').html();
                /**
                 * extract full url from a anchor tag
                 * @type {RegExp}
                 */
//                var r = /[<]a.*?href.*?=.*?"(\S*?)"/;
                /**
                 * extract only domain from a anchor tag
                 * @type {RegExp}
                 */
                var r = /[<]a\s.*?href\s*?=\s*?"https?:\/\/(?!www10.53kf.com)(\S*?)[?#;\/"]/im;
//            var r = /[<]a.*?href.*?=.*?"(.*?)"/;
                var res = r.exec(i);
                if (res != null) {
                    $('#source-website').text(res[1]);
                } else {
//                console.log('null of regex match.');
                    $('#source-website').html('<span class="label">空</span>');
                }
            };
//        $('#source-website').text($('#contact-records-editor').html());
            ff();
            $('#contact-records-editor').parent().focusout(function (e) {
                ff();
            });
        }
        $('#customer-add-form').on('submit', function () {
            $('#contact-records').val($('#contact-records-editor').cleanHtml() + '<br>');
        });
        $('.select2-ui').select2();

        $('#revisit-date-picker').daterangepicker({
            "autoUpdateInput": false,
            "singleDatePicker": true,
            "showDropdowns": true,
            "showWeekNumbers": true,
            "locale": {
                "format": "YYYY-MM-DD",
                "separator": " - ",
                "applyLabel": "Apply",
                "cancelLabel": "Cancel",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "Custom",
                "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
                "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                "firstDay": 1
            },
            "linkedCalendars": false,
            "minDate": moment().format('YYYY-MM-DD'),
            "maxDate": moment().add(6, 'months').format('YYYY-MM-DD')
        }, function (start, end, label) {
            $('#revisit-date-picker').val(start.format('YYYY年MM月DD日'));
            $('#revisit-date-field').val(start.format('YYYY-MM-DD'));
//            $('#revisit-date-field').val(start.unix() * 1000);
        });
        $('#revisit-date-clear').click(function (e) {
            $('#revisit-date-picker').val('');
            $('#revisit-date-field').val('');
        });

//        $("#customer-add-form").cmsvalidate();

        {
            $('#control-append-newline').click(function (e) {
                t.append("<br>");

                {
                    $('#contact-records-editor').scrollTop($('#contact-records-editor').prop('scrollHeight'));
                    $('#contact-records-editor').focus();
                }

                {
                    range = document.createRange();
                    range.selectNodeContents(document.getElementById('contact-records-editor'));
                    range.collapse(false);
                    selection = window.getSelection();
                    selection.removeAllRanges();
                    selection.addRange(range);
                }
            });
        }

        $('[data-toggle="tooltip-a"]').tooltip({trigger: 'hover'});

    });
</script>
</body>
</html>