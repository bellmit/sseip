<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>顾客资料编辑</title>
    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
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
            <li class="active">更新客户资源资料 <a href="" title="刷新"><span class="fa fa-refresh"></span></a></li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
        <#if success??>
            <div class="row">
                <div class="col-sm-offset-3 col-sm-4 alert alert-success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            class="fa fa-times"></span></button>
                ${success}</div>
            </div>
        </#if>
        <#if error??>
            <div class="row">
                <div class="col-sm-offset-3 col-sm-4 alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            class="fa fa-times"></span></button>
                ${error}</div>
            </div>
        </#if>
        <#if errors??>
            <#list errors as error>
                <div class="row">
                    <div class="col-sm-offset-3 col-sm-4 alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                class="fa fa-times"></span></button>
                    ${error}</div>
                </div>
            </#list>
        </#if>
        </div>
    <#--警示行结束-->
        <div class="row">
            <div class="col-md-12">
            <#--左列-->
                <form method="post" class="form-horizontal" id="customer-update-form">
                    <div class="col-md-12"><input name="referer"
                                                  type="hidden"
                                                  value="${(referer)!'/'}"/>

                        <div class="row">
                            <div class="col-md-offset-1 col-md-11">
                                <div style="margin-bottom: 4px;"><span class="btn-group btn-corner">
                            <button class="btn btn-success btn-sm" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn btn-warning btn-sm" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button>
                            <a class="btn btn-primary btn-sm" href="${(referer)!''}">
                                <span class="ace-icon fa fa-back bigger-110"></span>返回来源页
                            </a>
                            </span></div>
                            </div>
                        </div>
                        <div class="space-4"></div>

                        <div class="row">
                            <div class="col-md-12">
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
                                                    <div class="col-md-12">

                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="col-md-2 control-label no-padding-right">姓名</label>

                                                                    <div class="col-md-10">
                                                                        <input name="liaisonName" type="text" size="30"
                                                                               class="col-md-12"
                                                                               placeholder="咨询人姓名"
                                                                               value="${(customer.liaisonName)!''}"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                <#--<label class="col-md-2 control-label no-padding-right">国家</label>-->

                                                                    <div class="col-sm-12">
                                                                        <select name="liaisonCountryId"
                                                                                class="select2-ui" style="width:100%"
                                                                                title="咨询人国家">
                                                                            <option
                                                                            <#if !(customer.liaisonCountryId)?? >selected=""</#if>
                                                                            value="">选择咨询人国家
                                                                            </option>
                                                                        <#list countries as country>
                                                                            <option
                                                                                <#if (customer.liaisonCountryId)?? && customer.liaisonCountryId=country.id>selected=""</#if>
                                                                                value="${country.id}">${country.a2Code}
                                                                                - ${country.name}</option>
                                                                        </#list>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label class="col-md-2 control-label no-padding-right">关系 </label>

                                                                    <div class="col-md-10">
                                                                        <input name="relationship" type="text" size="30"
                                                                               class="form-control"
                                                                               placeholder="咨患关系"
                                                                               value="${(customer.relationship)!''}"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    <#--
                                                                                                            <div class="row">
                                                                                                                <div class="col-sm-12">
                                                                                                                    <div class="form-group">
                                                                                                                        <label class="col-xs-2 control-label no-padding-right">咨询人地址 </label>

                                                                                                                        <div class="col-xs-10">
                                                                                                                            <input name="liaisonAddress" type="text"
                                                                                                                                   size="30"
                                                                                                                                   class="col-xs-12"
                                                                                                                                   placeholder="咨询人地址"
                                                                                                                                   value="${(customer.liaisonAddress)!''}"/>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                    -->

                                                    </div>
                                                <#--左列结束-->
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
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-xs-2 control-label no-padding-right">姓名</label>

                                            <div class="col-xs-10">
                                                <input name="patientName" type="text" size="30" class="col-xs-12"
                                                       placeholder="患者姓名" value="${(customer.patientName)!''}"
                                                       title="患者姓名"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label no-padding-right">年龄 </label>

                                            <div class="col-sm-10">
                                                <input class="col-sm-12" name="age" type="number" placeholder="年龄"
                                                       value="${(customer.age)!''}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label no-padding-right">性别</label>

                                            <div class="col-sm-10">
                                                <select class="col-sm-12" name="sex">
                                                <#list sexTypes as sexType>
                                                    <option value="${sexType.code}"
                                                            <#if ((customer.sex.code)!-1)=sexType.code>selected=""</#if>>${sexType.textName}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label no-padding-right">症状</label>

                                            <div class="col-sm-10">
                                                <input name="symptom" class="form-control" placeholder="症状" title="症状"
                                                       value="${(customer.symptom?xhtml)!''}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">Email</label>-->

                                            <div class="col-md-12"><input name="email" type="email" class="form-control"
                                                                          placeholder="邮件地址"
                                                                          value="${(customer.email)!''}"/></div>
                                        </div>

                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">电话 </label>-->

                                            <div class="col-md-12">
                                                <input name="tel" type="tel" size="30" class="col-xs-12"
                                                       placeholder="电话" value="${(customer.tel)!''}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">群组</label>-->

                                            <div class="col-md-12">
                                                <select name="websiteId" class="col-xs-12 select2-ui">
                                                    <option <#if (customer.websiteId)??>selected=""</#if> value="">
                                                        选择网站群组
                                                    </option>
                                                <#list websites as website>
                                                    <option
                                                        <#if (customer.websiteId)?? && customer.websiteId=website.id>selected=""</#if>
                                                        value="${website.id}">${website.name}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right"
                                               title="是否报备">报备</label>-->

                                            <div class="col-sm-12">
                                                <select name="ifReport" class="form-control">
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

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right">有效性</label>-->

                                            <div class="col-sm-12">
                                                <select name="valid" class="form-control">
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
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right">疾病类型</label>-->

                                            <div class="col-sm-12">
                                                <select name="diseaseTypeId" class="col-xs-12 select2-ui">
                                                    <option <#if !(customer.diseaseTypeId)??>selected=""</#if> value="">
                                                        选择疾病类型
                                                    </option>
                                                <#list diseaseTypes as diseaseType>
                                                    <option
                                                        <#if (customer.diseaseTypeId)?? && customer.diseaseTypeId=diseaseType.id>selected=""</#if>
                                                        value="${diseaseType.id}">${diseaseType.name}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-sm-3">
                                        <div class="form-group">
                                        <#--<label class="col-sm-2 control-label no-padding-right">地址</label>-->

                                            <div class="col-sm-12">
                                                <select name="patientCountryId"
                                                        class="col-sm-12 select2-ui">
                                                    <option
                                                    <#if !(customer.patientCountryId)?? >selected=""</#if>
                                                    value="">选择患者国家
                                                    </option>
                                                <#list countries as country>
                                                    <option
                                                        <#if (customer.patientCountryId)?? && customer.patientCountryId=country.id>selected=""</#if>
                                                        value="${country.id}">${country.a2Code}
                                                        - ${country.name}</option>
                                                </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-4 control-label no-padding-right">紧急</label>-->

                                            <div class="col-md-12">
                                                <select name="emergency" class="col-xs-12" title="是否紧急">
                                                    <option
                                                    <#if (customer.emergency)?? && customer.emergency>selected=""</#if>
                                                    value="1">紧急
                                                    </option>
                                                    <option
                                                    <#if !((customer.emergency)??) || !(customer.emergency)>selected=""</#if>
                                                    value="0">
                                                        不紧急
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                        <#--<label class="col-md-4 control-label no-padding-right"
                                               title="住院情况">是否住院</label>-->

                                            <div class="col-md-12">
                                                <select name="hospitalization" class="col-sm-12">
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

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                        <#--<label class="col-sm-3 control-label no-padding-right"
                                               title="患者意向">意向</label>-->

                                            <div class="col-sm-12">
                                                <input name="stars" id="form-stars" type="hidden"
                                                       value="${(customer.stars)!'3'}"/>

                                                <div id="stars-ui" data-init-score="${(customer.stars)!'3'}"
                                                     class="rating inline"
                                                     title="意向的星级"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        <#--第一列结束-->

                        </div>
                    <#--第一大行结束-->

                    <#--第二大行，放置两个框-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                    <#--<label class="col-xs-1 control-label no-padding-right"></label>-->
                                        <div class="row">
                                        <#--col-md-offset-1-->
                                            <div class="col-md-12">
                                                <label>备注</label> <span class="btn-group btn-corner"><a
                                                    class="btn btn-success btn-minier" id="memo-submit-control"><span
                                                    class="ace-icon fa fa-plus bigger-110"></span>提交
                                            </a></span></div>

                                        <#--col-md-offset-1-->
                                            <div class="col-md-12">
                            <textarea name="memoItem" class="col-md-12" style="resize: vertical;"
                                      placeholder="备注" id="textarea-memo"
                                      title="备注"></textarea>
                                            </div>
                                        </div>

                                        <div class="row">
                                        <#--col-md-offset-1-->
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
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12" title="通讯记录">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>通讯记录</label>
                                            </div>
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
                                                <div class="wysiwyg-editor"
                                                     id="contact-records-editor">${(customer.contactRecords)!''}</div>
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
                            <div class="col-sm-offset-1 col-sm-11">
                                <div style="margin-bottom: 4px;"><span class="btn-group btn-corner">
                            <button class="btn btn-success btn-sm" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交
                            </button>
                            <button class="btn btn-warning btn-sm" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置
                            </button>
                            <a class="btn btn-primary btn-sm" href="${(referer)!''}">
                                <span class="ace-icon fa fa-back bigger-110"></span>返回来源页
                            </a>
                            </span></div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    <#--表格行结束-->
    <#--text-->
    <#--<div class="row">
        <div class="col-sm-12">
            <form id="f1234" action="/customer/append-memo" method="post">
                <input type="text" name="memoItem">
                <input type="text" name="customerId">
                <input form="f1234" type="submit" value="添加">
            </form>
        </div>
    </div>-->

    </div>
</div>
<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/self/select2/css/select2.css"/>

<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.hotkeys.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<script src="${context.contextPath}/resources/self/autogrow.min.js"></script>
<script src="${context.contextPath}/resources/self/select2/js/select2.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('#stars-ui').raty({
            noRatedMsg: "一个没有选中星星的评级框框",
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
//        $('#textarea-symptom,#textarea-memo').autogrow({
        $('#textarea-memo').autogrow({
            speed: 100,
            onInitialize: true,
            animate: false,
        });
        $('#contact-records-editor').ace_wysiwyg();
        {
            var ff = function () {
                //            $('#source-website').text($('#contact-records-editor').html());
                var i = $('#contact-records-editor').html();
//                var r = /[<]a\s.*?href\s*?=\s*?"((?!https?:\/\/www10.53kf.com)\S*?)"/im;
                /**
                 * full url
                 * @type {RegExp}
                 */
//                var r = /[<]a\s.*?href\s*?=\s*?"((?!https?:\/\/www10.53kf.com)https?:\/\/\S*?(?=\/|$))"/im;
                /**
                 * only domain
                 * @type {RegExp}
                 */
//                var r = /[<]a\s.*?href\s*?=\s*?"(?!https?:\/\/www10.53kf.com)https?:\/\/(\S*?)\/|$"/im;
                var r = /[<]a\s.*?href\s*?=\s*?"https?:\/\/(?!www10.53kf.com)(\S*?)[?#;\/"]/im;
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
        $('#customer-update-form').on('submit', function () {
            $('#contact-records').val($('#contact-records-editor').cleanHtml());
        });
        $('.select2-ui').select2();

        //ajax 提交 备注， 加载返回html片，<li>的列表，填充在<ul>里
        $('#memo-submit-control').click(function (data) {
            $.post('/customer/append-memo', {
                memoItem: $('#textarea-memo').val(),
                customerId: location.href.substr(location.href.search(/\d+$/))
            }, function (data) {
                $('#memo-ul-container').html(data)
            }, 'html');
            $('#textarea-memo').val('');
        })

//        $('#accordion').on('shown.bs.collapse', function () {
//            $('.select2-ui').select2();
//            alert('collapse!');
//        });

        $("#customer-update-form").cmsvalidate();
    });
</script>
</body>
</html>