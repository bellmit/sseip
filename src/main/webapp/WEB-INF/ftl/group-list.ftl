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
            <li class="active"><span class="fa fa-building-o red2"></span>部门管理</li>
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
                                <col class="col-md-2">
                                <col class="col-md-7">
                                <col class="col-md-2">
                            </colgroup>
                            <thead>
                            <tr>
                                <#--<th class="text-right">id</th>-->
                                <th class="text-right">名称</th>
                                <th class="text-right">描述</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as group>
                            <tr>
                                <#--<td class="text-right">${group.id}</td>-->
                                <td class="text-right">${group.name}</td>
                                <td class="text-right"><#if group.description??>${group.description}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="center">
                                    <span class="btn-group">
                                    <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a class="btn btn-minier" href="${context.contextPath}/group/edit/${group.id?long?c}"
                                           title="编辑"><span class="fa fa-pencil-square"></span></a>
                                    </#if>
                                        <#if loginUser.role?? && loginUser.role='ADMIN'>
                                            <a class="btn btn-minier"
                                               href="${context.contextPath}/group/user-list/${group.id?long?c}/1" title="用户列表"><span
                                                    class="fa fa-list"></span></a>
                                        </#if>
                                        <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                            <button type="submit" title="删除" class="remove-control btn btn-minier"
                                                    form="from-remove-${group_index}"><span
                                                    class="fa fa-trash"></span></button>
                                            <form id="from-remove-${group_index}"
                                                  action="${context.contextPath}/group/remove" method="post"
                                                  style="display: inline"><input type="hidden" name="groupid"
                                                                                 value="${group.id?long?c}">
                                            </form>
                                        </#if>
                                        </span>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>

                        <div class="page-header position-relative">
                            <div class="row">
                                <span class="col-md-2 btn-group btn-corner"><a href="${context.contextPath}/group/add"
                                                                               target="_self"
                                                                               style="color:#FFF;text-decoration:none;"
                                                                               title="添加部门"
                                                                               class="btn btn-info fa fa-plus"></a> <a
                                        href=""
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