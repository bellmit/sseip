<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>资源转交完成</title>
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
            <li><a href="${context.contextPath}/default">资源一览</a></li>
            <li class="active">转交完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-success">资源转交完成，转交给 ${(user.realName)!'佚名'} ，共 ${passedCount} 个。</div>
                    </div>
                </div>
            <#--
                            <div class="row">
                                <div class="col-xs-12">
                                    <div>

                                    </div>
                                </div>
                            </div>
            -->
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                            <span class="ace-icon fa fa-home bigger-110"></span>回首页
                        </a>
                        <a class="btn btn-info" href="${context.contextPath}/country/list/1">
                            <span class="ace-icon fa fa-list bigger-110"></span>资源一览
                        </a>
                        <a class="btn btn-info" href="${referer}">
                            <span class="ace-icon fa fa-edit bigger-110"></span>返回刚才页面
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