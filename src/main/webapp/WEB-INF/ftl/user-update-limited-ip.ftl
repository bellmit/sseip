<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>用户登录记录一览</title>
</head>
<body>
<div class="container-fluid">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><#--<span class="fa fa-clock-o"></span>-->修改限定IP</li>
        </ul>
    </div>
    <form id="ip-edit-form" action="javascript:;" role="search" style="display: none;"></form>
    <div class="space-4"></div>
    <div class="row">
        <div class="col-sm-12">
            <div class="col-md-2"><input class="" name="limitedIp" type="text"
                                         form="ip-edit-form" style="width:100%;" title="IP" placeholder="IP"
                                         value="${(user.limitedIp)!''}"/></div>
        </div>
    </div>
    <div class="space-4"></div>
    <div class="row">
        <div class="col-sm-12">
<span class="btn-group btn-corner">
<button type="reset" form="ip-edit-form" class="btn btn-sm"><span class="fa fa-reply-all"></span>重置</button>
    <button type="submit" form="ip-edit-form" class="btn btn-primary btn-sm"><span class="fa fa-search"></span>查询
    </button>
</span>
        </div>
    </div>

</div>
<#include "/common/common_js.ftl">
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>
<script>
    $(function () {

    });
</script>
</body>
</html>