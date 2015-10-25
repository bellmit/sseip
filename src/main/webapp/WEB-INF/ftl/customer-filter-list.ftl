<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "/common/common_css.ftl">

    <!--daterangepicker-->
    <link rel="stylesheet" href="${context.contextPath}/resources/self/daterangepicker.css"/>
    <style>
        .filters {
            height: 27px;
            margin-top: 3px;
            margin-bottom: 3px;
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body style="background-color: white">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active">全部资源一览</li>
        </ul>
        <!-- /.breadcrumb -->
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
                        筛选条件
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                <#--查询条件开始-->
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <form id="filter-form" action="" method="get" role="search"></form>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">

                                        <div class="col-sm-12"><input class="filters col-md-4" id="date-range"
                                                                      placeholder="日期时间范围"
                                                                      title="选择日期时间范围"
                                                                      value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>
                                            <input form="filter-form" name="dateRange" type="hidden"
                                                   id="date-range-input"
                                                   style="display: none;"
                                                   value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">

                                            <input name="stars" id="form-stars" type="hidden" form="filter-form"
                                                   value="${(RequestParameters.stars)!'0'}"/>

                                            <div class="filters rating inline" id="stars-ui"
                                                 data-init-score="${(RequestParameters.stars)!'0'}"
                                                 title="筛选意向程度星级"></div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <input class="filters col-md-2 text-right green" name="name" type="text"
                                                   form="filter-form"
                                                   title="筛选或患者咨询人的姓名"
                                                   placeholder="患者或咨询人的姓名"/>
                                            <input class="filters col-md-2 text-right green" name="email"
                                                   type="email" form="filter-form" title="电子邮件地址" placeholder="电子邮件地址"/>
                                            <input class="filters col-md-2 text-right green" name="tel" type="tel"
                                                   form="filter-form"
                                                   title="筛选电话"
                                                   placeholder="电话"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <select class="filters col-md-2 text-right pink" name="countryId"
                                                    form="filter-form"
                                                    title="筛选患者或咨询人的国家">
                                                <option
                                                <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if>
                                                value="">患者或咨询人的国家
                                                </option>
                                            <#list countries as country>
                                                <option
                                                    <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if>
                                                    value="${country.id?c}">${country.name}</option>
                                            </#list>
                                            </select>
                                            <select class="filters col-md-2 text-right orange" name="diseaseTypeId"
                                                    form="filter-form" title="筛选疾病类型">
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
                                            <select class="filters col-md-2 text-right green" name="websiteId"
                                                    form="filter-form" title="选择网站">
                                                <option
                                                <#if !(RequestParameters.websiteId)?? || RequestParameters.websiteId=''>selected</#if>
                                                value="">
                                                    选择网站
                                                </option>
                                            <#list websites as website>
                                                <option
                                                    <#if (RequestParameters.websiteId)?? && RequestParameters.websiteId==website.id?string>selected</#if>
                                                    value="${website.id?c}">${website.name}</option>
                                            </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <select class="filters col-md-2 text-right brown" name="valid"
                                                    form="filter-form" title="筛选是否有效">
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
                                            </select>
                                            <select class="filters col-md-2 text-right pink" name="hospitalization"
                                                    form="filter-form" title="筛选住院类型">
                                                <option
                                                <#if !(RequestParameters.hospitalization)??||RequestParameters.hospitalization=''>selected</#if>
                                                value="">住院类型
                                                </option>
                                            <#list hospitalizationTypes as hospitalizationType>
                                                <option
                                                    <#if (RequestParameters.hospitalization)?? && RequestParameters.hospitalization==hospitalizationType.code?string>selected</#if>
                                                    value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                            </#list>
                                            </select>
                                            <select class="filters col-md-2 text-right brown" name="discard"
                                                    form="filter-form" title="筛选是否提交删除">
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
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <select name="ifReport" class="filters col-md-2 text-right brown"
                                                    form="filter-form"
                                                    title="筛选是否报备">
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
                                            </select>
                                            <select class="filters col-md-2 text-right pink2"
                                                    name="userId" form="filter-form"
                                                    title="筛选所属人">
                                                <option
                                                <#if !(RequestParameters.userId)?? || RequestParameters.userId=''>selected</#if>
                                                value="">所属人
                                                </option>
                                            <#list users as user>
                                                <option
                                                    <#if (RequestParameters.userId)?? && RequestParameters.userId==user.id?string>selected</#if>
                                                    value="${user.id?c}">${(user.group.name + ' - ')!''}${(user.realName)!'佚名'}</option>
                                            </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a href="" class="filters btn btn-xs col-md-2 btn-warning"
                               form="filter-form">重置条件</a>
                            <a href="${context.contextPath}/customer/filter/1"
                               class="filters btn btn-xs col-md-2 btn-grey">重新搜索</a>
                            <button type="submit" class="filters btn btn-xs col-md-2 btn-info"
                                    form="filter-form">查询
                            </button>
                        </div>
                    </div>
                <#--查询条件结束-->
                </div>
            </div>
        </div>
    </div>
<#--折叠栏结束-->


<#--<div class="page-header position-relative">-->
    <div><span class="col-md-2"><span class="btn-group btn-corner"><a
            href="${context.contextPath}/customer/add"
            target="_self"
            style="color:#FFF;text-decoration:none;"
            title="填写资源"
            class="btn btn-info btn-sm"><span class="fa fa-plus"></span></a><a href=""
                                                                               style="color:#FFF;text-decoration:none;"
                                                                               class="btn btn-info btn-sm"
                                                                               title="刷新列表"><span
            class="fa fa-refresh"></span></a></span></span> <span
            class="col-md-10"> <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if> </span>
    </div>
    <table id="sample-table-1"
           class="table table-striped table-bordered table-hover table-condensed table-responsive"
           style="word-wrap: break-word;table-layout:fixed">
    <#--<colgroup class="row">
        <col class="col-sm-1">
        <col class="col-sm-2">
        <col class="col-sm-2">
        <col class="col-sm-2">
        <col class="col-sm-2">
        <col class="col-sm-1">
        <col class="col-sm-2">
    </colgroup>-->
        <thead>
        <tr>
            <th class="text-right">ID</th>
            <th class="text-right">姓名</th>
            <th class="text-right">国家</th>
            <th class="text-right">症状</th>
            <th class="text-right">是否住院</th>
            <th class="text-right">所属网站</th>
            <th class="text-right">备注</th>
            <th class="text-right">是否报备</th>
            <th class="text-right">所属人</th>
            <th class="text-right">提交人</th>
            <th class="text-right">更新时间</th>
            <th class="text-right">创建时间</th>

            <th class="text-right">功能</th>
        </tr>
        </thead>

        <tbody>
        <#list page.list as customer>
        <tr>
            <td class="text-right">${customer.id?c}</td>
            <td class="text-right"
                <#if (customer.patientName)??>title="${customer.patientName}"</#if>>
                <div>
                    <#if (customer.patientName)??>
                        <#if customer.patientName?length gt 8>${customer.patientName?substring(0,5)+'...'}<#else>${customer.patientName}</#if>
                    <#else>
                        <#if (customer.liaisonName)??>
                        ${customer.liaisonName}<#else><span
                                class="label">不详</span></#if>
                    </#if> <span class="badge badge-yellow">${(customer.stars)!'0'}</span>
                </div>
            <#--<div class="stars-ui-ele btn-minier rating"
                 data-init-score="${(customer.stars)!'0'}" title="意向的星级"
                 style="font-size: 7px"></div>-->
            </td>
            <td class="text-right"<#if customer.patientCountry??>
                title="${customer.patientCountry.name}"</#if>><#if customer.patientCountry??><#if (customer.patientCountry.name)?length gt 10>${customer.patientCountry.name?substring(0,8)+'...'}<#else>${customer.patientCountry.name}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"
                title="${(customer.symptom)!''}"><#if customer.symptom??><#if (customer.symptom)?length gt 6>${customer.symptom?substring(0,5)+'...'}<#else>${customer.symptom}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"><#if customer.hospitalization??>${customer.hospitalization.textName}<#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"
                title="${(customer.website.name)!''}"><#if customer.website??><#if customer.website.name?length gt 8>${customer.website.name?substring(0,5)+'...'}<#else>${customer.website.name}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"><#if customer.memo??><#if customer.memo?length gt 6>${customer.memo?substring(0,5)+'...'}<#else>${customer.memo}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"><#if (customer.ifReport)??>${customer.ifReport?string('报备','不报备')}<#else>
                <span class="label">不详</span></#if></td>
        <#--<td class="text-right"
            title="${(customer.diseaseType.name)!''}"><#if customer.diseaseType??><#if customer.diseaseType.name?length gt 8>${customer.diseaseType.name?substring(0,5)+'...'}<#else>${customer.diseaseType.name}</#if><#else>
            <span class="label">不详</span></#if></td>-->
            <td class="text-right"
                title="${(customer.ownerUser.realName)!''}"><#if (customer.ownerUser.realName)??><#if customer.ownerUser.realName?length gt 8>${customer.ownerUser.realName?substring(0,5)+'...'}<#else>${customer.ownerUser.realName}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"
                title="${(customer.user.realName)!''}"><#if (customer.user.realName)??><#if customer.user.realName?length gt 8>${customer.user.realName?substring(0,5)+'...'}<#else>${customer.user.realName}</#if><#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"
                <#if customer.updated??>title="${customer.updated?string('yyyy.MM.dd HH:mm:ss')}"</#if>><#if customer.updated??>${customer.updated?string('M.dd')}<#else>
                <span class="label">不详</span></#if></td>
            <td class="text-right"
                <#if customer.added??>title="${customer.added?string('yyyy.MM.dd HH:mm:ss')}"</#if>><#if customer.added??>${customer.added?string('M.dd')}<#else>
                <span class="label">不详</span></#if></td>

            <td class="center">
                <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& (customer.ownerUserId)??
                && loginUser.id==customer.ownerUserId) ||(loginUser.role='DIRECTOR'
                && customer.groupId?? && loginUser.groupId??
                && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'
                ||loginUser.role='MANAGER')>
                <span class="btn-group">
                    <a href="${context.contextPath}/customer/get/${customer.id?c}"
                       class="btn btn-minier" title="查看"><span class="fa fa-heart-o"></span></a>
                                        <a href="/customer/update/${customer.id?c}"
                                           class="btn btn-minier" title="编辑"><span
                                                class="fa fa-stethoscope"></span></a>

                    <#if ['ADMIN']?seq_contains(loginUser.role)>
                        <button form="from-remove-customer-${customer_index}"
                                href="${context.contextPath}/customer/remove"
                                class="remove-control btn btn-minier <#if customer.discard>btn-pink<#else>btn-success</#if>"
                                title="<#if customer.discard>已提交删除<#else>未提交删除</#if>"> <span
                                class="fa fa-trash"> </span>
                        </button>
                                            <form id="from-remove-customer-${customer_index}"
                                                  action="${context.contextPath}/customer/remove" method="post"
                                                  style="display: none;"><input type="hidden" name="id"
                                                                                value="${customer.id?c}">
                                            </form></#if>
                </#if>
            </span>
            </td>
        </tr>
        </#list>
        </tbody>
    </table>
    <div><span class="col-md-2"><span class="btn-group btn-corner"><a
            href="${context.contextPath}/customer/add" target="_self"
            style="color:#FFF;text-decoration:none;" title="填写资源"
            class="btn btn-info btn-sm"><span class="fa fa-plus"></span></a><a href=""
                                                                               style="color:#FFF;text-decoration:none;"
                                                                               class="btn btn-info btn-sm"
                                                                               title="刷新列表"><span
            class="fa fa-refresh"></span></a></span></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
    </div>
</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>

<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>

<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

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

        var d = new Date();
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
            "maxDate": [d.getFullYear(), d.getMonth() + 1, d.getDate() + 1].join('-')
        }, function (start, end, label) {
//            console.log('New date range selected: ' + start.format('YYYY-MM-DD HH') + ' to ' + end.format('YYYY-MM-DD HH'));
//            console.log(start);
            $('#date-range').val([start.format('YYYY年MM月DD日HH时'), ' 到 ', end.format('YYYY年MM月DD日HH时')].join(''));
//            l = start;//用于调试
            $('#date-range-input').val([start.unix() * 1000, end.unix() * 1000].join());
        });
        $('.btn').tooltip();

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


    <#if dateRange?? && dateRange?size gt 0 >
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    </#if>
    });
</script>
</body>
</html>