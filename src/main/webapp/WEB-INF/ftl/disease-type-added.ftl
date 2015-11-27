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
            <li><a href="${context.contextPath}/disease-type/list/1">疾病类型一览</a></li>
            <li class="active">疾病类型添加完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-success">疾病类型添加完成。</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>ID</dt>
                            <dd>${diseaseType.id?long?c}</dd>
                            <dt>名称</dt>
                            <dd>${diseaseType.name}</dd>
                        </dl>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                            <span class="ace-icon fa fa-home bigger-110"></span>回首页
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/disease-type/list/1">
                            <span class="ace-icon fa fa-list bigger-110"></span>疾病类型一览
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/disease-type/add">
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