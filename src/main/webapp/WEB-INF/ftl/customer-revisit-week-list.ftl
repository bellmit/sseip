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
            <li class="active">本周-待回访顾客列表</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div><span class="col-md-2"><span class="btn-group btn-corner"><a href=""
                                                                          style="color:#FFF;text-decoration:none;"
                                                                          class="btn btn-info btn-sm" title="刷新列表"><span
                class="fa fa-refresh"></span></a></span></span> <span class="col-md-10">
        <#if page.totalRows gt 0><#import "/common/pager.mod.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
        </span>
        </div>

        <div id="msg-container">

        </div>
    <#include "customer-revisit-table-fragment.ftl">

        <div class="row">
<span class="col-md-1">
<span class="btn-group btn-corner"><a href="" class="btn btn-info btn-sm" title="刷新列表"><span
        class="fa fa-refresh"></span></a></span></span>

<span class="col-md-7 col-sm-offset-4">
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

    <#--<#if dateRange?? && dateRange?size gt 0 >-->
    <#--$('#date-range').val(['${dateRange[0]?string("yyyy年MM月dd日HH时")}', ' 到 ', '${dateRange[1]?string("yyyy年MM月dd日HH时")}'].join(''));-->
    <#--$('#date-range-input').val([${dateRange[0]?long?c}, ${dateRange[1]?long?c}].join());-->
    <#--</#if>-->
    });
</script>
</body>
</html>