<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>提交资料完成</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><span class="ace-icon fa fa-home home-icon"></span><a href="${context.contextPath}/country/list/1">贸易国家一览</a>
            </li>
            <li class="active">提交完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="alert alert-success">
                        贸易国家条目添加完成。
                    </div>
                </div>
                <div class="row">
                    <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                        <span class="ace-icon fa fa-home bigger-110"></span>回首页
                    </a>
                    <a class="btn btn-info" href="${context.contextPath}/country/list/1">
                        <span class="ace-icon fa fa-list bigger-110"></span>贸易国家一览
                    </a>
                    <a class="btn btn-info" href="${context.contextPath}/customer/add">
                        <span class="ace-icon fa fa-edit bigger-110"></span>继续添加
                    </a>
                    <a class="btn btn-info" href="javascript:;">
                        <span class="ace-icon fa fa-eye bigger-110"></span>看一眼
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
</body>
</html>