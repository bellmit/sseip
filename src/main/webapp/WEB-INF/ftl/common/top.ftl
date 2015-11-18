<input type="hidden" id="contextPath" value="${context.contextPath}"/>
<div id="navbar" class="navbar navbar-default">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <small>
                <a href="${context.contextPath}/" class="navbar-brand">
                    <span class="fa fa-globe"></span>北京 双友之春</a>
            </small>
            <!-- /section:basics/navbar.layout.brand -->
            <!-- #section:basics/navbar.toggle -->
            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue">
                    <a href="${context.contextPath}/profile" data-toggle="dropdown" href="#" class="dropdown-toggle">
                    <#--<img class="nav-user-photo" src="${context.contextPath}/resources/ace/assets/avatars/user.jpg"
                         alt="Jason's Photo"/>-->
                    <#if ((Session.loginUser.role)!'')='ADMIN'>
                        <span class="fa fa-user-secret bigger-250 dark" style="margin-top: 5px"></span>
                    <#else>
                        <#if ((Session.loginUser.role)!'')='TELADMIN'>
                            <span class="fa fa-phone-square bigger-250 dark" style="margin-top: 5px"></span>
                        <#else>
                            <span class="fa fa-user-md bigger-250" style="margin-top: 5px"></span>
                        </#if>
                    </#if>
                        <span class="user-info"><small>
                            欢迎, <#--${(loginUser.role.roleName)!''}--></small> ${(Session.loginUser.realName)!''}</span>
                        <span class="ace-icon fa fa-caret-down"></span>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                    <#--<li>
                        <a href="javascript:;" target="mainFrame">
                            <i class="ace-icon fa fa-cog"></i>
                            系统设置
                        </a>
                    </li>-->

                        <li>
                            <a href="${context.contextPath}/user/profile" target="mainFrame">
                                <span class="ace-icon fa fa-newspaper-o"></span>个人资料</a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="javascript:exitSystem()">
                                <span class="ace-icon fa fa-power-off"></span>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>

        <!-- /section:basics/navbar.dropdown -->
    </div>
    <!-- /.navbar-container -->
</div>
<script type="text/javascript">
    function exitSystem() {
        window.parent.location.href = $("#contextPath").val() + "/login/logout";
    }
</script>
<!-- /section:basics/navbar.layout -->