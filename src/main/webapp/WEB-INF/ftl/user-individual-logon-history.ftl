<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>用户个人登录历史</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li class="active"><span class="fa fa-child"></span>用户个人登录历史</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="sample-table-1"
                               class="table table-striped table-bordered table-hover table-condensed table-responsive"
                               style="word-wrap: break-word;table-layout:fixed">
                        <#--<colgroup class="row">
                            <col class="col-sm-1">
                            <col class="col-sm-2">
                            <col class="col-sm-2">
                            <col class="col-sm-2">
                            <col class="col-sm-2">
                            <col class="col-sm-1">
                            <col class="col-sm-2">
                        </colgroup>-->
                            <thead>
                            <tr>
                                <th class="text-right">id</th>
                                <th class="text-right">用户名</th>
                                <th class="text-right">真实姓名</th>
                                <th class="text-right">年龄</th>
                                <th class="text-right">地址</th>
                                <th class="text-right">电话</th>
                                <th class="text-right">注册时间</th>
                                <th class="text-right">最后登录时间</th>
                                <th class="text-right">最后登录IP</th>
                                <th class="text-right">部门</th>
                                <th class="text-right">角色</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as user>
                            <tr>
                                <td class="text-right">${user.id }</td>
                                <td class="text-right">${user.username}<#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& loginUser.id==user.id) ||(loginUser.role='DIRECTOR' && user.groupId?? && loginUser.groupId?? && loginUser.groupId==user.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                    <a href="${context.contextPath}/user/profile/${user.id?long?c}" class="list_link"
                                       title="查看资料"><span class="fa fa-eye"></span></a></#if></td>
                                <td class="text-right">${user.realName}</td>
                                <td class="text-right"><#if user.age??>${user.age}<#else><span>没有写</span></#if>
                                </td>

                            <#--<td class="text-right"><#if user.idNumber??>${user.idNumber}<#else>
                                <span class="label">没有写</span></#if>
                            </td>-->
                                <td class="text-right"><#if user.address??>${user.address}<#else>
                                    <span class="label">没有写</span></#if>
                                </td>
                                <td class="text-right"><#if user.phone??>${user.phone}<#else>
                                    <span class="label">没有写</span></#if>
                                </td>
                                <td class="text-right"><#if user.added??>${user.added?string("yyyy-MM-dd,HH:mm:ss")}<#else>
                                    <span class="label">没有写</span></#if></td>

                                <td class="text-right"><#if (user.lastUserLogon.loggedOn)??>${user.lastUserLogon.loggedOn?string("yyyy-MM-dd HH:mm:ss")}<#else>
                                    <span class="label">没有写</span></#if></td>
                                <td class="text-right"><#if (user.lastUserLogon.ip)??>${user.lastUserLogon.ip}<#else>
                                    <span class="label">没有写</span></#if>
                                </td>
                            <#--
                                                            <td class="text-right"><#if (user.userLogon.lastMacAddr)??>${user.userLogon.lastMacAddr}<#else>
                                                                <span class="label">没有写</span></#if></td>
                            -->

                                <td class="text-right"><#if (user.group.name)??>${user.group.name}<#else>
                                    <span class="label">没有写</span></#if>
                                    <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="${context.contextPath}/group/user-update/${user.id?long?c}"
                                           title="变更部门"><span class="fa fa-gear"></span></a>
                                    </#if>
                                </td>
                                <td class="text-right"><#if (user.role.roleName)??>${user.role.roleName}<#else>
                                    <span class="label">没有写</span></#if>
                                    <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')><a
                                            href="${context.contextPath}/role/updaterole/${user.id?long?c}" title="变更角色"><span
                                            class="fa fa-gear"></span></a></#if>
                                </td>
                                <td class="center">
                                    <span class="btn-group">
                                        <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& loginUser.id==user.id) ||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                            <a class="btn btn-minier" href="/user/update/${user.id?long?c}" title="更新资料"><span
                                                    class="fa fa-edit"></span></a>
                                        </#if>
                                        <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <#--<a class="remove-control btn btn-minier"
                                           href="${context.contextPath}/user/remove/${user.id}" title="删除"><span
                                                class="fa fa-trash"></span></a>-->
                                            <button form="form-remove-user-${user_index}"
                                                    class="remove-control btn btn-minier" title="删除"><span
                                                    class="fa fa-trash"></span></button>
                                        </#if></span>

                                    <form id="form-remove-user-${user_index}"
                                          action="${context.contextPath}/user/remove" method="post"><input type="hidden"
                                                                                                           name="id"
                                                                                                           value="${user.id?long?c}">
                                    </form>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2 btn-group btn-corner">
                                <#if loginUser.role="ADMIN">
                                    <a href="${context.contextPath}/user/add" target="_self" title="添加员工"
                                       class="btn btn-info fa fa-user-plus"></a>
                                </#if>
                                    <a href="" style="color:#FFF;text-decoration:none;"
                                       class="btn btn-info fa fa-refresh" title="刷新列表"></a>
                            </span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- /.span -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">

<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${context.contextPath}/resources/ace/assets/js/bootbox.js"></script>

<script>
    $(function () {
        $('.btn').tooltip();

        $(".remove-control").click(function (e) {
            e.preventDefault();
            var button = this;
            bootbox.confirm({
                        message: "将要删除！",
                        buttons: {
                            confirm: {
                                label: "好的",
                                className: "btn-danger btn-sm"
                            },
                            cancel: {
                                label: "不好",
                                className: "btn-primary btn-sm"
                            }
                        },
                        callback: function (result) {
                            if (result) {
                                $(button).prop('form').submit();
                            }
                        }
                    }
            );
        });
    });
</script>
</body>
</html>