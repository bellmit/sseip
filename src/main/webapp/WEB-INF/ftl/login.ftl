<!doctype html>
<html>
<head>
<#include "/common/common_login.ftl">
    <link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/admin/login.css"/>
    <title>gz的用户登录</title>
</head>

<body class="login-layout light-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <span class="ace-icon fa fa-leaf green"></span>
                            <span class="red">双友之春</span>
                            <span class="white" id="id-text2">CRM</span>
                        </h1>
                        <h4 class="blue" id="id-company-text">&copy; 登录</h4>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <form method="post" id="myForm" action="" target="_top"><#if refer??><input type="hidden"
                                                                                                    name="refer"
                                                                                                    value="${refer}"/></#if>

                            <div id="login-box" class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i>
                                            请输入您的账号信息
                                        </h4>

                                        <div class="space-6"></div>

                                    <#--<form>-->
                                        <fieldset>
                                        <#if error??>
                                            <div class="alert alert-danger">
                                                <button type="button" class="close" data-dismiss="alert">
                                                    <span class="ace-icon fa fa-times"></span>
                                                </button>
                                                <strong><span class="ace-icon fa fa-times"></span>${error}</strong>
                                            </div>
                                        </#if>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名"
                                                                   name="username" value=""/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码"
                                                                   name="password" value=""/>
															<span class="ace-icon fa fa-lock"></span>
														</span>
                                            </label>
                                            <label class="block clearfix"><span class="block"><a id="refresh"
                                                                                                 href="javascript:;"
                                                                                                 tabindex="-1"><img
                                                    id="captcha" src="${context.contextPath}/login/captcha" alt="等待加载"/></a></span><span
                                                    class="block input-icon input-icon-right"><input type="text"
                                                                                                     class="form-control"
                                                                                                     placeholder="验证码"
                                                                                                     name="captcha"
                                                                                                     value=""/><span
                                                    class="ace-icon fa fa-lock"></span></span></label>

                                        <#--<label class="block clearfix">
                                            <span class="block input-icon input-icon-right">
                                                <input type="password" class="form-control" placeholder="验证码" name="checkcode"/>
                                                <span style="cursor:pointer"> <img src="drawCheckCode" onclick="reCheckcode(this)" /></span>
                                            </span>
                                        </label>-->

                                            <div class="space"></div>

                                            <div class="clearfix">
                                            <#--<label class="inline">
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"> 记住我</span>
                                            </label>-->

                                                <button type="submit"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    <#--</form>-->

                                    <#--<div class="social-or-login center">
                                        <span class="bigger-110">或者用以下方式登录</span>
                                    </div>

                                    <div class="space-6"></div>

                                    <div class="social-login center">
                                        <a class="btn btn-primary">
                                            <i class="ace-icon fa fa-facebook"></i>
                                        </a>

                                        <a class="btn btn-info">
                                            <i class="ace-icon fa fa-twitter"></i>
                                        </a>

                                        <a class="btn btn-danger">
                                            <i class="ace-icon fa fa-google-plus"></i>
                                        </a>
                                    </div>-->
                                    </div>
                                    <!-- /.widget-main -->

                                    <div class="toolbar clearfix">
                                        <div>
                                            <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                <i class="ace-icon fa fa-arrow-left"></i>
                                                我忘记密码
                                            </a>
                                        </div>

                                        <div>
                                        <#--data-target="#signup-box"-->
                                            <a href="${context.contextPath}/login/register"
                                               class="user-signup-link">我要去注册<span
                                                    class="ace-icon fa fa-arrow-right"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.login-box -->
                            </from>

                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header red lighter bigger">
                                            <i class="ace-icon fa fa-key"></i>
                                            Retrieve Password
                                        </h4>

                                        <div class="space-6"></div>
                                        <p>
                                            Enter your email and to receive instructions
                                        </p>

                                        <form>
                                            <fieldset>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control"
                                                                   placeholder="Email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                                </label>

                                                <div class="clearfix">
                                                    <button type="button"
                                                            class="width-35 pull-right btn btn-sm btn-danger">
                                                        <i class="ace-icon fa fa-lightbulb-o"></i>
                                                        <span class="bigger-110">Send Me!</span>
                                                    </button>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <!-- /.widget-main -->

                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">
                                            Back to login
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.forgot-box -->

                            <div id="signup-box" class="signup-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header green lighter bigger">
                                            <i class="ace-icon fa fa-users blue"></i>
                                            New User Registration
                                        </h4>

                                        <div class="space-6"></div>
                                        <p> Enter your details to begin: </p>

                                        <form action="/users/add" method="post">
                                            <fieldset>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   placeholder="username"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   placeholder="password"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"
                                                                   placeholder="Repeat password" name="confirmPwd"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
                                                </label>

                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   placeholder="真实姓名" name="realName"/>
                                                        <#--<i class="ace-icon fa fa-envelope"></i>-->
														</span>
                                                </label>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="number" class="form-control"
                                                                   placeholder="年龄" name="age"/>
                                                        <#--<i class="ace-icon fa fa-envelope"></i>-->
														</span>
                                                </label>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   placeholder="身份证号" name="idNumber"/>
                                                        <#--<i class="ace-icon fa fa-envelope"></i>-->
														</span>
                                                </label>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"
                                                                   placeholder="地址" name="address"/>
                                                        <#--<i class="ace-icon fa fa-envelope"></i>-->
														</span>
                                                </label>
                                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="tel" class="form-control"
                                                                   placeholder="电话" name="phone"/>
                                                        <#--<i class="ace-icon fa fa-envelope"></i>-->
														</span>
                                                </label>

                                                <label class="block">
                                                    <input type="checkbox" class="ace"/>
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
                                                </label>

                                                <div class="space-24"></div>

                                                <div class="clearfix">
                                                    <button type="reset" class="width-30 pull-left btn btn-sm">
                                                        <i class="ace-icon fa fa-refresh"></i>
                                                        <span class="bigger-110">Reset</span>
                                                    </button>

                                                    <button type="submit"
                                                            class="width-65 pull-right btn btn-sm btn-success">
                                                        <span class="bigger-110">Register</span>

                                                        <span class="ace-icon fa fa-arrow-right icon-on-right"></span>
                                                    </button>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>

                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            Back to login
                                        </a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.signup-box -->
                    </div>
                    <!-- /.position-relative -->

                    <div class="navbar-fixed-top align-right">
                        <br/>
                        &nbsp;
                        <a id="btn-login-dark" href="#">Dark</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-blur" href="#">Blur</a>
                        &nbsp;
                        <span class="blue">/</span>
                        &nbsp;
                        <a id="btn-login-light" href="#">Light</a>
                        &nbsp; &nbsp; &nbsp;
                    </div>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${context.contextPath}/resources/ace/assets/js/jquery.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    $(function () {
        $("#refresh").click(function () {
            $('#captcha').attr('src', '${context.contextPath}/login/captcha?' + Date.now());
        });
    });
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${context.contextPath}/resources/ace/assets/js/jquery1x.js'>" + "<" + "/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${context.contextPath}/resources/assets/js/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });


    //you don't need this, just used for changing background
    jQuery(function ($) {
        $('#btn-login-dark').on('click', function (e) {
            $('body').attr('class', 'login-layout');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-light').on('click', function (e) {
            $('body').attr('class', 'login-layout light-login');
            $('#id-text2').attr('class', 'grey');
            $('#id-company-text').attr('class', 'blue');

            e.preventDefault();
        });
        $('#btn-login-blur').on('click', function (e) {
            $('body').attr('class', 'login-layout blur-login');
            $('#id-text2').attr('class', 'white');
            $('#id-company-text').attr('class', 'light-blue');

            e.preventDefault();
        });

    });
</script>

<#--<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>-->
<#--<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>-->
</body>
</html>