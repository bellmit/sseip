<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>顾客资料统计</title>
</head>
<body>
<div class="container-fluid">
    <div class="page-content">
        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <span class="ace-icon fa fa-home home-icon"></span>
                    <a href="${context.contextPath}/" target="_top">Home</a>
                </li>
                <li class="active"><span class="menu-icon fa fa-line-chart light-red"></span>顾客资料统计 <a href=""
                                                                                                       title="刷新"><span
                        class="fa fa-refresh"></span></a></li>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="space-4"></div>
        <div class="row">
            <div class="col-md-12">
                <div class="well">
                    <h3 class="center">患者资料统计</h3>
                    <dl class="dl-horizontal">
                        <dt>入院人数：</dt>
                        <dd>${(stats.inHospitalCount)!''}</dd>
                        <dt>报备人数：</dt>
                        <dd>${(stats.reportedCount)!''}</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>