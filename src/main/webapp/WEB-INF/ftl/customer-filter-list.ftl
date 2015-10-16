<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "/common/common_css.ftl">

    <!--daterangepicker-->
    <link rel="stylesheet" href="${context.contextPath}/resources/self/daterangepicker.css"/>
</head>
<body class="no-skin">
<div class="main-content-inner">
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
            <div class="col-md-12 col-xs-12">
                <form id="filter-form" action="" method="get" role="search"></form>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-12 filters"><input class="col-md-4" id="date-range"
                                                                  placeholder="选择日期时间范围"
                                                                  title="选择日期时间范围"
                                                                  value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>
                                <input form="filter-form" name="dateRange" type="text" id="date-range-input"
                                       style="display: none;"
                                       value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">

                                <select name="websiteId" class="col-md-2 text-right green" form="filter-form"
                                        title="选择网站">
                                    <option
                                    <#if !(RequestParameters.websiteId)?? || RequestParameters.websiteId=''>selected</#if>
                                    value="">
                                        选择网站
                                    </option>
                                <#list websites as website>
                                    <option
                                        <#if (RequestParameters.websiteId)?? && RequestParameters.websiteId==website.id?string>selected</#if>
                                        value="${website.id}">${website.name}</option>
                                </#list>
                                </select>

                                <input name="tel" class="col-md-2 text-right green" type="tel" form="filter-form"
                                       title="筛选电话"
                                       placeholder="筛选电话"/>
                                <input name="name" class="col-md-2 text-right green" type="text" form="filter-form"
                                       title="筛选患者咨询人姓名"
                                       placeholder="筛选患者咨询人姓名"/>
                                <select name="countryId" class="col-md-2 text-right pink" form="filter-form"
                                        title="筛选患者或咨询人国家">
                                    <option
                                    <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if>
                                    value="">筛选患者或咨询人国家
                                    </option>
                                <#list countries as country>
                                    <option
                                        <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if>
                                        value="${country.id}">${country.name}</option>
                                </#list>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 filters"><select name="userId" class="col-md-2 text-right pink2"
                                                                   form="filter-form" title="筛选所属人">
                                <option
                                <#if !(RequestParameters.userId)?? || RequestParameters.userId=''>selected</#if>
                                value="">筛选所属人
                                </option>
                            <#list users as user>
                                <option
                                    <#if (RequestParameters.userId)?? && RequestParameters.userId==user.id?string>selected</#if>
                                    value="${user.id}">${(user.group.name + ' - ')!''}${user.realName}</option>
                            </#list>
                            </select>
                                <input name="email" class="col-md-2 text-right green" type="email" form="filter-form"
                                       title="电邮"
                                       placeholder="电邮"/>
                                <select name="diseaseTypeId" class="col-md-2 text-right orange" form="filter-form"
                                        title="筛选疾病类型">
                                    <option
                                    <#if !(RequestParameters.diseaseTypeId)?? ||RequestParameters.diseaseTypeId=''>selected</#if>
                                    value="">筛选疾病类型
                                    </option>
                                <#list diseaseTypes as diseaseType>
                                    <option
                                        <#if (RequestParameters.diseaseTypeId)?? && RequestParameters.diseaseTypeId==diseaseType.id?string>selected</#if>
                                        value="${diseaseType.id}">${diseaseType.name}</option>
                                </#list>
                                </select>
                                <select name="valid" class="col-md-2 text-right brown" form="filter-form"
                                        title="筛选是否是否有效">
                                    <option
                                    <#if !((RequestParameters.faraway)??) || RequestParameters.faraway=''>selected</#if>
                                    value="">筛选是否有效
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
                                <select name="hospitalization" class="col-md-2 text-right pink" form="filter-form"
                                        title="筛选住院类型">
                                    <option
                                    <#if !(RequestParameters.hospitalization)??||RequestParameters.hospitalization=''>selected</#if>
                                    value="">筛选住院类型
                                    </option>
                                <#list hospitalizationTypes as hospitalizationType>
                                    <option
                                        <#if (RequestParameters.hospitalization)?? && RequestParameters.hospitalization==hospitalizationType.code?string>selected</#if>
                                        value="${hospitalizationType.code}">${hospitalizationType.textName}</option>
                                </#list>
                                </select>
                                <input name="stars" class="col-md-2 text-right green" type="text" form="filter-form"
                                       title="意向程度"
                                       placeholder="意向程度"/>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <a href="" class="btn btn-xs col-md-2 text-right btn-warning" form="filter-form">重置条件</a>
                <a href="${context.contextPath}/customer/filter/1"
                   class="btn btn-xs col-md-2 text-right btn-grey">重新搜索</a>
                <button type="submit" class="btn btn-xs col-md-2 text-right btn-info" form="filter-form">查询
                </button>
            </div>
        </div>
        <div class="space-4"></div>
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                    <#--<div class="page-header position-relative">-->
                        <div class="position-relative">
                            <div class="row"><span class="col-md-2"><a href="${context.contextPath}/customer/add"
                                                                       target="_self"
                                                                       style="color:#FFF;text-decoration:none;"
                                                                       title="填写资源"
                                                                       class="btn btn-info fa fa-plus"></a> <a
                                    href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
                                    title="刷新列表"></a></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
                            </div>
                        </div>
                        <table id="sample-table-1"
                               class="table table-striped table-bordered table-hover table-condensed table-responsive"
                               style="word-break: break-all;table-layout:fixed">
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
                                <th class="text-right">患者国家</th>
                                <th class="text-right">患者姓名</th>
                                <th class="text-right">星级</th>
                                <th class="text-right">病种</th>
                                <th class="text-right">所属人</th>
                                <th class="text-right">来源网站</th>
                                <th class="text-right">更新时间</th>
                                <th class="text-right">创建时间</th>

                                <th class="text-right">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as customer>
                            <tr>
                                <td class="text-right">${customer.id}</td>
                                <td class="text-right"><#if customer.patientCountry??>${customer.patientCountry.name}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.patientName??>${customer.patientName}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.stars??>${customer.stars}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.diseaseType??>${customer.diseaseType.name}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.user??>${customer.user.realName}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.website??>${customer.website.name}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.updated??>${customer.updated?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.added??>${customer.added?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>

                                <td class="center">
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="/customer/update/${customer.id}"><span
                                                class="fa fa-edit"></span></a>

                                        <form action="${context.contextPath}/customer/remove" method="post"
                                              style="display: inline;"><input type="hidden" name="id"
                                                                              value="${customer.id}">
                                            <button href="${context.contextPath}/customer/remove"><span
                                                    class="fa fa-trash"></span></button>
                                            <a class="fa fa-search"
                                               href="${context.contextPath}/customer/get/${customer.id}"><span
                                                    class="fa fa-query"></span></a>
                                        </form>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2"><a href="${context.contextPath}/customer/add"
                                                                       target="_self"
                                                                       style="color:#FFF;text-decoration:none;"
                                                                       title="填写资源"
                                                                       class="btn btn-info fa fa-plus"></a> <a
                                    href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
                                    title="刷新列表"></a></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- /.span -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>

<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>
<script>
    var l;
    $(function () {
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

    <#if dateRange?? && dateRange?size gt 0 >
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    </#if>
    });
</script>
</body>
</html>