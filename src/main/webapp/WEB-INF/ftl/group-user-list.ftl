<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
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
            <li><a href="${context.contextPath}/group/list/1">部门列表</a></li>
            <li class="active">${group.name}的用户列表</li>
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
                            <colgroup class="row">
                            <#--<col class="col-md-1">-->
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-right">id</th>
                                <th class="text-right">用户名</th>
                                <th class="text-right">真实姓名</th>
                                <th class="text-right">年龄</th>
                                <th class="text-right">地址</th>
                                <th class="text-right">电话</th>
                                <th class="text-right">注册时间</th>
                                <th class="text-right">部门</th>
                                <th class="text-right">角色</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as user>
                            <tr>
                                <td class="text-right">${user.id?long?c}</td>
                                <td class="text-right">${user.username}
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& loginUser.id==user.id) ||(loginUser.role='DIRECTOR' && user.groupId?? && loginUser.groupId?? && loginUser.groupId==user.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="${context.contextPath}/user/profile/${user.id?long?c}" class=""
                                           title="查看"><span class="fa fa-eye"></span></a>
                                    </#if>
                                </td>
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
                                <td class="text-right"><#if (user.group.name)??>${user.group.name}<#else>
                                    <span class="label">没有写</span></#if>
                                    <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="${context.contextPath}/group/user-update/${user.id?long?c}" title="转部门"><span
                                                class="fa fa-gear"></span></a>
                                    </#if>
                                </td>
                                <td class="text-right"><#if (user.role.roleName)??>${user.role.roleName}<#else>
                                    <span class="label">没有写</span></#if></td>
                                <td class="center">客户资源
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>

                        <div class="page-header position-relative">
                            <div class="row">
                            <#--管理员、经理列出所有用户；主任列出无部门用户-->
                                <span class="col-md-2"><a href="javascript:;" target="_self"
                                                          style="color:#FFF;text-decoration:none;" title="从列表添加用户"
                                                          class="btn btn-info fa fa-plus"></a> <a href=""
                                                                                                  style="color:#FFF;text-decoration:none;"
                                                                                                  class="btn btn-info fa fa-refresh"
                                                                                                  title="刷新列表"></a></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0>
                                    <#import
                                "/common/pager.ftl" as pager>
                                    <@pager.pager page context.contextPath+path></@pager.pager>
                                </#if>
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

</body>
</html>