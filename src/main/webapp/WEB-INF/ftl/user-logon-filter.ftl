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
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><span class="badge label-important"><span class="fa fa-list"></span></span>用户登录记录一览</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <table id="sample-table-1"
                   class="table table-striped table-bordered table-hover table-condensed table-responsive smaller-90"
                   style="word-wrap: break-word;table-layout:fixed;margin-bottom:4px;">
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
                    <th>IP地址</th>
                    <th>登录时间</th>
                    <th>用户ID</th>
                    <th>登录名</th>
                    <th>用户姓名</th>
                    <th>角色</th>
                </tr>
                </thead>
                <tbody>
                <#list page.list as logon>
                <tr>
                    <td>${logon.ip}</td>
                    <td>${logon.loggedOn?string('yyyy-MM-dd HH:mm:ss')}</td>
                    <td>${(logon.user.id)!''}</td>
                    <td>${(logon.user.username)!''}</td>
                    <td>${(logon.user.realName)!''}</td>
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
    });
</script>
</body>
</html>