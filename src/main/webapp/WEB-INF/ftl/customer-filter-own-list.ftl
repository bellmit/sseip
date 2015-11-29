<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">

    <!--daterangepicker-->
    <link rel="stylesheet" href="${context.contextPath}/resources/self/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/self/select2/css/select2.css"/>
    <style>
        .filters {
            height: 27px;
            margin-top: 3px;
            margin-bottom: 3px;
            padding-left: 5px;
            padding-right: 5px;
        }

        #customer-table-1 td {
            padding: 4px 2px;
        }

        .customer-list-table td {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden
        }

        /*.tooltip-inner {
            word-wrap: break-word;
        }*/
    </style>
</head>
<body>
<#--main-content-inner-->
<div class="container-fluid">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active">资源列表</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">

            <div data-toggle="tooltip-a" class="col-md-4" title="筛选日期时间范围"><input class="filters form-control"
                                                                                  id="date-range"
                                                                                  placeholder="日期时间范围"
                                                                                  value="<#if query.dateRangeL??>${query.dateRangeL?string("yyyy年MM月dd日HH时")}</#if> 到 <#if query.dateRangeR??>${query.dateRangeR?string("yyyy年MM月dd日HH时")}</#if>"/>
            </div>
        <#--<input form="filter-form" name="dateRange" type="hidden" id="date-range-input" style="display: none;"
               value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">-->
            <input form="filter-form" name="dateRangeL" type="hidden" id="date-range-input-l"
                   value="<#if query.dateRangeL??>${query.dateRangeL?string("yyyy-MM-dd HH")}</#if>">
            <input form="filter-form" name="dateRangeR" type="hidden" id="date-range-input-r"
                   value="<#if query.dateRangeR??>${query.dateRangeR?string("yyyy-MM-dd HH")}</#if>">

            <div class="col-md-2"><input data-toggle="tooltip-a" class="filters text-right form-control"
                                         name="name" type="text" form="filter-form" title="筛选患者咨询人姓名"
                                         placeholder="患者或咨询人姓名"/></div>
            <div class="col-md-2"><input data-toggle="tooltip-a" name="email" class="filters text-right form-control"
                                         type="text" form="filter-form" title="电子邮件地址" placeholder="电子邮件地址"/></div>

            <div data-toggle="tooltip-a" class="col-md-2" style="padding: 0; margin: 0;" title="选择网站群组"><select
                    name="websiteId"
                    form="filter-form"
                    style="width:100%;"
                    class="filters col-md-2 text-right green select2-ui">
                <option value=""
                        <#if !(RequestParameters.websiteId)?? || RequestParameters.websiteId=''>selected</#if>> 网站群组
                </option>
            <#list websites as website>
                <option
                    <#if (RequestParameters.websiteId)?? && RequestParameters.websiteId==website.id?string>selected</#if>
                    value="${website.id?c}">${website.name}</option>
            </#list>
            </select></div>

            <div class="col-md-2"><select data-toggle="tooltip-a" name="ifReport" form="filter-form"
                                          class="filters text-right brown form-control" title="筛选是否报备">
                <option
                <#if !((RequestParameters.ifReport)??) || RequestParameters.ifReport=''>selected</#if>
                value="">是否报备
                </option>
                <option
                <#if (RequestParameters.ifReport)?? && RequestParameters.ifReport=='1'>selected</#if>
                value="1">报备
                </option>
                <option
                <#if (RequestParameters.ifReport)?? && RequestParameters.ifReport=='0'>selected</#if>
                value="0">不报备
                </option>
            </select></div>

        </div>

    <#--折叠栏开始-->
        <div class="accordion-style1 panel-group" id="accordion" style="margin-bottom: 4px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">
                    <span data-icon-show="ace-icon fa fa-plus-square" data-icon-hide="ace-icon fa fa-minus-square-o"
                          class="ace-icon fa fa-plus-square"></span>
                            展开筛选条件
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                    <#--查询条件开始-->
                        <div class="row">
                            <div class="col-md-12">
                                <form id="filter-form" action="" method="get" role="search"
                                      style="display:hidden;"></form>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-12">

                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="col-md-2"><select data-toggle="tooltip-a"
                                                                                      name="hospitalization"
                                                                                      class="filters text-right pink form-control"
                                                                                      form="filter-form"
                                                                                      title="筛选住院类型">
                                                            <option
                                                            <#if !(RequestParameters.hospitalization)??||RequestParameters.hospitalization=''>selected</#if>
                                                            value="">住院类型
                                                            </option>
                                                        <#list hospitalizationTypes as hospitalizationType>
                                                            <option
                                                                <#if (RequestParameters.hospitalization)?? && RequestParameters.hospitalization==hospitalizationType.code?string>selected</#if>
                                                                value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                                        </#list>
                                                        </select></div>

                                                        <div class="col-md-2"><input data-toggle="tooltip-a" name="tel"
                                                                                     class="filters text-right form-control"
                                                                                     type="tel" form="filter-form"
                                                                                     title="筛选电话" placeholder="电话"/>
                                                        </div>

                                                        <div data-toggle="tooltip-a" class="col-md-2"
                                                             title="筛选患者或咨询人国家">
                                                        <#--style="padding: 0; margin: 0;"-->
                                                            <select name="countryId" form="filter-form"
                                                                    class="filters text-right pink select2-ui"
                                                                    style="width:100%;">
                                                                <option value=""
                                                                        <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if> >
                                                                    咨患的国家
                                                                </option>
                                                            <#list countries as country>
                                                                <option value="${country.id?c}"
                                                                        <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if> >${country.a2Code}
                                                                    - ${country.name} - ${country.nameEn}</option>
                                                            </#list>
                                                            </select>
                                                        </div>

                                                        <div data-toggle="tooltip-a" class="col-md-2"
                                                             title="筛选疾病类型">
                                                        <#--style="padding: 0; margin: 0;"-->
                                                            <select name="diseaseTypeId"
                                                                    form="filter-form"
                                                                    style="width:100%;"
                                                                    class="filters col-md-2 text-right orange select2-ui">
                                                                <option
                                                                <#if !(RequestParameters.diseaseTypeId)?? ||RequestParameters.diseaseTypeId=''>selected</#if>
                                                                value="">疾病类型
                                                                </option>
                                                            <#list diseaseTypes as diseaseType>
                                                                <option
                                                                    <#if (RequestParameters.diseaseTypeId)?? && RequestParameters.diseaseTypeId==diseaseType.id?string>selected</#if>
                                                                    value="${diseaseType.id?c}">${diseaseType.name}</option>
                                                            </#list>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-2"><select data-toggle="tooltip-a"
                                                                                      name="valid" form="filter-form"
                                                                                      title="筛选是否有效"
                                                                                      class="filters text-right brown form-control">
                                                            <option
                                                            <#if !((RequestParameters.faraway)??) || RequestParameters.faraway=''>selected</#if>
                                                            value="">是否有效
                                                            </option>
                                                            <option
                                                            <#if (RequestParameters.faraway)?? && RequestParameters.faraway=='1'>selected</#if>
                                                            value="1">有效
                                                            </option>
                                                            <option
                                                            <#if (RequestParameters.faraway)?? && RequestParameters.faraway=='0'>selected</#if>
                                                            value="0">无效
                                                            </option>
                                                        </select></div>

                                                        <div class="col-md-2"><select data-toggle="tooltip-a"
                                                                                      class="filters text-right brown form-control"
                                                                                      name="discard" form="filter-form"
                                                                                      title="筛选是否提交删除">
                                                            <option
                                                            <#if !((RequestParameters.discard)??) || RequestParameters.discard=''>selected</#if>
                                                            value="">是否提交删除
                                                            </option>
                                                            <option
                                                            <#if (RequestParameters.discard)?? && RequestParameters.discard=='1'>selected</#if>
                                                            value="1">提交删除
                                                            </option>
                                                            <option
                                                            <#if (RequestParameters.discard)?? && RequestParameters.discard=='0'>selected</#if>
                                                            value="0">未提交删除
                                                            </option>
                                                        </select></div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <input name="stars" id="form-stars" type="hidden"
                                                               form="filter-form"
                                                               value="${(RequestParameters.stars)!'0'}"/>

                                                        <div class="col-md-2">
                                                            <div class="filters inline" id="stars-ui"
                                                                 data-init-score="${(RequestParameters.stars)!'0'}"
                                                                 title="意向的星级"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <#--
                                                                <input name="stars" class="col-md-2 text-right green" type="text" form="filter-form"
                                                                       title="意向程度"
                                                                       placeholder="意向程度"/>
                                -->
                                    </div>
                                </div>

                            </div>
                        </div>
                    <#--查询条件结束-->
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <a href="" class="filters btn btn-xs col-md-2 btn-warning">重置条件</a>
                <a href="${context.contextPath}/customer/filter-own"
                   class="filters btn btn-xs col-md-2 btn-grey">重新搜索</a>
                <button type="submit" class="filters btn btn-xs col-md-2 btn-info"
                        form="filter-form">查询
                </button>

                <a href="" class="filters btn btn-xs col-md-2 btn-success" title="刷新列表"><span
                        class="fa fa-refresh"></span>刷新</a>

            </div>
        </div>

        <div class="row"><span class="col-md-2"><span class="btn-group btn-corner"><a
                href="${context.contextPath}/customer/add"
                target="_self"
                style="color:#FFF;text-decoration:none;"
                title="填写资源"
                class="btn btn-info btn-sm"><span class="fa fa-file"></span></a></span></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.mod.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
        </div>

        <div id="msg-container">

        </div>
        <div class="row">
            <div class="col-sm-12" style="overflow-y: auto">
                <table id="customer-table-1"
                       class="table table-striped table-bordered table-hover table-condensed table-responsive smaller-90 customer-list-table"
                       style="word-wrap: break-word;table-layout:fixed;margin-bottom:4px;min-width: 960px;">
                    <colgroup class="row">
                    <#--1-->
                    <#--<col style="width: 3.5em;">-->
                        <col style="width: 10.5em;">
                        <col style="width: 8em;">
                        <col style="width: 3em;">
                        <col style="width:3em;">
                        <col style="width:4.5em;">
                        <col style="width:3em;">
                        <col style="width: 6em;">
                        <col class="">
                    <#--5    -->
                        <col style="width: 3em;">
                        <col style="width: 7em;">
                    <#--<col style="width: 10em;">-->
                    <#--<col >--> <#--style="width: 11em;"--> <#--备注-->
                    <#--报备-->
                        <col style="width: 3em;">
                    <#--9-->
                    <#--提交人-->
                        <col style="width: 4.3em;">
                    <#--更新时间-->
                    <#--<col style="width: 9.3em;">-->
                        <col style="width: 9.3em;">
                        <col style="width: 7em;">
                    <#--<col class="col-sm-1">
                    <col class="col-sm-2">
                    <col class="col-sm-2">
                    <col class="col-sm-2">
                    <col class="col-sm-2">
                    <col class="col-sm-1">
                    <col class="col-sm-2">-->
                    </colgroup>
                    <thead>
                    <tr>
                    <#--<th class="text-right"><input type="checkbox" id="check-all"></th>-->
                        <th class=""><input type="checkbox" id="check-all">姓名</th>
                        <th class="">邮箱</th>
                        <th class="">性别</th>
                        <th class="">发邮</th>
                        <th class="">通话</th>
                        <th class="">年龄</th>
                        <th class="">国家</th>
                        <th class="">症状</th>
                        <th class="" title="是否住院">住院</th>
                        <th class="">所属网站群组</th>
                    <#--<th class="">来源域名</th>-->
                        <th class="" title="是否报备">报备</th>
                        <th class="">提交人</th>
                    <#--<th class="">更新时间</th>-->
                        <th class="">创建时间</th>

                        <th class="center">功能</th>
                    </tr>
                    </thead>

                    <tbody>
                    <#list page.list as customer>
                    <tr>
                    <#--<td class="text-right id-col">-->
                    <#--${customer.id?c}-->
                    <#--<input type="checkbox" class="checkbox-each-id" name="customer-ids"
                           value="${customer.id?c}" form="pass-on-form" style="margin: 0;">-->
                    <#--<label style="width: 100%;"></label>-->
                    <#--</td>-->
                        <td data-toggle="tooltip" class="checkbox-control" title="${(customer.patientName)!''}">
                            <input type="checkbox" class="checkbox-each-id" name="customer-ids"
                                   value="${customer.id?c}" form="pass-on-form" style="margin: 0;">

                            <span class="label-yellow">${(customer.stars)!'0'}</span>
                            <#if (customer.patientName)??>${customer.patientName}<#else><#if (customer.liaisonName)??>${customer.liaisonName}</#if></#if>

                        <#--<div></div>-->
                        <#--<div class="stars-ui-ele btn-minier rating"
                             data-init-score="${(customer.stars)!'0'}" title="意向的星级"
                             style="font-size: 7px"></div>-->
                        </td>

                        <td data-toggle="tooltip" title="${(customer.email)!''}">${(customer.email)!''}</td>
                        <#assign color><#switch (customer.sex)!''><#case 'FEMALE'>red<#break><#case 'MALE'>
                            blue<#break></#switch></#assign>
                        <#assign faClass><#switch (customer.sex)!''><#case 'FEMALE'>fa-female<#break><#case 'MALE'>
                            fa-male<#break></#switch></#assign>
                        <td class="center ${color}" title="${(customer.sex.textName)!''}"><span
                                class="bigger-150 fa ${faClass}"></span></td>

                        <td data-toggle="tooltip" class="center"
                            title="${((customer.emailSent)?? && customer.emailSent)?string('已发送','未发送')}"><#if (customer.emailSent)?? && customer.emailSent>
                            <span class="fa fa-envelope-square bigger-140 text-success"></#if></td>
                        <td data-toggle="tooltip" title="${(customer.callState)!''}">${(customer.callState)!''}</td>
                        <td title="${(customer.age)!''}">${(customer.age)!''}</td>
                        <td data-toggle="tooltip"
                            title="${(customer.patientCountry.name)!''}"><#if customer.patientCountry??>${customer.patientCountry.name}</#if></td>
                        <td data-toggle="tooltip"
                            title="${(customer.symptom)!''}"><#if customer.symptom??>${customer.symptom}</#if></td>
                        <td data-toggle="tooltip" class="center"
                            title="${(customer.hospitalization.textName)!''}"><#if (customer.hospitalization)??>
                            <#switch customer.hospitalization>
                                <#case 'YES'><span class="fa bigger-140 fa-hotel text-danger"></span>
                                    <#break>
                                <#case 'NO'><span class="fa bigger-140 fa-thumbs-o-down text-info"></span>
                                    <#break>
                                <#case 'DISCHARGE'><span class="fa bigger-140 fa-child text-success"></span>
                                    <#break>
                            </#switch>
                        <#else>
                        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
                        <td data-toggle="tooltip"
                            title="${(customer.website.name)!''}"><#if customer.website??>${(customer.website.name)!''}<#else>
                        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
                    <#--来源域名-->
                    <#--<td data-toggle="tooltip" title="${(customer.sourceWebsite)!''}">${(customer.sourceWebsite)!''}</td>-->
                    <#--<td class=""
                        title="${(customer.memo)!''}"><#if customer.memo??><#if customer.memo?length gt 26>${customer.memo?substring(0,26)+'...'}<#else>${customer.memo}</#if><#else>
                        <span class="label"><span class="fa fa-question"></span></#if></td>-->
                        <td class="center"
                            title="${(customer.ifReport?string('报备','不报备'))!''}"><#if (customer.ifReport)?? && customer.ifReport>
                            <span class="fa bigger-140 fa-circle-o-notch green"></#if></td>
                    <#--<td class=""
                        title="${(customer.diseaseType.name)!''}"><#if customer.diseaseType??><#if customer.diseaseType.name?length gt 8>${customer.diseaseType.name?substring(0,5)+'...'}<#else>${customer.diseaseType.name}</#if><#else>
                        <span class="label"><span class="fa fa-question"></span></#if></td>-->
                        <td data-toggle="tooltip"
                            title="${(customer.user.realName)!''}">${(customer.user.realName)!''}</td>
                    <#--更新时间-->
                    <#--<td data-toggle="tooltip"
                        title="${(customer.updated?string('yyyy.MM.dd HH:mm:ss'))!''}">${(customer.updated?string('yyyy.MM.dd HH:mm'))!''}</td>-->
                        <td data-toggle="tooltip"
                            title="${(customer.added?string('yyyy.MM.dd HH:mm:ss'))!''}">${(customer.added?string('yyyy.MM.dd HH:mm'))!''}</td>

                        <td>
                            <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.ownerUserId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                <span class="btn-group"><a class="btn btn-minier"
                                                           href="/customer/update/${customer.id?c}"
                                                           title="编辑"><span class="fa fa-paint-brush "></span></a>

                                <#--<#if ['ADMIN']?seq_contains(loginUser.role)>
                                    <form action="${context.contextPath}/customer/remove" method="post"
                                          style="display: inline;"><input type="hidden" name="id"
                                                                          value="${customer.id?c}">
                                        <button class="btn btn-minier"
                                                href="${context.contextPath}/customer/remove"><span
                                                class="fa fa-trash"></span></button>
                                    </form></#if>-->
                                    <button form="from-discard-customer-${customer_index}"
                                            class="remove-control btn btn-minier <#if customer.discard>btn-pink<#else>btn-success</#if>"
                                            title="<#if customer.discard>已提交删除<#else>未提交删除</#if>"><span
                                            class="fa fa-eraser "></span>
                                    </button>
                                    <#if (customer.memos)?? &&customer.memos?size &gt; 0>
                                        <#assign tooltipTitle><#include "customer-update-memo-fragment-on-filter.ftl"></#assign>
                                        <button class="btn btn-info btn-minier" data-toggle="tooltip"
                                                data-placement="left"
                                                data-title="${tooltipTitle?replace('"', '&quot;')}">&nbsp;<span
                                                class="fa fa-info"></span>&nbsp;
                                        </button>
                                    </#if>
                                    <form id="from-discard-customer-${customer_index}"
                                          action="${context.contextPath}/customer/update-discard" method="post"
                                          style="display: none;"><input type="hidden" name="id"
                                                                        value="${customer.id?c}"><input
                                            type="hidden" name="discard"
                                            value="${customer.discard?string('0','1')}">
                                    </form>
                </span>
                            </#if>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
<span class="col-md-1">
<span class="btn-group btn-corner"><a href="${context.contextPath}/customer/add" target="_self" title="填写资源"
                                      class="btn btn-info btn-sm"><span class="fa fa-file"></span></a><a href=""
                                                                                                         class="btn btn-info btn-sm"
                                                                                                         title="刷新列表"><span
        class="fa fa-refresh"></span></a></span></span>

            <div class="col-md-2" style="padding:0;margin:0;"><select name="new-owner-user-id"
                                                                      class="filters text-right pink2 select2-ui"
                                                                      form="pass-on-form" style="width:100%;"
                                                                      title="转交给用户">
                <option
                <#if (RequestParameters.newOwnerUserId)!''=''>selected</#if>
                value="">转交给用户
                </option>
            <#list users as user>
                <option
                    <#if (RequestParameters.newOwnerUserId)!''==user.id?string>selected</#if>
                    value="${user.id?c}"
                    title="${(user.group.name + ' - ')!''}${user.realName}">${(user.group.name + ' - ')!''}${user.realName}</option>
            </#list>
            </select>
            </div>
            <div class="col-md-2"><span class="btn-group btn-corner"><button type="submit"
                                                                             class="filters btn btn-xs text-right btn-warning"
                                                                             form="pass-on-form">转交给用户
            </button></span></div>

            <form style="display: none;" id="pass-on-form" method="post"
                  action="${context.contextPath}/customer/pass"></form>
<span class="col-md-7">
<#if page.totalRows gt 0><#import "/common/pager.mod.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
</span>
        </div>
    </div>
</div>

<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>

<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>
<script src="${context.contextPath}/resources/self/select2/js/select2.min.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<script>
    var l;
    $(function () {
        $('.stars-ui-ele').raty({
            noRatedMsg: "它只读，它还没有星星",
            starType: 'span',
            hints: ['好', '很好', '非常好', '棒极了', 'YEAH'],
            score: function () {
                return $(this).attr('data-init-score');
            },
            readOnly: true,
            size: 4,
            space: false
        });
        $('#stars-ui').raty({
            noRatedMsg: "I'am readOnly and I haven't rated yet!",
            starType: 'span',
//            score: 0,
            cancel: true,
            cancelHint: '零意向',
            hints: ['很糟糕', '不好', '一般', '好', '很向往'],
            space: false,
            score: function () {
                return $(this).attr('data-init-score');
            },
            click: function (score, evt) {
                $('#form-stars').val(score);
//                alert('ID: ' + this.id + "\nscore: " + score + "\nevent: " + evt);
            }
        });

        $('#date-range').daterangepicker({
            "linkedCalendars": false,
            "autoUpdateInput": false,
            "format": "YYYY/MM/DD HH",
            "locale": {
                "format": "YYYY-MM-DD HH",
                "separator": ",",
                "applyLabel": "选择",
                "cancelLabel": "清除",
                "fromLabel": "从",
                "toLabel": "到",
                "customRangeLabel": "订制",
                "daysOfWeek": ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
                "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                "firstDay": 1
            },
            "timePicker": true,
            "timePicker24Hour": true,
            "timePickerIncrement": 60,
//            "maxDate": [d.getMonth() + 1, d.getDate() + 1, d.getFullYear()].join('/')
            "maxDate": [moment().year(), moment().month() + 1, moment().date() + 1].join('-')
        }, function (start, end, label) {
//            console.log('New date range selected: ' + start.format('YYYY-MM-DD HH') + ' to ' + end.format('YYYY-MM-DD HH'));
//            console.log(start);
            $('#date-range').val([start.format('YYYY年MM月DD日HH时'), ' 到 ', end.format('YYYY年MM月DD日HH时')].join(''));
//            l = start;//用于调试
//            $('#date-range-input').val([start.unix() * 1000, end.unix() * 1000].join());
//            $('#date-range-input-l').val(start.unix() * 1000);
//            $('#date-range-input-r').val(end.unix() * 1000);
            $('#date-range-input-l').val(start.format('YYYY-MM-DD HH'));
            $('#date-range-input-r').val(end.format('YYYY-MM-DD HH'));
        });
        $('#date-range').on('cancel.daterangepicker', function (e) {
            //清除内容
            $('#date-range').val('');
//            $('#date-range-input').val('');
            $('#date-range-input-l').val('');
            $('#date-range-input-r').val('');
        });

        $('#check-all').change(function (e) {
            $('.checkbox-each-id').prop('checked', $('#check-all').prop('checked'));
        });

        /**
         * 两个事件，用于阻止checkbox事件冒泡，和绑定td点击事件；附加对全选的td点击事件绑定
         */
        $('.checkbox-each-id,#check-all').click(function (e) {
            e.stopPropagation();
        });
//        $('.id-col').click(function (e) {
        $('.checkbox-control').click(function (e) {
            var i = $('.checkbox-each-id', this);
            i.prop('checked', !i.prop('checked'));
            e.stopPropagation();
        });
        $('th:first').click(function (e) {
            $('#check-all').click();
            e.stopPropagation();
        });

        $(".remove-control").click(function (e) {
            e.preventDefault();
            var button = this;
            bootbox.confirm({
                        message: "将要删除！",
                        buttons: {
                            confirm: {
                                label: "好的",
                                className: "btn-danger btn-sm"
                            },
                            cancel: {
                                label: "不好",
                                className: "btn-primary btn-sm"
                            }
                        },
                        callback: function (result) {
                            if (result) {
                                $(button).prop('form').submit();
                            }
                        }
                    }
            );
        });

        $('.select2-ui').select2();

        $('#pass-on-form').submit(function () {
            var msg = [];
            if ($('.checkbox-each-id:checked').size() == 0) {
                msg.push('至少选中一个！');
            }
//            $('select[name=new-owner-user-id]').val()
            if ($('select[name=new-owner-user-id]').val() == '') {
                msg.push('选择转交用户！');
            }
            if (msg.length > 0) {
                alert(msg.join('\n'));
                return false;
            }
        });

        $('[data-toggle="tooltip"]').tooltip({
            trigger: 'click hover',
            html: true
//            ,
//            selector: ':parent'
            ,
            container: 'body'
        });
        $('[data-toggle="tooltip-a"]').tooltip({trigger: 'hover'});

        $('#filter-form').submit(function () {
            var queryCombo = [encodeURIComponent($('[name=dateRangeL]').val()), encodeURIComponent($('[name=dateRangeR]').val()),
                encodeURIComponent($('[name=websiteId]').val()),
                encodeURIComponent($('[name=ifReport]').val()), encodeURIComponent($('[name=hospitalization]').val()),
                encodeURIComponent($('[name=name]').val()), encodeURIComponent($('[name=email]').val()),
                encodeURIComponent($('[name=tel]').val()), encodeURIComponent($('[name=valid]').val()),
                encodeURIComponent($('[name=discard]').val()),
                encodeURIComponent($('[name=countryId]').val()), encodeURIComponent($('[name=diseaseTypeId]').val())].join('|');
            var perfix = "${basePath}";
            location = [perfix, '/', queryCombo].join('');
            return false;
        });

        $('#another-d-picker').daterangepicker();

//        $('.btn').tooltip({trigger: 'hover click', html: true});

    <#--<#if dateRange?? && dateRange?size gt 0 >-->
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    <#--</#if>-->
    });
</script>
</body>
</html>