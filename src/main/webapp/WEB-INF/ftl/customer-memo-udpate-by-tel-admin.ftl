<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<#include "/common/common_css.ftl">
    <title></title>
</head>
<body class="no-skin">
<div class="main-container">
    <div class="main-content">
        <ul class="breadcrumb">
            <li><a href="${context.contextPath}/" target="_top"><span class="fa fa-home"></span>Home</a></li>
            <li class="active"><span class="fa fa-bicycle"></span>患者备注更新<a href=""><span
                    class="fa fa-refresh"></span></a></li>
        </ul>

        <form id="customer-memo-update-form" action="/customer/${customer.id?c}/update-by-tel-admin" method="post"
              style="display: none;">
        </form>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="btn-group btn-corner"><input class="btn btn-warning smaller-90" type="submit"
                                                             form="customer-memo-update-form" value="提交修改"><input
                            class="btn btn-default smaller-90" type="reset" form="customer-memo-update-form" value="重置">
                    </div>
                </div>
            </div>

            <div class="space-4"></div>
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

            <div class="space-4"></div>
            <div class="row">
                <div class="row">
                    <div class="form-group col-lg-5 col-md-7 col-sm-9 col-xs-11 col-xs-offset-1">
                        <label>备注</label>
                        <textarea name="memoItem" id="textarea-memo" form="customer-memo-update-form" placeholder="备注"
                                  class="form-control" style="resize: vertical;"
                                  title="备注">${(customer.memo?html)!''}</textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-7 col-sm-9 col-xs-11 col-xs-offset-1">
                        <div>${customer.memos???string('Y','N')}</div>
                        <div>${(customer.memos?size)!'-1'}</div>
                    <#if customer.memos?? && customer.memos?size gt 0>
                        <div class="well">
                            <ul>
                                <#list customer.memos as memo>
                                    <li>${(memo.content?html)!''} -
                                        <span class="red">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                    </div>
                </div>
            </div>
            <div class="space-4"></div>
            <div class="row">
                <div class="col-xs-12">
                    <dl class="dl-horizontal">
                        <dt>ID</dt>
                        <dd>${customer.id}</dd>
                        <dt>患者姓名</dt>
                        <dd><#if (customer.patientName)??>${customer.patientName}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>年龄</dt>
                        <dd><#if (customer.age)??>${customer.age}<#else><span class="label">未知</span></#if></dd>
                        <dt>性别</dt>
                        <dd><#if (customer.sex)??>
                            <#switch customer.sex><#case 'FEMALE'>男性<#break><#case 'MALE'>女性<#break></#switch>
                        <#else><span class="label">未知</span></#if></dd>
                        <dt>紧急程度</dt>
                        <dd><#if (customer.emergency)??>${customer.emergency?then('是','否')}<#else><span
                                class="label">未知</span></#if>
                        </dd>
                        <dt>有效性</dt>
                        <dd><#if (customer.valid)??>${customer.valid?then('是','否')}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>地址</dt>
                        <dd><#if (customer.patientAddress)??>${customer.patientAddress}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>电子邮件</dt>
                        <dd><#if (customer.email)??>${customer.email}<#else><span class="label">未知</span></#if></dd>
                        <dt>电话</dt>
                        <dd><#if (customer.tel)??>${customer.tel}<#else><span class="label">未知</span></#if></dd>
                        <dt>意向等级</dt>
                        <dd><#if (customer.stars)??>
                            <div class="stars-ui-ele btn-minier rating smaller-70"
                                 data-init-score="${(customer.stars)!'0'}"
                                 title="意向星级"></div><#else><span class="label">未知</span></#if></dd>
                        <dt>症状</dt>
                        <dd><#if (customer.symptom)??>${customer.symptom}<#else><span class="label">未知</span></#if></dd>
                        <dt>患者国家</dt>
                        <dd><#if (customer.patientCountry.name)??>${customer.patientCountry.name}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>是否住院</dt>
                        <dd><#if (customer.hospitalization)??>${customer.hospitalization.textName}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>是否报备</dt>
                        <dd><#if (customer.ifReport)??>${customer.ifReport?string('是','否')}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>网站组名</dt>
                        <dd><#if (customer.website.name)??>${customer.website.name}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>来源网址</dt>
                        <dd><#if (customer.sourceWebsite)??>${customer.sourceWebsite}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>疾病类型</dt>
                        <dd><#if (customer.diseaseType.name)??>${customer.diseaseType.name}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>咨询人姓名</dt>
                        <dd><#if (customer.liaisonName)??>${customer.liaisonName}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>咨询人地址</dt>
                        <dd><#if (customer.liaisonAddress)??>${customer.liaisonAddress}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>咨询人国家</dt>
                        <dd><#if (customer.liaisonCountry.name)??>${customer.liaisonCountry.name}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>咨询人与患者关系</dt>
                        <dd><#if (customer.relationship)??>${customer.relationship}<#else><span
                                class="label">未知</span></#if></dd>
                        <dt>通讯记录</dt>
                        <dd><#if (customer.contactRecords)??>
                            <div class="well">${customer.contactRecords}</div><#else><span
                                class="label">未知</span></#if></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<script src="${context.contextPath}/resources/self/autogrow.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('.stars-ui-ele').raty({
            noRatedMsg: "它还没有星星",
            starType: 'span',
            hints: ['一般', '好', '很好', '非常好', '棒极了'],
            space: false,
            score: function () {
                return $(this).attr('data-init-score');
            },
            readOnly: true,
            size: 4,
            space: false
        });
    });
    $('#textarea-memo').autogrow({
        speed: 100,
        onInitialize: true,
        animate: false,
    });
</script>
</body>
</html>