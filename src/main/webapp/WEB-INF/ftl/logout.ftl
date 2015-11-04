<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>你已经退出!</title>
</head>
<body class="login-layout light-login">
<#--<section class="col-md-offset-3 col-md-6">-->
<#--<div class="page-content">-->
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <section class="col-md-offset-3 col-md-6">
                <h1 class="blue" data-id="intro"><span class="ace-icon fa fa-info-circle"></span>你已经退出!</h1>

                <div><a class="btn btn-app btn-white radius-4 pull-right" href="${context.contextPath}/login"><span
                        class="ace-icon fa fa-medkit"></span>返回登录</a></div>
            </section>
        </div>
    </div>
</div>
<#--</section>-->
<#include "/common/common_js.ftl">
</body>
</html>