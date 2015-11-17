<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>出错了！</title>
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
            <li class="active">出错了！</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <header class="alert-fail">出错了！</header>
                    <#if error??>
                        <#list errors as error>
                            <div class="alert alert-fail">${error}</div>
                        </#list>
                    </#if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                            <span class="ace-icon fa fa-home bigger-110"></span>回首页
                        </a>
                    <#if referer??>
                        <a class="btn btn-info" href="${referer}">
                            <span class="ace-icon fa fa-edit bigger-110"></span>返回刚才页面
                        </a>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
</body>
</html>