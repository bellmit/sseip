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
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active">个人资源一览</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
    <#--start-->
        <div class="accordion-style1 panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">
                            <span data-icon-show="ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down"
                                  class="bigger-110 ace-icon fa fa-angle-right"></span>
                            筛选查询条件
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
                                                                          placeholder="选择日期时间范围"
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
                                                     title="意向的星级"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input name="name" class="filters col-md-2 text-right green" type="text"
                                                       form="filter-form"
                                                       title="筛选患者咨询人姓名"
                                                       placeholder="筛选患者咨询人姓名"/>
                                                <input name="email" class="filters col-md-2 text-right green"
                                                       type="email"
                                                       form="filter-form"
                                                       title="电邮"
                                                       placeholder="电邮"/>
                                                <input name="tel" class="filters col-md-2 text-right green" type="tel"
                                                       form="filter-form"
                                                       title="筛选电话"
                                                       placeholder="筛选电话"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <select name="countryId" class="filters col-md-2 text-right pink"
                                                        form="filter-form" title="筛选患者或咨询人国家">
                                                    <option
                                                    <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if>
                                                    value="">筛选患者或咨询人国家
                                                    </option>
                                                <#list countries as country>
                                                    <option
                                                        <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if>
                                                        value="${country.id?c}">${country.name}</option>
                                                </#list>
                                                </select>
                                                <select name="diseaseTypeId" class="filters col-md-2 text-right orange"
                                                        form="filter-form"
                                                        title="筛选疾病类型">
                                                    <option
                                                    <#if !(RequestParameters.diseaseTypeId)?? ||RequestParameters.diseaseTypeId=''>selected</#if>
                                                    value="">筛选疾病类型
                                                    </option>
                                                <#list diseaseTypes as diseaseType>
                                                    <option
                                                        <#if (RequestParameters.diseaseTypeId)?? && RequestParameters.diseaseTypeId==diseaseType.id?string>selected</#if>
                                                        value="${diseaseType.id?c}">${diseaseType.name}</option>
                                                </#list>
                                                </select>
                                                <select name="websiteId" class="filters col-md-2 text-right green"
                                                        form="filter-form"
                                                        title="选择网站">
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
                                                <select name="valid" class="filters col-md-2 text-right brown"
                                                        form="filter-form"
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
                                                <select name="hospitalization" class="filters col-md-2 text-right pink"
                                                        form="filter-form"
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
                                                <select class="filters col-md-2 text-right brown" name="discard"
                                                        form="filter-form"
                                                        title="筛选是否提交删除">
                                                    <option
                                                    <#if !((RequestParameters.discard)??) || RequestParameters.discard=''>selected</#if>
                                                    value="">筛选是否提交删除
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
                                            <#--
                                                                            <input name="stars" class="col-md-2 text-right green" type="text" form="filter-form"
                                                                                   title="意向程度"
                                                                                   placeholder="意向程度"/>
                                            -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <a href=""
                                   class="filters btn btn-xs col-md-2 btn-warning"
                                   form="filter-form">重置条件</a>
                                <a href="${context.contextPath}/customer/filter-own/1"
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
    <#--end-->
        <div class="space-4"></div>
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                    <#--<div class="page-header position-relative">-->
                        <div class="position-relative">
                            <div class="row"><span class="col-md-2"><span class="btn-group btn-corner"><a
                                    href="${context.contextPath}/customer/add"
                                    target="_self"
                                    style="color:#FFF;text-decoration:none;"
                                    title="填写资源"
                                    class="btn btn-info fa fa-plus"></a><a
                                    href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
                                    title="刷新列表"></a></span></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
                            </div>
                        </div>
                        <table id="customer-table-1"
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
                                <th class="text-right">ID<input type="checkbox" id="check-all"></th>
                                <th class="text-right">患者国家</th>
                                <th class="text-right">患者姓名</th>
                                <th class="text-right">病种</th>
                                <th class="text-right">所属人</th>
                                <th class="text-right">创建人</th>
                                <th class="text-right">来源网站</th>
                                <th class="text-right">是否住院</th>
                                <th class="text-right">更新时间</th>
                                <th class="text-right">创建时间</th>

                                <th class="text-right">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as customer>
                            <tr>
                                <td class="text-right id-col">
                                ${customer.id?c}<input
                                        type="checkbox" class="checkbox-each-id" name="customer-ids"
                                        value="${customer.id?c}"
                                        form="pass-on-form">
                                <#--<label style="width: 100%;"></label>-->
                                </td>
                                <td class="text-right"><#if customer.patientCountry??>${customer.patientCountry.name}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if (customer.patientName)??>
                                    <div>${customer.patientName}</div><#else><#if (customer.liaisonName)??>
                                    <div>${customer.liaisonName}</div><#else>
                                    <div class="label">不详</div></#if></#if>
                                    <div class="stars-ui-ele btn-minier rating"
                                         data-init-score="${(customer.stars)!'0'}" title="意向的星级"
                                         style="font-size: 7px"></div>
                                </td>
                                <td class="text-right"><#if customer.diseaseType??>${customer.diseaseType.name}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.ownerUser??>${customer.ownerUser.realName}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if (customer.user.realName)??>${customer.user.realName}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.website??>${customer.website.name}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.hospitalization??>${customer.hospitalization.textName}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.updated??>${customer.updated?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.added??>${customer.added?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>

                                <td class="center">
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.ownerUserId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <span class="btn-group">
                                            <a class="btn btn-minier"
                                               href="${context.contextPath}/customer/get/${customer.id?c}"
                                               title="查看"><span class="fa fa-search"></span></a>
                                        <a class="btn btn-minier" href="/customer/update/${customer.id?c}"
                                           title="编辑"><span
                                                class="fa fa-edit"></span></a>

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
                                                    class="fa fa-trash"></span>
                                            </button>
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
                        <div class="row">
                            <div class="col-sm-12 filters"><select name="new-owner-user-id"
                                                                   class="col-md-2 text-right pink2" form="pass-on-form"
                                                                   title="转交给用户">
                                <option
                                <#if (RequestParameters.newOwnerUserId)!''=''>selected</#if>
                                value="">转交给用户
                                </option>
                            <#list users as user>
                                <option
                                    <#if (RequestParameters.newOwnerUserId)!''==user.id?string>selected</#if>
                                    value="${user.id?c}">${(user.group.name + ' - ')!''}${user.realName}</option>
                            </#list>
                            </select>
                                <button type="submit" class="btn btn-xs col-md-2 text-right btn-warning"
                                        form="pass-on-form">转交给用户
                                </button>
                                <form id="pass-on-form" method="post"
                                      action="${context.contextPath}/customer/pass"></form>
                            </div>
                        </div>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2">
                                <span class="btn-group btn-corner"><a href="${context.contextPath}/customer/add"
                                                                      target="_self" title="填写资源"
                                                                      class="btn btn-info fa fa-plus"></a><a href=""
                                                                                                             class="btn btn-info fa fa-refresh"
                                                                                                             title="刷新列表"></a></span></span>
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

        $('#check-all').change(function (e) {
            $('.checkbox-each-id').prop('checked', $('#check-all').prop('checked'));
        });

        /**
         * 两个事件，用于阻止checkbox事件冒泡，和绑定td点击事件；附加对全选的td点击事件绑定
         */
        $('.checkbox-each-id,#check-all').click(function (e) {
            e.stopPropagation();
        });
        $('.id-col').click(function (e) {
            var i = $('.checkbox-each-id', this);
            i.prop('checked', !i.prop('checked'));
            e.stopPropagation();
        });
        $('th:first').click(function (e) {
            $('#check-all').click();
            e.stopPropagation();
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

    <#--<#if dateRange?? && dateRange?size gt 0 >-->
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    <#--</#if>-->
    });
</script>
</body>
</html>