<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
    <ul class="nav nav-list">
    <#--<li class="active">
        <a href="${context.contextPath}/">
            <span class="menu-icon fa fa-desktop"></span>
            <span class="menu-text">首页</span>
        </a>

        <span class="arrow"></span>
    </li>-->

        <li class="">
            <a href="javascript:;" class="dropdown-toggle">
                <span class="menu-icon fa fa-ambulance"></span>
                <span class="menu-text">资源管理</span>
                <span class="arrow fa fa-angle-down"></span>
            </a>
            <span class="arrow"></span>
        <#if (loginUser.role)?? && loginUser.role!='EMPTY'>
            <ul class="submenu">
            <#--<li>
                <a href="${context.contextPath}/customer/list/1" target="mainFrame">
                    <span class="menu-icon fa fa-list"></span><span
                        class="menu-text">资源列表</span>
                </a>
            </li>-->
            <#--<#if (loginUser.role)?? && ['ADMIN','MANAGER','DIRECTOR'].seq_contains(loginUser.role)>-->
            <#--</#if>-->

                <#if ['ADMIN','TELADMIN','EMPLOYEE']?seq_contains(loginUser.role)>
                    <li>
                    <#--<a
                        <#if ['ADMIN','TELADMIN']?seq_contains(loginUser.role)>href="${context.contextPath}/default"
                        <#else>href="${context.contextPath}/customer/filter-own"</#if> target="mainFrame"><span
                            class="menu-icon fa fa-table light-red"></span><span class="menu-text">资源查询</span></a>-->
                        <a href="${context.contextPath}/default" target="mainFrame"><span
                                class="menu-icon fa fa-table light-red"></span><span class="menu-text">资源查询</span></a>
                    </li>
                </#if>

                <#if ['ADMIN']?seq_contains(loginUser.role)>
                    <li><a href="/customer/stats" target="mainFrame"><span
                            class="menu-icon fa fa-line-chart light-red"></span><span class="menu-text">资源统计</span></a>
                    </li>
                </#if>
            <#--
                            <#if ['ADMIN','MANAGER','DIRECTOR']?seq_contains(loginUser.role)>
                                <li><a href="${context.contextPath}/customer/filter/1" target="mainFrame"><span
                                        class="menu-icon fa fa-table light-red"></span><span class="menu-text">全部复合查询</span></a>
                                </li><#else>
                                <li><a href="${context.contextPath}/customer/filter-own/1" target="mainFrame"><span
                                        class="menu-icon fa fa-table light-red"></span><span class="menu-text">个人复合查询</span></a>
                                </li></#if>
            -->
                <#if ['EMPLOYEE']?seq_contains(loginUser.role)>
                    <li><a href="${context.contextPath}/customer/add" target="mainFrame"><span
                            class="menu-icon fa fa-file-o light-grey"></span><span class="menu-text">添加资源</span></a>
                    </li>
                    <li><a href="${context.contextPath}/customer/revisit/today" target="mainFrame"><span
                            class="menu-icon fa fa-envelope-o"></span><span class="menu-text">今日回访</span></a></li>
                    <li><a href="${context.contextPath}/customer/revisit/week" target="mainFrame"><span
                            class="menu-icon fa fa-envelope-o"></span><span class="menu-text">本周回访</span></a></li>
                    <li><a href="${context.contextPath}/customer/revisit/month" target="mainFrame"><span
                            class="menu-icon fa fa-envelope-o"></span><span class="menu-text">本月回访</span></a></li>
                </#if>
            </ul>
        </#if>
        </li>

    <#if (loginUser.role)?? && loginUser.role='ADMIN'>
        <li class="">
            <a href="javascript:;" class="dropdown-toggle">
                <span class="menu-icon fa glyphicon-user fa-user-md"></span>
                <span class="menu-text">用户管理</span>
                <span class="arrow fa fa-angle-down"></span>
            </a>
            <span class="arrow"></span>
            <#if (loginUser.role)?? && loginUser.role!='EMPTY'>
                <ul class="submenu">
                    <li class=""><a href="${context.contextPath}/user/list/1" target="mainFrame"><span
                            class="menu-icon fa fa-user-md bigger-120"></span>用户列表<#--<span class="arrow fa fa-angle-down"></span>-->
                    </a></li>
                    <li class="">
                        <a href="${context.contextPath}/role/list" target="mainFrame">
                            <span class="menu-icon fa fa-users"></span>角色列表</a>
                        <span class="arrow"></span>
                    </li>
                    <li class="">
                        <a href="${context.contextPath}/user/logon-filter" target="mainFrame">
                            <span class="menu-icon fa fa-clock-o"></span>登录记录</a>
                        <span class="arrow"></span>
                    </li>
                </ul>
            </#if>
        </li>
    </#if>

    <#if loginUser?? && loginUser.role=='ADMIN'>
        <li>
            <a href="javascript:;" class="dropdown-toggle"><span class="menu-icon fa fa-hospital-o"></span>
                <span class="menu-text">平台管理</span>
                <span class="arrow fa fa-angle-down"></span></a>
            <span class="arrow"></span>
            <ul class="submenu">
                <li class=""><a href="${context.contextPath}/group/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-building-o brown"></span></span>部门管理</a><span class="arrow"></span></li>
                <li><a href="${context.contextPath}/country/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-globe light-blue"></span>国家管理</a></li>
            <#--<li><a href="${context.contextPath}/access-point-type/list/1" target="mainFrame">推广类型一览</a></li>-->
                <li><a href="${context.contextPath}/website/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-map-signs orange2"></span>网站群组</a></li>
                <li><a href="${context.contextPath}/disease-type/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-heartbeat orange"></span>病种管理</a></li>
            </ul>
        </li>
    </#if>

    <#--
        <#if (loginUser.role)?? && loginUser.role=='ADMIN'>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <span class="menu-icon fa fa-gear"></span>
                    <span class="menu-text">系统设置 </span>

                    <span class="arrow fa fa-angle-down"></span>
                </a>
                <span class="arrow"></span>
                <ul class="submenu">
                    <li class="">
                        <a href="${context.contextPath}/druid" target="mainFrame">
                            <span class="menu-icon fa fa-caret-right"></span>
                            Druid Monitor(监听)
                        </a>
                        <span class="arrow"></span>
                    </li>
                </ul>
            </li>
        </#if>
    -->

        <li>
            <a href="${context.contextPath}/user/update-password" target="mainFrame"><span
                    class="menu-icon fa fa-lock"></span><span class="menu-text">修改密码</span>
            </a>
        </li>
        <li>
            <a href="${context.contextPath}/login/logout" target="_top"><span class="menu-icon fa fa-power-off"></span>
                <span class="menu-text">退出</span>
            </a>
        </li>
    </ul>
    <!-- /.nav-list -->

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <span class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
              data-icon2="ace-icon fa fa-angle-double-right"></span>
    </div>

    <!-- /section:basics/sidebar.layout.minimize -->
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>