<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>国家添加完成</title>
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
            <li><a href="${context.contextPath}/country/list/1"><span class="fa fa-globe"></span>国家一览</a></li>
            <li class="active">添加完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-success">国家条目添加完成。</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>ID</dt>
                            <dd>${country.id?long?c}</dd>
                            <dt>名称</dt>
                            <dd>${country.name}</dd>
                            <dt>名称（英文）</dt>
                            <dd>${country.nameEn}</dd>
                            <dt>ISO 3166-1, Alpha-2 code</dt>
                            <dd>${country.a2Code}</dd>
                        </dl>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                            <span class="ace-icon fa fa-home bigger-110"></span>回首页
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/country/list/1">
                            <span class="ace-icon fa fa-list bigger-110"></span>国家一览
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/country/add">
                            <span class="ace-icon fa fa-edit bigger-110"></span>继续添加
                        </a>
                        <a class="btn btn-info" href="javascript:;">
                            <span class="ace-icon fa fa-eye bigger-110"></span>查看
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
</body>
</html>