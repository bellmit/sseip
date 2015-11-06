<f<!doctype html>
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
    </style>
</head>
<body style="background-color: white">
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
                <#--填写折叠框内容-->
                <#--查询条件开始-->
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <form id="filter-form" action="" method="get" role="search"></form>

                            <div class="row">
                                <div class="col-sm-12"><input class="filters col-sm-2 text-right green"
                                                              name="name" type="text"
                                                              form="filter-form"
                                                              title="筛选或患者咨询人的姓名"
                                                              placeholder="患者或咨询人的姓名"
                                                              value="${(RequestParameters.name)!''}"/>
                                    <input class="filters col-sm-2 text-right green" name="email"
                                           type="email" form="filter-form" title="电子邮件地址"
                                           placeholder="电子邮件地址"
                                           value="${(RequestParameters.email)!''}"/>
                                    <input class="filters col-sm-2 text-right green" name="tel"
                                           type="tel"
                                           form="filter-form"
                                           title="筛选电话"
                                           placeholder="电话" value="${(RequestParameters.tel)!''}"/>

                                    <div class="col-sm-2" style="padding: 0; margin: 0;"><select
                                            class="filters text-right pink select2-ui"
                                            name="countryId"
                                            form="filter-form" style="width:100%"
                                            title="筛选患者或咨询人的国家">
                                        <option
                                        <#if !(RequestParameters.countryId)??||RequestParameters.countryId=''>selected</#if>
                                        value="">患者或咨询人的国家
                                        </option>
                                    <#list countries as country>
                                        <option
                                            <#if (RequestParameters.countryId)?? && RequestParameters.countryId==country.id?string>selected</#if>
                                            value="${country.id?c}">${country.a2Code}
                                            - ${country.name}</option>
                                    </#list>
                                    </select></div>
                                    <div class="col-sm-2" style="padding: 0; margin: 0;"><select
                                            class="filters text-right orange select2-ui"
                                            name="diseaseTypeId" style="width:100%;"
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
                                    </select></div>
                                    <div class="col-sm-2" style="padding: 0; margin: 0;"><select
                                            class="filters text-right greens select2-ui"
                                            name="websiteId" style="width:100%;"
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
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <select class="filters col-md-2 text-right brown" name="valid"
                                            form="filter-form" title="筛选是否有效">
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
                                    </select>
                                    <select class="filters col-md-2 text-right pink"
                                            name="hospitalization"
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

                                    <div class="filters col-md-2 inline" id="stars-ui"
                                         data-init-score="${(RequestParameters.stars)!'0'}"
                                         title="筛选意向程度星级"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">

                                    <input class="filters col-md-4" id="date-range" placeholder="日期时间范围"
                                           title="选择日期时间范围"
                                           value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>
                                    <input form="filter-form" name="dateRange" type="hidden"
                                           id="date-range-input" style="display: none;"
                                           value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">
                                    <input name="stars" id="form-stars" type="hidden" form="filter-form"
                                           value="${(RequestParameters.stars)!'0'}"/>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a href="" class="filters btn btn-xs col-md-2 btn-warning">重置条件</a>
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
    <div class="row"><span class="col-md-2"><span
            class="btn-group btn-corner"><#if ['EMPLOYEE']?seq_contains(loginUser.role)><a
            href="${context.contextPath}/customer/add" target="_self" style="color:#FFF;text-decoration:none;"
            title="填写资源" class="btn btn-info btn-sm"><span class="fa fa-file"></span></a></#if><a href=""
                                                                                                  style="color:#FFF;text-decoration:none;"
                                                                                                  class="btn btn-info btn-sm"
                                                                                                  title="刷新列表"><span
            class="fa fa-refresh"></span></a></span></span> <span
            class="col-md-10"> <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if></span>
    </div>
    <table id="sample-table-1"
           class="table table-striped table-bordered table-hover table-condensed table-responsive smaller-90"
           style="word-wrap: break-word;table-layout:fixed;margin-bottom:4px;">
        <colgroup class="row">
        <#--1-->
        <#--<col style="width: 5em;">-->
            <col style="width: 10em;">
            <col style="width: 8em;">
            <col class="">
        <#--4    -->
            <col style="width: 3em;">
            <col style="width: 10em;">
            <col style="width: 10.3em;">
        <#--<col>--> <#--style="width: 11em;"--> <#--备注-->
            <col style="width: 3em;">
        <#--8-->
            <col style="width: 5.3em;">
            <col style="width: 5.3em;">
            <col style="width: 10.4em;">
            <col style="width: 10.4em;">
            <col style="width: 7em;">
        </colgroup>
        <thead>
        <tr>
        <#--<th class="text-right">ID</th>-->
            <th class="">姓名</th>
            <th class="">国家</th>
            <th class="">症状</th>
            <th class="" title="是否住院">住院</th>
            <th class="">所属网站组</th>
            <th class="">来源网站</th>
        <#--<th class="">备注</th>-->
            <th class="" title="是否报备">报备</th>
            <th class="">所属人</th>
            <th class="">提交人</th>
            <th class="">更新时间</th>
            <th class="">创建时间</th>

            <th class="center">功能</th>
        </tr>
        </thead>

        <tbody>
        <#list page.list as customer>
        <tr>
        <#--<td class="">${customer.id?c}</td>-->
            <td class=""
                <#if (customer.patientName)??>title="${customer.patientName}"</#if>>
                <div>
                    <span class=" label-minier label-yellow">${(customer.stars)!'0'}</span>
                    <#if (customer.patientName)??>
                        <#if customer.patientName?length gt 18>${customer.patientName?substring(0,18)+'...'}<#else>${customer.patientName}</#if>
                    <#else>
                        <#if (customer.liaisonName)??>
                        ${customer.liaisonName}<#else><span
                                class="label">不详</span></#if>
                    </#if>
                </div>
            <#--<div class="stars-ui-ele btn-minier rating"
                 data-init-score="${(customer.stars)!'0'}" title="意向的星级"
                 style="font-size: 7px"></div>-->
            </td>
            <td class=""<#if customer.patientCountry??>
                title="${customer.patientCountry.name}"</#if>><#if customer.patientCountry??><#if (customer.patientCountry.name)?length gt 7>${customer.patientCountry.name?substring(0,6)+'...'}<#else>${customer.patientCountry.name}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td title="${(customer.symptom)!''}"><#if customer.symptom??><#if (customer.symptom)?length gt 24>${customer.symptom?substring(0,24)+'...'}<#else>${customer.symptom}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class="center" title="${(customer.hospitalization.textName)!''}"><#if customer.hospitalization??>
                <#switch customer.hospitalization>
                    <#case 'YES'><span class="fa bigger fa-hotel text-danger bigger-140"></span><#break>
                    <#case 'NO'><span class="fa bigger fa-thumbs-o-down text-info bigger-140"></span><#break>
                    <#case 'DISCHARGE'><span class="fa bigger fa-child text-success bigger-140"></span><#break>
                </#switch>
            <#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class=""
                title="${(customer.website.name)!''}"><#if customer.website??><#if customer.website.name?length gt 8>${customer.website.name?substring(0,5)+'...'}<#else>${customer.website.name}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class=""
                title="${(customer.sourceWebsite)!''}"><#if customer.sourceWebsite??><#if customer.sourceWebsite?length gt 16>${customer.sourceWebsite?substring(0,15)+'...'}<#else>${customer.sourceWebsite}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
        <#--<td class=""
            title="${(customer.memo)!''}"><#if (customer.memo)??><#if customer.memo?length gt 26>${customer.memo?substring(0,26)+'...'}<#else>${customer.memo}</#if><#else>
            <span class="label"><span class="fa fa-question"></span></#if></td>-->
            <td class="center"
                title="<#if (customer.ifReport)??>${customer.ifReport?string('报备','不报备')}</#if>"><#if (customer.ifReport)??><#if customer.ifReport>
            <span class="fa bigger-140 fa-circle-o-notch green"></#if><#else><#--<span class="label"><span class="fa fa-question"></span></span>--></#if>
            </td>
        <#--<td class=""
            title="${(customer.diseaseType.name)!''}"><#if customer.diseaseType??><#if customer.diseaseType.name?length gt 8>${customer.diseaseType.name?substring(0,5)+'...'}<#else>${customer.diseaseType.name}</#if><#else>
            <span class="label">不详</span></#if></td>-->
            <td class=""
                title="${(customer.ownerUser.realName)!''}"><#if (customer.ownerUser.realName)??><#if customer.ownerUser.realName?length gt 8>${customer.ownerUser.realName?substring(0,5)+'...'}<#else>${customer.ownerUser.realName}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class=""
                title="${(customer.user.realName)!''}"><#if (customer.user.realName)??><#if customer.user.realName?length gt 8>${customer.user.realName?substring(0,5)+'...'}<#else>${customer.user.realName}</#if><#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class=""
                <#if customer.updated??>title="${customer.updated?string('yyyy.MM.dd HH:mm:ss')}"</#if>><#if customer.updated??>${customer.updated?string('yyyy.MM.dd HH:mm')}<#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
            <td class=""
                <#if customer.added??>title="${customer.added?string('yyyy.MM.dd HH:mm:ss')}"</#if>><#if customer.added??>${customer.added?string('yyyy.MM.dd HH:mm')}<#else>
            <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>

            <td class="">
            <#--(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)-->
            <#--||loginUser.role='MANAGER'-->
                <span class="btn-group">
                    <#if loginUser.role?? && ['TELADMIN']?seq_contains(loginUser.role)>
                        <a href="${context.contextPath}/customer/${customer.id?c}/update-by-tel-admin"
                           class="btn btn-minier" title="编辑电话备注"> <span class="fa fa-phone bigger-120"> </span> </a>
                    </#if>
                    <#if ['ADMIN']?seq_contains(loginUser.role)>
                        <a class="btn btn-minier" href="${context.contextPath}/customer/get/${customer.id}"><span
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

        $('.select2-ui').select2();


    <#if dateRange?? && dateRange?size gt 0 >
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    </#if>
    });
</script>
</body>
</html>