<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>顾客资源细节</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <a href="${context.contextPath}/" target="_top"><span class="fa fa-home home-icon"></span></a>
            </li>
            <li class="active">顾客资源细节<a href=""><span class="fa fa-refresh"></span></a></li>
        </ul>
    </div>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12 well">
                <dl class="dl-horizontal">
                    <dt>id</dt>
                    <dd>${customer.id}</dd>
                    <dt>患者姓名</dt>
                    <dd><#if (customer.patientName)??>${customer.patientName}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>患者性别</dt>
                    <dd><#if (customer.sex)??>${customer.sex.textName}<#else><span class="label">不详</span></#if>
                    </dd>
                    <dt>患者年龄</dt>
                    <dd><#if (customer.age)??>${customer.age}<#else><span class="label">不详</span></#if></dd>
                    <dt>疾病类型</dt>
                    <dd><#if (customer.diseaseType)??>${customer.diseaseType.name}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>症状</dt>
                    <dd><#if (customer.symptom)??>${customer.symptom}<#else><span class="label">不详</span></#if>
                    </dd>
                    <dt>患者地址</dt>
                    <dd><#if (customer.patientAddress)??>${customer.patientAddress}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>患者国家</dt>
                    <dd><#if (customer.patientCountry.name)??>${customer.patientCountry.name}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>是否住院</dt>
                    <dd><#if customer.hospitalization??>${customer.hospitalization.textName}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>是否紧急</dt>
                    <dd><#if customer.emergency??>${customer.emergency?then('紧急','不紧急')}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>电子邮件</dt>
                    <dd><#if (customer.email)??>${customer.email}<#else><span class="label">不详</span></#if></dd>
                    <dt>电话</dt>
                    <dd><#if (customer.tel)??>${customer.tel}<#else><span class="label">不详</span></#if></dd>

                    <dt>咨询人姓名</dt>
                    <dd><#if (customer.liaisonName)??>${customer.liaisonName}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>咨询人地址</dt>
                    <dd><#if (customer.liaisonAddress)??>${customer.liaisonAddress}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>咨询人国家</dt>
                    <dd><#if (customer.liaisonCountry.name)??>${customer.liaisonCountry.name}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>咨患关系</dt>
                    <dd><#if (customer.relationship)??>${customer.relationship}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>来源网站</dt>
                    <dd><#if (customer.website)??>${customer.website.name}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>备忘</dt>
                    <dd><#if (customer.memo)??>${customer.memo}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>联系记录</dt>
                    <dd><#if (customer.contactRecords)??>${customer.contactRecords}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>星级</dt>
                    <dd><#if (customer.stars)??>${customer.stars}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>有效性</dt>
                    <dd><#if (customer.valid)??>${customer.valid?string('有效','无效')}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>创建日期</dt>
                    <dd><#if (customer.added)??>${customer.added?string('yyyy-MM-hh, HH:mm:ss')}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>更新日期</dt>
                    <dd><#if (customer.added)??>${customer.added?string('yyyy-MM-hh, HH:mm:ss')}<#else><span
                            class="label">不详</span></#if></dd>
                    <dt>创建者</dt>
                    <dd><#if (customer.user.realName)??>${customer.user.realName}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                    <dt>所属部门</dt>
                    <dd><#if (customer.group.name)??>${customer.group.name}<#else><span
                            class="label">不详</span></#if>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
</body>
</html>