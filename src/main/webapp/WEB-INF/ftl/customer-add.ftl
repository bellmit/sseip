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
        <li class="active"><span class="fa fa-file-o light-grey"></span>添加资源</li>
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
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨询人姓名 </label>

                                                    <div class="col-xs-10">
                                                        <input name="liaisonName" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨询人姓名"
                                                               value="${(customer.liaisonName)!''}"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨询人地址 </label>

                                                    <div class="col-xs-10">
                                                        <input name="liaisonAddress" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨询人地址"
                                                               value="${(customer.liaisonAddress)!''}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-xs-2 control-label no-padding-right">咨患关系 </label>

                                                    <div class="col-xs-10">
                                                        <input name="relationship" type="text" size="30"
                                                               class="col-xs-12"
                                                               placeholder="咨患关系"
                                                               value="${(customer.relationship)!''}"/>
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
                                                            <#if !(customer.liaisonCountryId)?? >selected=""</#if>
                                                            value="">未知
                                                            </option>
                                                        <#list countries as country>
                                                            <option
                                                                <#if (customer.liaisonCountryId)?? && customer.liaisonCountryId=country.id>selected=""</#if>
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
                                       placeholder="患者姓名" value="${(customer.patientName)!''}" title="患者姓名"/>
                            </div>
                        </div>

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
                        <#--</div>-->

                        <#--<div class="form-group">-->
                        <#--<div class="space-4"></div>-->
                            <label class="col-sm-1 control-label no-padding-right">年龄 </label>

                            <div class="col-sm-2">
                                <input class="col-sm-12" name="age" type="number" placeholder="年龄"
                                       value="${(customer.age)!''}"/>
                            </div>


                            <label class="col-sm-1 control-label no-padding-right">紧急</label>

                            <div class="col-sm-2">
                                <select name="emergency" class="col-xs-12" title="是否紧急">
                                    <option <#if (customer.emergency)?? && customer.emergency>selected=""</#if>
                                            value="1">紧急
                                    </option>
                                    <option
                                    <#if !((customer.emergency)??) || !(customer.emergency)>selected=""</#if>
                                    value="0">
                                        不紧急
                                    </option>
                                </select>
                            </div>

                            <label class="col-sm-1 control-label no-padding-right">有效性</label>

                            <div class="col-xs-2">
                                <select name="valid" class="col-xs-12">
                                    <option <#if (customer.valid)?? && customer.valid>selected=""</#if> value="1">有效
                                    </option>
                                    <option <#if (customer.valid)?? && !(customer.valid)>selected=""</#if>
                                            value="0">无效
                                    </option>
                                </select>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right">地址</label>

                            <div class="col-sm-11">
                                <input name="patientAddress" type="text" size="30" class="col-sm-12"
                                       placeholder="患者地址" value="${(customer.patientAddress)!''}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label no-padding-right">Email</label>

                            <div class="col-sm-11"><input name="email" type="email" size="30" class="col-sm-12"
                                                          placeholder="邮件地址" value="${(customer.email)!''}"/></div>
                        </div>

                    <#--<div class="form-group">
                        <label class="col-xs-1 control-label no-padding-right">电话 </label>

                        <div class="col-xs-5">
                            <input name="tel" type="tel" size="30" class="col-xs-12"
                                   placeholder="电话" value="${(customer.tel)!''}"/>
                        </div>

                        <label class="col-xs-1 control-label no-padding-right" title="患者意向">意向</label>

                        <div class="col-xs-5">
                            <input name="stars" id="form-stars" type="hidden" value="${(customer.stars)!'3'}"/>

                            <div id="stars-ui" data-init-score="${(customer.stars)!'3'}" class="rating inline"
                                 title="意向的星级"></div>
                        </div>

                    </div>-->

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">电话 </label>

                                    <div class="col-sm-10">
                                        <input name="tel" type="tel" size="30" class="col-xs-12"
                                               placeholder="电话" value="${(customer.tel)!''}"/>
                                    </div>

                                </div>

                            </div>
                            <div class="col-sm-6">
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

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right" title="患者意向">意向</label>

                                    <div class="col-sm-10">
                                        <input name="stars" id="form-stars" type="hidden"
                                               value="${(customer.stars)!'3'}"/>

                                        <div id="stars-ui" data-init-score="${(customer.stars)!'3'}"
                                             class="rating inline"
                                             title="意向的星级"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">

                                <div class="form-group">
                                <#--<label class="col-xs-1 control-label no-padding-right"></label>-->
                                    <label class="col-sm-1 control-label no-padding-right">症状</label>

                                    <div class="col-sm-11">
                                            <textarea name="symptom" class="col-sm-12" style="resize: vertical;"
                                                      placeholder="症状" id="textarea-symptom"
                                                      title="症状">${(customer.symptom?xhtml)!''}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <#--行结束-->
                    <#--行结束-->

                    </div>
                <#--第一列结束-->

                    <div class="col-xs-6">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right" title="住院情况">是否
                                        住院</label>

                                    <div class="col-sm-10">
                                        <select name="hospitalization" class="col-xs-12" size="3">
                                        <#list hospitalizationTypes as hospitalizationType>
                                            <option
                                                <#if (customer.hospitalization)?? && customer.hospitalization.code=hospitalizationType.code>selected=""</#if>
                                                value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">疾病 类型</label>

                                    <div class="col-sm-10">
                                        <select name="diseaseTypeId" class="col-xs-12" size="6">
                                        <#list diseaseTypes as diseaseType>
                                            <option
                                                <#if (customer.diseaseTypeId)?? && customer.diseaseTypeId=diseaseType.id>selected=""</#if>
                                                value="${diseaseType.id}">${diseaseType.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">患者 国家</label>

                                    <div class="col-sm-10">
                                        <select name="patientCountryId" class="col-xs-12" size="6">
                                            <option
                                            <#if !(customer.patientCountryId)?? >selected=""</#if>
                                            value="">未知
                                            </option>
                                        <#list countries as country>
                                            <option
                                                <#if (customer.patientCountryId)?? && customer.patientCountryId=country.id>selected=""</#if>
                                                value="${country.id}">${country.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">网站 群组</label>

                                    <div class="col-sm-10">
                                        <select name="websiteId" class="col-xs-12" size="6">
                                        <#list websites as website>
                                            <option
                                                <#if (customer.websiteId)?? && customer.websiteId=website.id>selected=""</#if>
                                                value="${website.id}">${website.name}</option>
                                        </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                <#--第二列结束-->
                </div>
            <#--第一大行结束-->

                <div class="row">
                    <div class="col-sm-6" title="通讯记录">

                        <div class="row">
                            <div class="col-sm-11 col-sm-offset-1">
                                <label>通讯记录</label>
                            </div>
                            <div class="col-sm-11 col-sm-offset-1">
                            <#--<span id="source-website" title="来源域名" class="col-xs-12"></span>-->
                                <label title="来源域名">来源域名: <span id="source-website" class="gold"></span></label>
                            <#--<div class="col-xs-12">
                            </div>-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-11 col-sm-offset-1">
                                <div class="wysiwyg-editor"
                                     id="contact-records-editor">${(customer.contactRecords)!''}</div>
                            </div>

                        </div>

                        <input name="contactRecords" id="contact-records" type="hidden"
                               value="${(customer.contactRecords?xhtml)!''}"/>

                    <#--<div class="row" title="通讯记录">
                        <div class="col-sm-11 col-sm-offset-1">
                        </div>
                    </div>-->
                    </div>

                    <div class="col-sm-6">
                    <#--<label class="col-xs-1 control-label no-padding-right"></label>-->
                        <div class="row">
                            <div class="col-sm-11 col-sm-offset-1">
                                <label>备忘</label>
                            </div>
                            <div class="col-sm-11 col-sm-offset-1">
                            <textarea name="memoItem" class="col-xs-12" style="resize: vertical;"
                                      placeholder="备忘" id="textarea-memo"
                                      title="备忘"></textarea>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-11 col-sm-offset-1">
                            <#if (customer.memos)?? && customer.memos?size gt 0>
                                <div class="well">
                                    <ul>
                                        <#list customer.memos as memo>
                                            <li>${memo.content?html} -
                                                <span class="red">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </#if>
                            </div>
                        </div>
                        <div class="form-group">
                        </div>

                    </div>

                </div>

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
        $('#stars-ui').raty({
            noRatedMsg: "I'am readOnly and I haven't rated yet!",
            starType: 'span',
//            score: 0,
//            cancel: true,
//            cancelHint: '零意向',
            hints: ['一般', '好', '很好', '非常好', '棒极了'],
            score: function () {
                return $(this).attr('data-init-score');
            },
            click: function (score, evt) {
                $('#form-stars').val(score);
//                alert('ID: ' + this.id + "\nscore: " + score + "\nevent: " + evt);
            }
        });
        $('#textarea-symptom,#textarea-memo').autogrow({
            speed: 100,
            onInitialize: true,
            animate: false,
        });
        $('#contact-records-editor').ace_wysiwyg();
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
            $('#contact-records').val($('#contact-records-editor').html());
        });
        $("#customer-add-form").cmsvalidate();
    });
</script>
</body>
</html>