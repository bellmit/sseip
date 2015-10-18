<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
    <ul class="nav nav-list">
        <li class="active">
            <a href="${context.contextPath}/">
                <span class="menu-icon fa fa-desktop"></span>
                <span class="menu-text">查看首页</span>
            </a>

            <span class="arrow"></span>
        </li>

        <li class="">
            <a href="javascript:;" class="dropdown-toggle">
                <span class="menu-icon fa glyphicon-user fa-users"></span>
                <span class="menu-text">用户管理</span>
                <span class="arrow fa fa-angle-down"></span>
            </a>
            <span class="arrow"></span>
        <#if (loginUser.role)?? && loginUser.role!='EMPTY'>
            <ul class="submenu">
                <li class=""><a href="${context.contextPath}/user/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-caret-right"></span>用户列表<span
                        class="arrow fa fa-angle-down"></span></a></li>
                <li class="">
                    <a href="${context.contextPath}/role/list" target="mainFrame">
                        <span class="menu-icon fa fa-caret-right"></span>角色列表</a>
                    <span class="arrow"></span>
                </li>
            </ul>
        </#if>
        </li>
        <li>
            <a href="javascript:;" class="dropdown-toggle"><span class="menu-icon fa fa-gears"></span>
                <span class="menu-text">平台管理</span>
                <span class="arrow fa fa-angle-down"></span></a>
            <span class="arrow"></span>
            <ul class="submenu">
                <li class=""><a href="${context.contextPath}/group/list/1" target="mainFrame"><span
                        class="menu-icon fa fa-caret-right"></span>部门管理</a><span class="arrow"></span></li>
                <li><a href="${context.contextPath}/country/list/1" target="mainFrame">国家管理</a></li>
            <#--<li><a href="${context.contextPath}/access-point-type/list/1" target="mainFrame">推广类型一览</a></li>-->
                <li><a href="${context.contextPath}/website/list/1" target="mainFrame">网站管理</a></li>
                <li><a href="${context.contextPath}/disease-type/list/1" target="mainFrame">病种管理</a></li>
            </ul>
        </li>

        <li class="">
            <a href="javascript:;" class="dropdown-toggle">
                <span class="menu-icon fa fa-pencil-square-o"></span>
                <span class="menu-text">资源管理</span>
                <span class="arrow fa fa-angle-down"></span>
            </a>
            <span class="arrow"></span>
        <#if (loginUser.role)?? && loginUser.role!='EMPTY'>
            <ul class="submenu">
            <#--
                            <li>
                                <a href="${context.contextPath}/customer/list/1" target="mainFrame">
                                    <span class="menu-icon fa fa-list"></span><span
                                        class="menu-text">资源列表</span>
                                </a>
                            </li>
            -->
                <li>
                    <a href="${context.contextPath}/customer/filter-own/1" target="mainFrame"><span
                            class="menu-icon fa fa-search"></span><span class="menu-text">复合查询</span></a>
                </li>
                <li>
                    <a href="${context.contextPath}/customer/add" target="mainFrame">
                        <span class="menu-icon fa fa-edit"></span><span
                            class="menu-text">添加资源</span>
                    </a>
                </li>
            </ul>
        </#if>
        </li>
        <li class="">
            <a href="#" class="dropdown-toggle">
                <span class="menu-icon fa fa-cogs"></span>
                <span class="menu-text">系统设置 </span>

                <span class="arrow fa fa-angle-down"></span>
            </a>
            <span class="arrow"></span>
        <#if (loginUser.role)?? && loginUser.role=='ADMIN'>
            <ul class="submenu">
                <li class="">
                    <a href="${context.contextPath}/druid" target="mainFrame">
                        <span class="menu-icon fa fa-caret-right"></span>
                        Druid Monitor(监听)
                    </a>
                    <span class="arrow"></span>
                </li>
            </ul>
        </#if>
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