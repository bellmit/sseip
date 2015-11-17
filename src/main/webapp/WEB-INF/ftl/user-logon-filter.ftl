<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <link rel="stylesheet" href="${context.contextPath}/resources/self/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/self/select2/css/select2.css"/>
    <title>用户登录记录一览</title>
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
<#--<div class="main-content-inner">-->
<div class="container-fluid">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><#--<span class="fa fa-clock-o"></span>-->登录记录</li>
        </ul>
    </div>

    <form id="filter-form" action="javascript:;" role="search" style="display: none;"></form>
    <div class="space-4"></div>
    <div class="row">
        <div class="col-md-2"><input class="filters text-right green" name="userId" type="text"
                                     form="filter-form" style="width:100%;" title="用户ID" placeholder="用户ID"
                                     value="${(query.userId?long?c)!''}"/></div>
        <div class="col-md-2"><input class="filters col-sm-2 text-right green" name="realName" type="text"
                                     form="filter-form" style="width:100%;" title="用户姓名" placeholder="用户姓名"
                                     value="${(query.realName)!''}"/></div>
        <div class="col-md-2"><input class="filters col-sm-2 text-right green" name="username" type="text"
                                     form="filter-form" style="width:100%;" title="登录名" placeholder="登录名"
                                     value="${(query.username)!''}"/></div>
        <div class="col-md-2"><input class="filters col-sm-2 text-right green" name="ip" type="text"
                                     form="filter-form" style="width:100%;" title="登录IP" placeholder="登录IP"
                                     value="${(query.ip)!''}"/></div>

        <div class="col-md-4"><input style="width:100%;" class="filters text-right" id="date-range"
                                     placeholder="日期时间范围"
                                     title="选择日期时间范围"
                                     value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?string("yyyy年MM月dd日HH时")} 到 ${dateRange[1]?string("yyyy年MM月dd日HH时")}</#if>"/>
        </div>
        <input form="filter-form" name="dateRange" type="hidden"
               id="date-range-input" style="display: none;"
               value="<#if dateRange?? && dateRange?size gt 0 >${dateRange[0]?long?c},${dateRange[1]?long?c}</#if>">
        <input form="filter-form" name="start" type="hidden"
               id="date-range-input-start" style="display: none;"
               value="${(query.start?long?c)!''}" data-init="${(query.start?long?c)!''}">
        <input form="filter-form" name="till" type="hidden"
               id="date-range-input-end" style="display: none;"
               value="${(query.end?long?c)!''}" data-init="${(query.end?long?c)!''}">
    </div>

    <div class="space-4"></div>
    <div class="row">
        <div class="col-sm-10 col-sm-offset-0">
        <#--form="filter-form"-->
            <span class="btn-group btn-corner">
                <a style="filters" href="${context.contextPath}/user/logon-filter"
                   class="btn btn-sm"><span class="fa fa-bulleye"></span>重新搜索
                </a>
                <button id="btn-filter-clear" style="filters"
                        class="btn btn-sm"><span class="fa fa-eraser"></span>清空
                </button>
                <button id="btn-filter-reset" style="filters" type="reset" form="filter-form"
                        class="btn btn-sm"><span class="fa fa-reply-all"></span>重置
                </button>
                <button id="btn-filter-submit" style="filters" type="submit" form="filter-form"
                        class="btn btn-primary btn-sm"><span class="fa fa-search"></span>查询
                </button>
                    </span>
        </div>

    </div>

    <div class="space-4"></div>
    <div class="row">
        <div class="col-sm-12">
            <table id="sample-table-1"
                   class="table table-striped table-bordered table-hover table-condensed table-responsive smaller-90"
                   style="word-wrap: break-word;;table-layout:fixed;margin-bottom:4px;">
                <colgroup>
                <#--<col style="">-->
                <#--<col style="">-->
                <#--<col style="">-->
                <#--<col style="">-->
                <#--<col style="">-->
                <#--<col style="">-->
                </colgroup>
                <thead>
                <tr>
                    <th>用户ID</th>
                    <th>登录名</th>
                    <th>用户姓名</th>
                    <th>IP地址</th>
                    <th>登录时间</th>
                    <th>角色</th>
                </tr>
                </thead>
                <tbody>
                <#list page.list as logon>
                <tr>
                    <td>${(logon.user.id)!''}</td>
                    <td>${(logon.user.username)!''}</td>
                    <td>${(logon.user.realName)!''}</td>
                    <td>${logon.ip}</td>
                    <td>${logon.loggedOn?string('yyyy-MM-dd HH:mm:ss')}</td>
                    <td>
                        <#switch logon.user.role>
                            <#case 'ADMIN'>
                                <#assign iconClass="fa-user-secret">
                                <#assign iconColorClass="dark">
                                <#break >
                            <#case 'TELADMIN'>
                                <#assign iconClass="fa-phone-square">
                                <#assign iconColorClass="brown">
                                <#break >
                            <#case 'EMPLOYEE'>
                                <#assign iconClass="fa-user-md">
                                <#assign iconColorClass="white">
                                <#break >
                            <#default>
                                <#assign iconClass="fa-question">
                                <#assign iconColorClass="">
                        </#switch>
                        <span class="badge badge-success"><span
                                class="fa bigger-140 dark ${(iconClass)!'fa-question'} ${(iconColorClass)!''}"></span></span>
                    ${(logon.user.role.roleName)!''}</td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <div class="space-4"></div>
    <div class="row"><span class="col-md-2"><span class="btn-group btn-corner"><a href=""
                                                                                  style="color:#FFF;text-decoration:none;"
                                                                                  class="btn btn-info btn-sm"
                                                                                  title="刷新列表"><span
            class="fa fa-refresh"></span></a></span></span>
                                <span class="col-md-10 smaller-90">
                                <#if page.totalRows gt 0><#import "/common/pager.mod.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
    </div>

</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>
<!--daterangepicker-->
<script src="${context.contextPath}/resources/self/moment.min.js"></script>
<script src="${context.contextPath}/resources/self/daterangepicker.js"></script>

<script src="${context.contextPath}/resources/self/select2/js/select2.min.js"></script>

<script>
    $(function () {
        var fm = function () {
//            try {
            var start = $('#date-range-input-start').data('init');
            var end = $('#date-range-input-end').data('init');
            var left, right;
            if (!start.length || isNaN(start)) {
                left = '';
            } else {
                left = moment(Number(start)).format('YYYY-M-D H时');
            }
            if (!end.length || isNaN(end)) {
                right = '';
            } else {
                right = moment(Number(end)).format('YYYY-M-D H时');
            }
            /*
                        } catch (e) {
                            $('#date-range').val('');
                            return;
                        }
            */
            var content;
            if (left.length && right.length) {
                content = [left, ' 到 ', right].join('');
            } else {
                content = '';
            }
            $('#date-range').val(content);
        };

        {
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
                $('#date-range').val([start.format('YYYY年MM月DD日HH点'), ' 到 ', end.format('YYYY年MM月DD日HH点')].join(''));
                $('#date-range-input-start').val(start.unix() * 1000);
                $('#date-range-input-end').val(end.unix() * 1000);
            });
            $('#date-range').on('cancel.daterangepicker', function (e) {
                //清除内容
                $('#date-range').val('');
                $('#date-range-input').val('');
            });
        }

        $('.btn').tooltip();

        $('#filter-form').submit(function () {
//            alert('i`m clicked!');
            var queryCombo = [encodeURIComponent($('[name=userId]').val()), encodeURIComponent($('[name=start]').val()), encodeURIComponent($('[name=till]').val()), encodeURIComponent($('[name=realName]').val()), encodeURIComponent($('[name=username]').val()), encodeURIComponent($('[name=ip]').val())].join();
            var perfix;
            {
                var loc = location.href.search(/\/[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?\//);
                if (loc < 0) {
                    //处理不带查询的url
                    perfix = location.href.match(/^(.*?[^\/?])(\/?|([?].*))$/)[1]; //url 结尾有或没有"/"
                } else {
                    perfix = location.href.substr(0, location.href.search(/\/[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?,[^,\/]*?\//));
                }
            }
            location = [perfix, '/', queryCombo, '/'].join('');
            return false;
        });
        $('#btn-filter-reset').click(function () {
            //重置两个隐藏input标签
            $('#date-range-input-start').val($('#date-range-input-start').data('init'));
            $('#date-range-input-end').val($('#date-range-input-end').data('init'));
            fm(); //重置日期范文文字显示框
        });
        $('#btn-filter-clear').click(function () {
            $('[name=userId]').val("");
            $('[name=start]').val("");
            $('[name=till]').val("");
            $('[name=realName]').val("");
            $('[name=username]').val("");
            $('[name=ip]').val("");
            return false;
        });

        fm();
    });
</script>
</body>
</html>