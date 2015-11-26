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
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><span class="fa light-red fa-table"></span>全部资源一览</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">

        <div class="row">

            <div data-toggle="tooltip-a" class="col-md-4" title="选择日期时间范围"><input class="filters form-control"
                                                                                  id="date-range" placeholder="日期时间范围"
                                                                                  value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>
            </div>
            <input form="filter-form" name="dateRange" type="hidden" id="date-range-input" style="display: none;"
                   value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">

            <div data-toggle="tooltip-a" class="col-md-2" title="选择网站群组" style="padding: 0; margin: 0;"><select
                    class="filters text-right greens select2-ui form-control" name="websiteId" style="width:100%;"
                    form="filter-form">
                <option
                <#if !(RequestParameters.websiteId)?? || RequestParameters.websiteId=''>selected</#if>
                value="">选择网站群组
                </option>
            <#list websites as website>
                <option
                    <#if (RequestParameters.websiteId)?? && RequestParameters.websiteId==website.id?string>selected</#if>
                    value="${website.id?c}">${website.name}</option>
            </#list>
            </select>
            </div>

            <div class="col-md-2"><select data-toggle="tooltip-a" class="filters pink2 form-control"
                                          name="userId" form="filter-form" title="筛选所属人">
                <option
                <#if !(RequestParameters.userId)?? || RequestParameters.userId=''>selected</#if>
                value="">所属人
                </option>
            <#list users as user>
                <option
                    <#if (RequestParameters.userId)?? && RequestParameters.userId==user.id?string>selected</#if>
                    value="${user.id?c}">${(user.group.name + ' - ')!''}${(user.realName)!'佚名'}</option>
            </#list>
            </select></div>

            <div class="col-md-2"><select data-toggle="tooltip-a" name="ifReport" class="filters brown form-control"
                                          form="filter-form" title="筛选是否报备">
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

            <div class="col-md-2"><select data-toggle="tooltip-a" class="filters pink form-control"
                                          name="hospitalization" form="filter-form" title="筛选住院类型">
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

        </div>

    <#--折叠栏开始-->
        <div class="accordion-style1 panel-group" id="accordion" style="margin-bottom: 4px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">
                            <span data-icon-show="ace-icon fa fa-plus-square"
                                  data-icon-hide="ace-icon fa fa-minus-square-o"
                                  class="bigger-110 ace-icon fa fa-plus-square"></span>
                            附加筛选条件
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                    <#--填写折叠框内容-->
                    <#--查询条件开始-->
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <form id="filter-form" action="" method="get" role="search"
                                      style="display: none;"></form>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-2"><input data-toggle="tooltip-a"
                                                                     class="form-control filters"
                                                                     name="name" type="text"
                                                                     form="filter-form"
                                                                     title="筛选或患者咨询人的姓名"
                                                                     placeholder="患者或咨询人的姓名"
                                                                     value="${(RequestParameters.name)!''}"/></div>
                                        <div class="col-sm-2"><input data-toggle="tooltip-a"
                                                                     class="filters form-control"
                                                                     name="email" type="text" form="filter-form"
                                                                     title="电子邮件地址" placeholder="电子邮件地址"
                                                                     value="${(RequestParameters.email)!''}"/></div>
                                        <div class="col-sm-2"><input data-toggle="tooltip-a"
                                                                     class="filters form-control"
                                                                     name="tel" type="tel" form="filter-form"
                                                                     title="筛选电话" placeholder="电话"
                                                                     value="${(RequestParameters.tel)!''}"/></div>

                                        <div class="col-md-2"><select data-toggle="tooltip-a"
                                                                      class="filters brown form-control"
                                                                      name="valid" form="filter-form" title="筛选是否有效">
                                            <option
                                            <#if !((RequestParameters.valid)??) || RequestParameters.valid=''>selected</#if>
                                            value="">是否有效
                                            </option>
                                            <option
                                            <#if (RequestParameters.valid)?? && RequestParameters.valid=='1'>selected</#if>
                                            value="1">有效
                                            </option>
                                            <option
                                            <#if (RequestParameters.valid)?? && RequestParameters.valid=='0'>selected</#if>
                                            value="0">无效
                                            </option>
                                        </select></div>

                                        <div class="col-md-2"><select data-toggle="tooltip-a"
                                                                      class="filters brown form-control"
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

                                        <div class="filters col-md-2 inline" id="stars-ui"
                                             title="筛选意向程度星级"
                                             data-init-score="${(RequestParameters.stars)!'0'}"></div>
                                        <input name="stars" id="form-stars" type="hidden" form="filter-form"
                                               value="${(RequestParameters.stars)!'0'}"/>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">

                                        <div data-toggle="tooltip-a" class="col-md-2" style="padding: 0; margin: 0;"
                                             title="筛选患者或咨询人的国家">
                                            <select class="filters text-right pink select2-ui form-control"
                                                    name="countryId" form="filter-form" style="width:100%">
                                                <option
                                                <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if>
                                                value="">患者或咨询人的国家
                                                </option>
                                            <#list countries as country>
                                                <option
                                                    <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if>
                                                    value="${country.id?c}">${country.a2Code} - ${country.name}
                                                    - ${country.nameEn}</option>
                                            </#list>
                                            </select></div>

                                        <div data-toggle="tooltip-a" class="col-md-2" style="padding: 0; margin: 0;"
                                             title="筛选疾病类型"><select
                                                class="filters text-right orange select2-ui form-control"
                                                name="diseaseTypeId" style="width:100%;" form="filter-form">
                                            <option
                                            <#if !(RequestParameters.diseaseTypeId)?? ||RequestParameters.diseaseTypeId=''>selected</#if>
                                            value="">疾病类型
                                            </option>
                                        <#list diseaseTypes as diseaseType>
                                            <option
                                                <#if (RequestParameters.diseaseTypeId)?? && RequestParameters.diseaseTypeId==diseaseType.id?string>selected</#if>
                                                value="${diseaseType.id?c}">${diseaseType.name}</option>
                                        </#list>
                                        </select></div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    <#--查询条件结束-->
                    </div>
                </div>
            </div>
        </div>
    <#--折叠栏结束-->

        <div class="row">
            <div class="col-md-12">
                <a href="" class="filters btn btn-xs col-md-2 btn-warning">重置条件</a>
                <a href="${context.contextPath}/customer/filter/1"
                   class="filters btn btn-xs col-md-2 btn-grey">重新搜索</a>
                <button type="submit" class="filters btn btn-xs col-md-2 btn-info"
                        form="filter-form">查询
                </button>

                <a href="" class="filters btn btn-xs col-md-2 btn-success" title="刷新列表"><span
                        class="fa fa-refresh"></span>刷新</a>

            </div>
        </div>

    <#--<div class="page-header position-relative">-->
        <div class="row"><span class="col-md-2"><span
                class="btn-group btn-corner"><#if ['EMPLOYEE']?seq_contains(loginUser.role)><a
                href="${context.contextPath}/customer/add" target="_self" style="color:#FFF;text-decoration:none;"
                title="填写资源" class="btn btn-info btn-sm"><span class="fa fa-file"></span></a></#if></span></span> <span
                class="col-md-10"> <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if></span>
        </div>
        <table id="customer-table-1"
               class="table table-striped table-bordered table-hover table-condensed table-responsive smaller-90 customer-list-table"
               style="word-wrap: break-word;table-layout:fixed;margin-bottom:4px;">
            <colgroup class="row">
            <#--1-->
            <#--<col style="width: 5em;">-->
                <col style="width: 7em;">
                <col style="width: 8em;">
                <col style="width: 3em;">
                <col style="width:3em;">
                <col style="width:4.5em;">
                <col style="width:3em;">
                <col style="width: 6em;">
                <col class="">
            <#--4    -->
                <col style="width: 3em;">
            <#--来源域名-->
            <#--<col style="width: 7em;">-->
                <col style="width: 10.3em;">
            <#--<col>--> <#--style="width: 11em;"--> <#--备注-->
                <col style="width: 3em;">
            <#--8-->
                <col style="width: 4.3em;">
                <col style="width: 4.3em;">
            <#--<col style="width: 9.3em;">-->
                <col style="width: 9.3em;">
                <col style="width: 7em;">
            </colgroup>
            <thead>
            <tr>
            <#--<th class="text-right">ID</th>-->
                <th class="">姓名</th>
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
            <#--<th class="">备注</th>-->
                <th class="" title="是否报备">报备</th>
                <th class="">所属人</th>
                <th class="">提交人</th>
            <#--<th class="">更新时间</th>-->
                <th class="">创建时间</th>

                <th class="center">功能</th>
            </tr>
            </thead>

            <tbody>
            <#list page.list as customer>
            <tr>
            <#--<td class="">${customer.id?c}</td>-->
                <td title="${(customer.patientName)!''}" data-toggle="tooltip">
                    <span class=" label-minier label-yellow">${(customer.stars)!'0'}</span>
                    <#if (customer.patientName)??>${customer.patientName}<#else>
                        <#if (customer.liaisonName)??>${customer.liaisonName}<#else><span
                                class="label">不详</span></#if></#if>

                <#--<div class="stars-ui-ele btn-minier rating"
                     data-init-score="${(customer.stars)!'0'}" title="意向的星级"
                     style="font-size: 7px"></div>-->
                </td>

                <td data-toggle="tooltip" title="${(customer.email)!''}"
                    data-toggle="tooltip">${(customer.email)!''}</td>
                <#assign color><#switch (customer.sex)!''><#case 'FEMALE'>red<#break><#case 'MALE'>
                    blue<#break></#switch></#assign>
                <#assign faClass><#switch (customer.sex)!''><#case 'FEMALE'>fa-female<#break><#case 'MALE'>
                    fa-male<#break></#switch></#assign>
                <td class="center ${color}" title="${(customer.sex.textName)!''}"><span
                        class="bigger-150 fa ${faClass}"></span></td>

                <td class="center"
                    title="${((customer.emailSent)?? && customer.emailSent)?string('已发送','未发送')}"><#if (customer.emailSent)?? && customer.emailSent>
                    <span class="fa fa-envelope-square bigger-140 text-success"></#if></td>
                <td title="${(customer.callState)!''}">${(customer.callState)!''}</td>
                <td title="${(customer.age)!''}">${(customer.age)!''}</td>
                <td data-toggle="tooltip"
                    title="${(customer.patientCountry.name)!''}"><#if customer.patientCountry??>${customer.patientCountry.name}</#if></td>
                <td data-toggle="tooltip"
                    title="${(customer.symptom)!''}"><#if customer.symptom??>${customer.symptom}</#if></td>
                <td class="center" title="${(customer.hospitalization.textName)!''}"><#if customer.hospitalization??>
                    <#switch customer.hospitalization>
                        <#case 'YES'><span class="fa bigger fa-hotel text-danger bigger-140"></span><#break>
                        <#case 'NO'><span class="fa bigger fa-thumbs-o-down text-info bigger-140"></span><#break>
                        <#case 'DISCHARGE'><span class="fa bigger fa-child text-success bigger-140"></span><#break>
                    </#switch>
                <#else>
                <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
                <td data-toggle="tooltip" title="${(customer.website.name)!''}">${(customer.website.name)!''}</td>
            <#--来源域名-->
            <#--<td data-toggle="tooltip" title="${(customer.sourceWebsite)!''}">${(customer.sourceWebsite)!''}</td>-->
            <#--<td class=""
                title="${(customer.memo)!''}"><#if (customer.memo)??><#if customer.memo?length gt 26>${customer.memo?substring(0,26)+'...'}<#else>${customer.memo}</#if><#else>
                <span class="label"><span class="fa fa-question"></span></#if></td>-->
                <td class="center"
                    title="${(customer.ifReport?string('报备','不报备'))!''}"><#if (customer.ifReport)?? && customer.ifReport>
                    <span class="fa bigger-140 fa-circle-o-notch green"></#if></td>
            <#--<td class=""
                title="${(customer.diseaseType.name)!''}"><#if customer.diseaseType??><#if customer.diseaseType.name?length gt 8>${customer.diseaseType.name?substring(0,5)+'...'}<#else>${customer.diseaseType.name}</#if><#else>
                <span class="label">不详</span></#if></td>-->
                <td data-toggle="tooltip"
                    title="${(customer.ownerUser.realName)!''}">${(customer.ownerUser.realName)!''}</td>
                <td data-toggle="tooltip" title="${(customer.user.realName)!''}">${(customer.user.realName)!''}</td>

            <#--<td data-toggle="tooltip"
                title="${(customer.updated?string('yyyy.MM.dd HH:mm:ss'))!''}">${(customer.updated?string('yyyy.MM.dd HH:mm'))!''}</td>-->

                <td data-toggle="tooltip"
                    title="${(customer.added?string('yyyy.MM.dd HH:mm:ss'))!''}">${(customer.added?string('yyyy.MM.dd HH:mm'))!''}</td>

                <td class="">
                <#--(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)-->
                <#--||loginUser.role='MANAGER'-->
                    <span class="btn-group">
                    <#if loginUser.role?? && ['TELADMIN']?seq_contains(loginUser.role)>
                        <a href="${context.contextPath}/customer/${customer.id?c}/update-by-tel-admin"
                           class="btn btn-minier" title="编辑电话备注"> <span class="fa fa-phone bigger-120"> </span> </a>
                    </#if>
                        <#if ['ADMIN']?seq_contains(loginUser.role)>
                            <a class="btn btn-minier" href="${context.contextPath}/customer/get/${customer.id?c}"><span
                                    class="fa fa-newspaper-o bigger-120"></span></a>
                        </#if>
                        <#if ['ADMIN']?seq_contains(loginUser.role) && customer.discard>
                            <button form="from-remove-customer-${customer_index}"
                                    class="remove-control btn btn-minier btn-pink" title="已提交删除"><span
                                    class="fa fa-trash bigger-120"> </span>
                            </button>
                    <form id="from-remove-customer-${customer_index}" action="${context.contextPath}/customer/remove"
                          method="post" style="display: none;"><input type="hidden" name="id" value="${customer.id?c}">
                    </form>
                        </#if>
                        <#if (customer.memos)?? &&customer.memos?size &gt; 0>
                            <#assign tooltipTitle><#include "customer-update-memo-fragment-on-filter.ftl"></#assign>
                            <button class="btn btn-info btn-minier" data-toggle="tooltip" data-placement="left"
                                    data-title="${tooltipTitle?replace('"', '&quot;')}">&nbsp;<span
                                    class="fa fa-info"></span>&nbsp;
                            </button>
                        </#if>
            </span>
                <#--
                                    <#if ['ADMIN']?seq_contains(loginUser.role)>
                                        <button form="from-remove-customer-${customer_index}"
                                                href="${context.contextPath}/customer/remove"
                                                class="remove-control btn btn-minier ${customer.discard?then('btn-pink','btn-success')}"
                                                title="<#if customer.discard>已提交删除<#else>未提交删除</#if>"><span class="fa fa-trash"> </span>
                                        </button>
                                    <form id="from-remove-customer-${customer_index}"
                                          action="${context.contextPath}/customer/remove" method="post"
                                          style="display: none;"><input type="hidden" name="id"
                                                                        value="${customer.id?c}">
                                    </form>
                                    </#if>
                -->
                </td>
            </tr>
            </#list>
            </tbody>
        </table>
        <div class="row">
            <div class="col-md-2"><span class="btn-group btn-corner"><a href=""
                                                                        style="color:#FFF;text-decoration:none;"
                                                                        class="btn btn-info btn-sm"
                                                                        title="刷新列表"><span
                    class="fa fa-refresh"></span></a></span></div>
            <div class="col-md-10">
            <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
            </div>
        </div>
    </div>
</div>

<#include "/common/common_js.ftl">
<#--<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>-->
<#--<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>-->
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>

<script src="${context.contextPath}/resources/self/select2/js/select2.min.js"></script>


<script>
    var l;
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
        $('#stars-ui').raty({
            noRatedMsg: "I'am readOnly and I haven't rated yet!",
            starType: 'span',
//            score: 0,
            cancel: true,
            cancelHint: '零意向',
            hints: ['好', '很好', '非常好', '棒极了', 'YEAH'],
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
            "timePickerIncrement": 70,
//            "maxDate": [d.getMonth() + 1, d.getDate() + 1, d.getFullYear()].join('/')
            "maxDate": [moment().year(), moment().month() + 1, moment().date() + 1].join('-')
        }, function (start, end, label) {
//            console.log('New date range selected: ' + start.format('YYYY-MM-DD HH') + ' to ' + end.format('YYYY-MM-DD HH'));
//            console.log(start);
            $('#date-range').val([start.format('YYYY年MM月DD日HH时'), ' 到 ', end.format('YYYY年MM月DD日HH时')].join(''));
//            l = start;//用于调试
            $('#date-range-input').val([start.unix() * 1000, end.unix() * 1000].join());
        });
        $('#date-range').on('cancel.daterangepicker', function (e) {
            //清除内容
            $('#date-range').val('');
            $('#date-range-input').val('');
        });

//        $('.btn').tooltip();

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

        $('[data-toggle="tooltip"]').tooltip({
            trigger: 'click hover',
            html: true
//            ,
//            selector: ':parent'
            ,
            container: 'body'
        });
        $('[data-toggle="tooltip-a"]').tooltip({trigger: 'hover'});

        $('#another-d-picker').daterangepicker();

    <#--<#if dateRange?? && dateRange?size gt 0 >-->
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    <#--</#if>-->
    });
</script>
</body>
</html>