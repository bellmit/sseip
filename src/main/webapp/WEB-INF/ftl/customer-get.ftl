<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>顾客资源细节</title>
</head>
<body class="no-skin">
<div class="container-fluid">
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
            <div class="col-xs-12">
                <div class="bigger-110">

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-striped table-hover smaller-90"
                                   style="table-layout: fixed;word-wrap: break-word;">
                                <tr>
                                    <th class="text-danger">患者姓名</th>
                                    <td><#if (customer.patientName)??>${customer.patientName}</#if></td>
                                    <th>患者国家</th>
                                    <td><#if (customer.patientCountry.name)??>${customer.patientCountry.name}</#if>
                                    </td>
                                    <th>咨询人国家</th>
                                    <td><#if (customer.liaisonCountry.name)??>${customer.liaisonCountry.name}</#if>
                                    </td>
                                    <th>创建日期</th>
                                    <td><#if (customer.added)??>${customer.added?string('yyyy-MM-dd, HH:mm:ss')}</#if></td>
                                </tr>
                                <tr>
                                    <th>患者性别</th>
                                    <td><#if (customer.sex)??>${customer.sex.textName}</#if>
                                    </td>
                                    <th>是否住院</th>
                                    <td><#if customer.hospitalization??>${customer.hospitalization.textName}</#if></td>
                                    <th>咨患关系</th>
                                    <td><#if (customer.relationship)??>${customer.relationship}</#if></td>
                                    <th>更新日期</th>
                                    <td><#if (customer.updated)??>${customer.updated?string('yyyy-MM-dd, HH:mm:ss')}</#if></td>
                                </tr>
                                <tr>
                                    <th class="text-danger">患者年龄</th>
                                    <td><#if (customer.age)??>${customer.age}</#if></td>
                                    <th>是否紧急</th>
                                    <td><#if customer.emergency??>${customer.emergency?then('紧急','不紧急')}</#if></td>
                                    <th>所属网站群组</th>
                                    <td><#if (customer.website)??>${customer.website.name}</#if>
                                    </td>
                                    <th>提交人</th>
                                    <td><#if (customer.user.realName)??>${customer.user.realName}</#if></td>
                                </tr>
                                <tr>
                                    <th class="text-danger">病种诊断</th>
                                    <td><#if (customer.diseaseType)??>${customer.diseaseType.name}</#if></td>
                                    <th>电子邮件</th>
                                    <td><#if (customer.email)??>${customer.email}</#if></td>
                                    <th>来源域名</th>
                                    <td><#if (customer.sourceWebsite)??>${customer.sourceWebsite}</#if></td>
                                    <th>所属人</th>
                                    <td><#if (customer.ownerUser.realName)??>${customer.ownerUser.realName}</#if></td>
                                </tr>
                                <tr>
                                    <th>症状</th>
                                    <td><#if (customer.symptom)??>${customer.symptom}</#if>
                                    </td>
                                    <th class="text-danger">电话</th>
                                    <td><#if (customer.tel)??>${customer.tel}</#if></td>
                                    <th>星级</th>
                                    <td><#if (customer.stars)??>
                                        <div class="stars-ui-ele btn-minier rating"
                                             data-init-score="${(customer.stars)!'0'}"
                                             title="意向的星级" style="font-size: 7px"></div></#if>
                                    </td>
                                    <th>所属部门</th>
                                    <td><#if (customer.group.name)??>${customer.group.name}</#if></td>
                                </tr>
                                <tr>
                                    <th class="text-danger">患者地址</th>
                                    <td><#if (customer.patientAddress)??>${customer.patientAddress}</#if>
                                    </td>
                                    <th>咨询人姓名</th>
                                    <td><#if (customer.liaisonName)??>${customer.liaisonName}</#if></td>
                                    <th>有效性</th>
                                    <td><#if (customer.valid)??>${customer.valid?string('有效','无效')}</#if></td>
                                    <th>通话状态</th>
                                    <td><#if (customer.callState)??>${customer.callState}</#if></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td></td>
                                    <th>咨询人地址</th>
                                    <td><#if (customer.liaisonAddress)??>${customer.liaisonAddress}</#if></td>
                                    <th>是否提交删除</th>
                                    <td><#if (customer.discard)??>${customer.discard?string('已提交删除','未提交删除')}</#if></td>
                                    <th>权重</th>
                                    <td><#if (customer.weight)??>${customer.weight.weightName}</#if></td>
                                </tr>
                            </table>
                            <div class="col-xs-12">
                            </div>
                        </div>
                    </div>
                <#--
                                    <div class="row">

                                        <div class="col-xs-3">
                                        &lt;#&ndash;dl-horizontal&ndash;&gt;
                                            <dl class="dl-horizontal">
                                                <dt>患者姓名</dt>
                                                <dd><#if (customer.patientName)??>${customer.patientName}</#if></dd>
                                                <dt>患者性别</dt>
                                                <dd><#if (customer.sex)??>${customer.sex.textName}</#if>
                                                </dd>
                                                <dt>患者年龄</dt>
                                                <dd><#if (customer.age)??>${customer.age}</#if></dd>
                                                <dt>疾病类型</dt>
                                                <dd><#if (customer.diseaseType)??>${customer.diseaseType.name}</#if></dd>
                                                <dt>症状</dt>
                                                <dd><#if (customer.symptom)??>${customer.symptom}</#if>
                                                </dd>
                                                <dt>患者地址</dt>
                                                <dd><#if (customer.patientAddress)??>${customer.patientAddress}</#if>
                                                </dd>

                                            </dl>
                                        </div>
                                        <div class="col-xs-3">
                                            <dl class="dl-horizontal">
                                                <dt>患者国家</dt>
                                                <dd><#if (customer.patientCountry.name)??>${customer.patientCountry.name}</#if>
                                                </dd>
                                                <dt>是否住院</dt>
                                                <dd><#if customer.hospitalization??>${customer.hospitalization.textName}</#if></dd>

                                                <dt>是否紧急</dt>
                                                <dd><#if customer.emergency??>${customer.emergency?then('紧急','不紧急')}</#if></dd>
                                                <dt>电子邮件</dt>
                                                <dd><#if (customer.email)??>${customer.email}</#if></dd>

                                                <dt>电话</dt>
                                                <dd><#if (customer.tel)??>${customer.tel}</#if></dd>

                                                <dt>咨询人姓名</dt>
                                                <dd><#if (customer.liaisonName)??>${customer.liaisonName}</#if></dd>
                                                <dt>咨询人地址</dt>
                                                <dd><#if (customer.liaisonAddress)??>${customer.liaisonAddress}</#if></dd>

                                            </dl>
                                        </div>
                                        <div class="col-xs-3">
                                            <dl class="dl-horizontal">
                                                <dt>咨询人国家</dt>
                                                <dd><#if (customer.liaisonCountry.name)??>${customer.liaisonCountry.name}</#if>
                                                </dd>
                                                <dt>咨患关系</dt>
                                                <dd><#if (customer.relationship)??>${customer.relationship}</#if>
                                                </dd>
                                                <dt>所属网站组</dt>
                                                <dd><#if (customer.website)??>${customer.website.name}</#if>
                                                </dd>

                                                <dt>来源网址</dt>
                                                <dd><#if (customer.sourceWebsite)??>${customer.sourceWebsite}</#if></dd>
                                                <dt>星级</dt>
                                                <dd><#if (customer.stars)??>
                                                    <div class="stars-ui-ele btn-minier rating"
                                                         data-init-score="${(customer.stars)!'0'}"
                                                         title="意向的星级" style="font-size: 7px"></div></#if>
                                                </dd>
                                                <dt>有效性</dt>
                                                <dd><#if (customer.valid)??>${customer.valid?string('有效','无效')}</#if></dd>
                                                <dt>是否提交删除</dt>
                                                <dd><#if (customer.discard)??>${customer.discard?string('已提交删除','未提交删除')}</#if></dd>
                                            </dl>
                                        </div>
                                        <div class="col-xs-3">
                                            <dl class="dl-horizontal">
                                                <dt>创建日期</dt>
                                                <dd><#if (customer.added)??>${customer.added?string('yyyy-MM-dd, HH:mm:ss')}</#if></dd>
                                                <dt>更新日期</dt>
                                                <dd><#if (customer.added)??>${customer.added?string('yyyy-MM-dd, HH:mm:ss')}</#if></dd>
                                                <dt>提交人</dt>
                                                <dd><#if (customer.user.realName)??>${customer.user.realName}</#if></dd>
                                                <dt>所属人</dt>
                                                <dd><#if (customer.ownerUser.realName)??>${customer.ownerUser.realName}</#if></dd>
                                                <dt>所属部门</dt>
                                                <dd><#if (customer.group.name)??>${customer.group.name}</#if></dd>
                                                <dt>通话状态</dt>
                                                <dd><#if (customer.callState)??>${customer.callState}</#if></dd>
                                                <dt>权重</dt>
                                                <dd><#if (customer.weight)??>${customer.weight.weightName}</#if></dd>
                                            </dl>
                                        </div>

                                    </div>
                -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <dl>
                                        <dt>备注</dt>
                                        <dd>
                                            <div class="well"
                                                 style="min-height:10em;max-height:40em;word-wrap:break-word;overflow-y:auto;"
                                                 id="memo-ul-container">
                                            <#include "customer-update-memo-fragment.ftl">
                                            </div>
                                        </dd>

                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <dl>
                                        <dt>联系记录</dt>
                                        <dd>
                                            <div class="well"
                                                 style="word-wrap:break-word;overflow-y:auto;height:auto;max-height:750px;min-height:8em;">${(customer.contactRecords)!''}</div>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<script>
    $(function () {
        $('.stars-ui-ele').raty({
            noRatedMsg: "它只读，它还没有星星",
            starType: 'span',
            hints: ['很糟糕', '不好', '一般', '好', '很向往'],
            space: false,
            score: function () {
                return $(this).attr('data-init-score');
            },
            readOnly: true,
            size: 4,
            space: false
        });
    });
</script>
</body>
</html>