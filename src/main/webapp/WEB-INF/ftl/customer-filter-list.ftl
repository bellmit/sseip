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
            <li class="active">顾客资源列表</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <form id="filter-form" action="" method="get" role="search"></form>
                <select name="sex" class="col-md-2 text-right red" form="filter-form" title="选择性别">
                    <option <#if !(RequestParameters.sex)?? || RequestParameters.sex=''>selected</#if> value="">选择性别
                    </option>
                <#list sexTypes as sexType>
                    <option <#if (RequestParameters.sex)?? && RequestParameters.sex==sexType.code?string>selected</#if>
                            value="${sexType.code}">${sexType.textName}</option>
                </#list>
                </select>
                <select name="website" class="col-md-2 text-right green" form="filter-form" title="选择网站">
                    <option <#if !(RequestParameters.website)?? || RequestParameters.website=''>selected</#if> value="">
                        选择网站
                    </option>
                <#list websites as website>
                    <option
                        <#if (RequestParameters.website)?? && RequestParameters.website==website.code?string>selected</#if>
                        value="${website.code}">${website.textName}</option>
                </#list>
                </select>
                <select name="accessPointType" class="col-md-2 text-right pink" form="filter-form" title="选择接入点类型">
                    <option
                    <#if !(RequestParameters.accessPointType)??||RequestParameters.accessPointType=''>selected</#if>
                    value="">选择接入点类型
                    </option>
                <#list accessPointTypes as accessPointType>
                    <option
                        <#if (RequestParameters.accessPointType)?? && RequestParameters.accessPointType==accessPointType.code?string>selected</#if>
                        value="${accessPointType.code}">${accessPointType.textName}</option>
                </#list>
                </select>
                <select name="diseaseType" class="col-md-2 text-right orange" form="filter-form" title="选择疾病类型">
                    <option <#if !(RequestParameters.diseaseType)?? ||RequestParameters.diseaseType=''>selected</#if>
                            value="">选择疾病类型
                    </option>
                <#list diseaseTypes as diseaseType>
                    <option
                        <#if (RequestParameters.diseaseType)?? && RequestParameters.diseaseType==diseaseType.code?string>selected</#if>
                        value="${diseaseType.code}">${diseaseType.textName}</option>
                </#list>
                </select>
                <select name="faraway" class="col-md-2 text-right brown" form="filter-form" title="选择是否边远">
                    <option <#if !((RequestParameters.faraway)??) || RequestParameters.faraway=''>selected</#if>
                            value="">选择是否边远
                    </option>
                    <option <#if (RequestParameters.faraway)?? && RequestParameters.faraway=='1'>selected</#if>
                            value="1">边远
                    </option>
                    <option <#if (RequestParameters.faraway)?? && RequestParameters.faraway=='0'>selected</#if>
                            value="0">不远
                    </option>
                </select>
                <select name="emergency" class="col-md-2 text-right light-red" form="filter-form" title="选择是否急救">
                    <option <#if !((RequestParameters.emergency)??) || RequestParameters.emergency=''>selected</#if>
                            value="">选择是否急救
                    </option>
                    <option <#if (RequestParameters.emergency)?? && RequestParameters.emergency==1?string>selected</#if>
                            value="1">急救
                    </option>
                    <option <#if (RequestParameters.emergency)?? && RequestParameters.emergency==0?string>selected</#if>
                            value="0">不需要
                    </option>
                </select>
                <select name="groupId" class="col-md-2 text-right purple" form="filter-form" title="选择部门">
                    <option <#if !(RequestParameters.groupId)?? || RequestParameters.groupId=''>selected</#if> value="">
                        选择部门
                    </option>
                <#list groups as group>
                    <option
                        <#if (RequestParameters.groupId)?? && RequestParameters.groupId==group.id?string>selected</#if>
                        value="${group.id}">${group.name}</option>
                </#list>
                </select>
                <select name="userId" class="col-md-2 text-right pink2" form="filter-form" title="或选择员工">
                    <option  <#if !(RequestParameters.userId)?? || RequestParameters.userId=''>selected</#if> value="">
                        或选择员工
                    </option>
                <#list users as user>
                    <option
                        <#if (RequestParameters.userId)?? && RequestParameters.userId==user.id?string>selected</#if>
                        value="${user.id}">${(user.group.name + ' - ')!''}${user.realName}</option>
                </#list>
                </select>

            <#--<input class="col-md-3 btn btn-pink btn-xs" type="text" id="date-range" placeholder="选择日期范围">-->
            <#--<input class="col-md-3" id="date-range" placeholder="选择日期时间范围" title="选择日期时间范围" readonly="readonly"/>-->
                <input class="col-md-3" id="date-range" placeholder="选择日期时间范围" title="选择日期时间范围"
                       value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>

            <#--<input form="filter-form" name="since" type="hidden" id="date-since">-->
            <#--<input form="filter-form" name="till" type="hidden" id="date-till">-->
                <input form="filter-form" name="dateRange" type="text" id="date-range-input" style="display: none;"
                       value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="reset" class="btn btn-xs col-md-2 text-right btn-warning" form="filter-form">重置条件</button>
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
                                                                       title="填写顾客资源"
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
                                <th class="text-right">id</th>
                                <th class="text-right">姓名</th>
                                <th class="text-right">性别</th>
                                <th class="text-right">年龄</th>
                                <th class="text-right">地址</th>
                                <th class="text-right">症状</th>
                                <th class="text-right">电子邮件</th>
                                <th class="text-right">电话</th>
                                <th class="text-right">网站</th>
                                <th class="text-right">疾病类型</th>
                                <th class="text-right">接入点类型</th>
                                <th class="text-right">边远</th>
                                <th class="text-right">急救</th>
                                <th class="text-right">创建时间</th>
                                <th class="text-right">创建人</th>
                                <th class="text-right">部门</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as customer>
                            <tr>
                                <td class="text-right">${customer.id}</td>
                                <td class="text-right"><#if (customer.name)??>${customer.name}<#else>
                                    <span>不详</span></#if>
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="${context.contextPath}/customer/detail/${customer.id}"
                                           class="list_link"><span class="fa fa-eye"></span></a>
                                    </#if></td>
                                <td class="text-right">
                                    <#if (customer.sex)??>${customer.sex.textName}<#else>
                                        <span>不详</span></#if></td>
                                <td class="text-right"><#if (customer.age)??>${customer.age}<#else>
                                    <span>没有写</span></#if>
                                </td>

                                <td class="text-right"><#if (customer.address)??>${customer.address}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.symptom)??>${customer.symptom}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.email)??>${customer.email}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.tel)??>${customer.tel}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.website)??>${customer.website.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.diseaseType)??>${customer.diseaseType.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.accessPointType)??>${customer.accessPointType.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.faraway)??>${customer.faraway?string('是','否')}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.emergency)??>${customer.emergency?string('是','否')}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.added)??>${customer.added?string("yyyy-MM-dd,HH:mm:ss")}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="text-right"><#if (customer.user.realName)??>${customer.user.realName}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="text-right"><#if (customer.group.name)??>${customer.group.name}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="center">
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="/customer/update/${customer.id}"><span
                                                class="fa fa-edit"></span></a>

                                        <form action="${context.contextPath}/customer/remove" method="post"
                                              style="display: inline;"><input type="hidden" name="id"
                                                                              value="${customer.id}">
                                            <button href="${context.contextPath}/customer/remove"><span
                                                    class="fa fa-trash"></span></button>
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
                                                                       title="填写顾客资源"
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