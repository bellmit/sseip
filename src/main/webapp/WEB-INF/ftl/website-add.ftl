<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>添加网站群组</title>
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
            <li><span class="ace-icon fa fa-list"></span><a href="${context.contextPath}/website-type/list/1">网站群组一览</a>
            </li>
            <li class="active">添加网站群组</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form method="post" class="form-horizontal">
                    <!-- #section:elements.form -->
                <#if success??>
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-4 alert alert-success">${success}</div>
                    </div>
                </#if>
                <#if error??>
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                    </div>
                </#if>
                <#if errors??>
                    <#list errors as error>
                        <div class="row">
                            <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                        </div>
                    </#list>
                </#if>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">名称</label>

                        <div class="col-sm-9">
                            <input name="name" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="名称" title="名称" value="${(form.name)!''}"/>
                        </div>
                    </div>

                <#--<div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">域名</label>

                    <div class="col-sm-9">
                        <input name="url" type="text" size="30" class="col-xs-10 col-sm-5"
                               placeholder="域名" title="域名" value="${(form.url)!''}"/>
                    </div>
                </div>-->
                    
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit"><span
                                    class="ace-icon fa fa-plus bigger-110"></span>添加网站群组
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>表单重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>
<script type="text/javascript">
    $(function () {
//        $("#addForm").cmsvalidate();
    });
</script>
</body>
</html>