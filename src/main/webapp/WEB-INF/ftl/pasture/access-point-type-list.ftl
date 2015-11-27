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
            <li class="active">推广类型一览</li>
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
                               class="table table-striped table-bordered table-hover table-condensed table-responsive">
                            <colgroup class="row">
                                <col class="col-sm-4">
                                <col class="col-sm-4">
                                <col class="col-sm-4">
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-right">id</th>
                                <th class="text-right">名称</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as accessPointType>
                            <tr>
                                <td class="text-right">${accessPointType.id?long?c}</td>
                                <td class="text-right"><#if (accessPointType.name)??>${accessPointType.name}<#else><span
                                        class="label">不详</span></#if>
                                </td>
                                <td class="center">
                                    <a href="/access-point-type/update/${accessPointType.id?long?c}"><span
                                            class="fa fa-edit"></span></a>

                                    <form action="${context.contextPath}/access-point-type/remove" method="post"
                                          style="display: inline;"><input type="hidden" name="id"
                                                                          value="${accessPointType.id?long?c}">
                                        <button><span class="fa fa-trash"></span></button>
                                    </form>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2"><a
                                    href="${context.contextPath}/access-point-type/add"
                                    target="_self"
                                    style="color:#FFF;text-decoration:none;"
                                    title="创建新的推广类型"
                                    class="btn btn-info fa fa-plus"></a> <a
                                    href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
                                    title="刷新列表"></a></span>
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
</body>
</html>