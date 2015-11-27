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
            /*try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }*/
        </script>

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><a href="${context.contextPath}/website/list/1">网站群组一览</a></li>
            <li class="active">网站群组添加完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-success">网站群组添加完成。</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>ID</dt>
                            <dd><#if (website.id?long?c)??>${website.id?long?c}<#else><label
                                    class="label label-inverse">不详</label></#if></dd>
                            <dt>名称</dt>
                            <dd><#if (website.name)??>${website.name}<#else><label
                                    class="label label-inverse">不详</label></#if></dd>
                        <#--<dt>域名</dt>
                        <dd><#if (website.url)??>${website.url}<#else><label
                                class="label label-inverse">不详</label></#if></dd>-->
                        </dl>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                            <span class="ace-icon fa fa-home bigger-110"></span>回首页
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/website/list/1">
                            <span class="ace-icon fa fa-list bigger-110"></span>网站群组一览
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/website/add">
                            <span class="ace-icon fa fa-edit bigger-110"></span>继续添加
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