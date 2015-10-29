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
            <li class="active"><span class="fa fa-users"></span>角色列表</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-6 col-xs-offset-3">
                        <table id="sample-table-1"
                               class="table table-striped table-bordered table-hover table-condensed table-responsive"
                               style="word-wrap: break-word;table-layout:fixed">
                            <colgroup>
                                <col class="col-md-1">
                                <col class="col-md-2">
                            <#--<col class="col-md-2">-->
                            </colgroup>
                            <thead>
                            <tr>
                            <#--<th class="text-right">id</th>-->
                                <th class="text-right">名称</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list roleTypes as roleType>
                            <tr>
                            <#--<td class="text-right">${roleType.code}</td>-->
                                <td class="text-right">${roleType.roleName}</td>
                                <td class="center">
                                    <#if loginUser.role?? && (loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a class="btn btn-minier"
                                           href="${context.contextPath}/role/user-list/${roleType.code}/1" title="用户列表"><span
                                                class="fa fa-list"></span></a>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>

                        <div class="page-header position-relative">
                            <div class="row">
                                <span class="col-md-2"><a href="" style="color:#FFF;text-decoration:none;"
                                                          class="btn btn-info fa fa-refresh" title="刷新列表"></a></span>
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

<script>
    $('.btn').tooltip();
</script>
</body>
</html>