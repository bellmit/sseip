<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>填写顾客资料</title>
</head>
<body class="no-skin">


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
        <div class="col-xs-12">
        <#--左列-->
            <form method="post" class="form-horizontal" id="customer-add-form">

                <div class="row">
                    <div class="col-md-offset-0 col-md-2">
                        <div style="margin-bottom: 4px;"><span class="btn-group btn-corner">
                            <button class="btn btn-success btn-sm" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn btn-warning btn-sm" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button></span></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                    <#--折叠栏开始-->
                        <div class="accordion-style1 panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse"
                                           data-parent="#accordion"
                                           href="#collapseOne">
                            <span data-icon-show="ace-icon fa fa-plus-square"
                                  data-icon-hide="ace-icon fa fa-minus-square-o"
                                  class="bigger-110 ace-icon fa fa-plus-square"></span>展开补充咨询人信息</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <#--折叠栏内容开始-->

                                        <div class="row">
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨询人姓名 </label>

                                                    <div class="col-xs-10">
                                                        <input name="liaisonName" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨询人姓名" value="${(form.liaisonName)!''}"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨询人地址 </label>

                                                    <div class="col-xs-10">
                                                        <input name="liaisonAddress" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨询人地址" value="${(form.liaisonAddress)!''}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨患关系 </label>

                                                    <div class="col-xs-10">
                                                        <input name="relationship" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨患关系" value="${(form.relationship)!''}"/>
                                                    </div>
                                                </div>

                                            </div>
                                        <#--左列结束-->
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label no-padding-right">咨询人国家</label>

                                                    <div class="col-sm-11">
                                                        <select name="liaisonCountryId" class="col-xs-12" size="6">
                                                            <option
                                                            <#if !(form.liaisonCountryId)?? >selected=""</#if>
                                                            value="">未知
                                                            </option>
                                                        <#list countries as country>
                                                            <option
                                                                <#if (form.liaisonCountryId)?? && form.liaisonCountryId=country.id>selected=""</#if>
                                                                value="${country.id}">${country.name}</option>
                                                        </#list>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        <#--右列结束-->
                                        </div>

                                    <#--折叠栏内容结束-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    <#--折叠栏结束-->
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6">

                        <div class="form-group">
                            <label class="col-xs-1 control-label no-padding-right">姓名</label>

                            <div class="col-xs-11">
                                <input name="patientName" type="text" size="30" class="col-xs-12"
                                       placeholder="患者姓名" value="${(form.patientName)!''}" title="患者姓名"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right">性别 </label>

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
                            <label class="col-sm-1 control-label no-padding-right">年龄 </label>

                            <div class="col-sm-2">
                                <input class="col-sm-12" name="age" type="number" placeholder="年龄"
                                       value="${(form.age)!''}"/>
                            </div>


                            <label class="col-sm-1 control-label no-padding-right">紧急 </label>

                            <div class="col-sm-2">
                                <select name="emergency" class="col-xs-12">
                                    <option <#if (form.emergency)?? && form.emergency>selected=""</#if> value="1">紧急
                                    </option>
                                    <option <#if !((form.emergency)??) || !(form.emergency)>selected=""</#if> value="0">
                                        不紧急
                                    </option>
                                </select>
                            </div>

                            <label class="col-sm-1 control-label no-padding-right">有效性</label>

                            <div class="col-xs-2">
                                <select name="valid" class="col-xs-12">
                                    <option <#if (form.valid)?? && form.valid>selected=""</#if> value="1">有效</option>
                                    <option <#if (form.valid)?? && !(form.valid)>selected=""</#if> value="0">无效</option>
                                </select>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-xs-1 control-label no-padding-right">地址</label>

                            <div class="col-xs-11">
                                <input name="patientAddress" type="text" size="30" class="col-xs-12"
                                       placeholder="患者地址" value="${(form.patientAddress)!''}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-1 control-label no-padding-right">Email</label>

                            <div class="col-xs-11">
                                <input name="email" type="email" size="30" class="col-xs-12"
                                       placeholder="邮件地址" value="${(form.email)!''}"/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-xs-1 control-label no-padding-right">电话 </label>

                            <div class="col-xs-5">
                                <input name="tel" type="tel" size="30" class="col-xs-12"
                                       placeholder="电话" value="${(form.tel)!''}"/>
                            </div>

                            <label class="col-xs-1 control-label no-padding-right" title="患者意向">意向</label>

                            <div class="col-xs-5">
                                <input name="stars" id="form-stars" type="hidden" value="${(form.stars)!'0'}"/>

                                <div id="stars-ui" data-init-score="${(form.stars)!'0'}" class="rating inline"
                                     title="意向的星级"></div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">患者国家</label>

                                    <div class="col-sm-10">
                                        <select name="patientCountryId" class="col-xs-12" size="6">
                                            <option
                                            <#if !(form.patientCountryId)?? >selected=""</#if>
                                            value="">未知
                                            </option>
                                        <#list countries as country>
                                            <option
                                                <#if (form.patientCountryId)?? && form.patientCountryId=country.id>selected=""</#if>
                                                value="${country.id}">${country.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">网站 </label>

                                    <div class="col-sm-10">
                                        <select name="websiteId" class="col-xs-12" size="6">
                                        <#list websites as website>
                                            <option
                                                <#if (form.websiteId)?? && form.websiteId=website.id>selected=""</#if>
                                                value="${website.id}">${website.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                    <#--行结束-->
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">疾病类型</label>

                                    <div class="col-sm-10">
                                        <select name="diseaseTypeId" class="col-xs-12" size="6">
                                        <#list diseaseTypes as diseaseType>
                                            <option
                                                <#if (form.diseaseTypeId)?? && form.diseaseTypeId=diseaseType.id>selected=""</#if>
                                                value="${diseaseType.id}">${diseaseType.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right" title="住院情况">住院</label>

                                    <div class="col-sm-10">
                                        <select name="hospitalization" class="col-xs-12" size="3">
                                        <#list hospitalizationTypes as hospitalizationType>
                                            <option
                                                <#if (form.hospitalization)?? && form.hospitalization.code=hospitalizationType.code>selected=""</#if>
                                                value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right" title="是否报备">报备</label>

                                    <div class="col-sm-10">
                                        <select name="ifReport" class="col-xs-12">
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
                        </div>
                    <#--行结束-->

                    </div>
                <#--第一列结束-->

                    <div class="col-xs-6">
                        <div class="form-group">
                        <#--<label class="col-xs-1 control-label no-padding-right"></label>-->
                            <div class="col-xs-12">
                            <textarea name="symptom" class="col-xs-12" style="resize: vertical;"
                                      placeholder="症状" id="textarea-symptom"
                                      title="症状">${(form.symptom?xhtml)!''}</textarea>
                            </div>
                        </div>

                        <div class="form-group" title="备忘">
                            <div class="col-xs-12">
                                <input name="memo" id="customer-memo" type="hidden" value="${(form.memo?xhtml)!''}"/>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="wysiwyg-editor" id="memo-editor" title="备忘">${(form.memo)!''}</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                <#--第二列结束-->
                </div>
            <#--第一大行结束-->

            </form>
        </div>
    </div>
    <!-- /.row -->
</div>

<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.hotkeys.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<#--<script src="${context.contextPath}/resources/self/bootstrap-wysiwyg.min.js"></script>-->
<script src="${context.contextPath}/resources/self/autogrow.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('#memo-editor').ace_wysiwyg();
        $('#stars-ui').raty({
            noRatedMsg: "I'am readOnly and I haven't rated yet!",
            starType: 'span',
//            score: 0,
//            cancel: true,
//            cancelHint: '零意向',
//            hints: ['很糟糕', '不好', '一般', '好', '很向往'],
            hints: ['一般', '好', '很好', '非常好', '棒极了'],
            score: function () {
                return $(this).attr('data-init-score');
            },
            click: function (score, evt) {
                $('#form-stars').val(score);
//                alert('ID: ' + this.id + "\nscore: " + score + "\nevent: " + evt);
            }
        });
        $('#customer-add-form').on('submit', function () {
            $('#customer-memo').val($('#memo-editor').html());
        });
        $('#textarea-symptom').autogrow({
            speed: 100,
            onInitialize: true,
            animate: false,
        });
        $("#customer-add-form").cmsvalidate();
    });
</script>
</body>
</html>