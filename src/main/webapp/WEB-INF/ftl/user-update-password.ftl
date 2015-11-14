<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>更改密码</title>
</head>
<body style="background-color: white">
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><span class="fa light-dark fa-lock"></span>密码修改</li>
        </ul>
    </div>
<#--正文开始-->
    <div class="space-4"></div>
    <form id="update-password-form" method="post" style="display: none;" target="_top"></form>
    <div class="row">
        <div class="col-sm-4 col-sm-offset-4">
            <div class="well">
                <h3 class="text-success">修改密码</h3>
            </div>
            <div class="well">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-control">
                            <p class="form-control-static">
                                用户登录名: <span class="text-primary">${user.username}</span>
                                姓名: <span class="text-primary">${user.realName}</span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="space-4"></div>
                <div class="row">
                    <div class="col-sm-12">
                        <input type="password" class="add-tooltip form-control" name="oldPassword"
                               form="update-password-form"
                               placeholder="旧密码" title="旧密码">
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="row">
                    <div class="col-sm-12">
                        <input type="password" class="add-tooltip form-control" name="newPassword"
                               form="update-password-form"
                               placeholder="新密码" title="新密码">
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="row">
                    <div class="col-sm-12">
                        <input type="password" class="add-tooltip form-control" name="confirmPassword"
                               form="update-password-form"
                               placeholder="确认新密码" title="确认新密码">
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="row">
                    <div class="col-sm-12">
                    <span class="btn-group btn-corner pull-right">
                        <button type="submit" form="update-password-form" class="btn btn-success"
                                formtarget="_top"><span
                                class="fa fa-check-circle-o"></span> 更改
                        </button>
                        <button type="reset" form="update-password-form" class="btn btn-warning"><span
                                class="fa fa-eraser"></span> 重填
                        </button>
                    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
<script>
    $(function () {
        $('.add-tooltip').tooltip();
    });
</script>
</body>
</html>