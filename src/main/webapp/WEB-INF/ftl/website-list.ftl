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
            <li class="active">入口网站一览</li>
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
                                <col class="col-sm-3">
                                <col class="col-sm-3">
                                <col class="col-sm-3">
                                <col class="col-sm-3">
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-right">id</th>
                                <th class="text-right">名称</th>
                                <th class="text-right">域名</th>
                                <th class="center">操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as website>
                            <tr>
                                <td class="text-right">${website.id}</td>
                                <td class="text-right"><#if (website.name)??>${website.name}<#else><span class="label">不详</span></#if>
                                </td>
                                <td class="text-right"><#if (website.url)??>${website.url}<#else><span
                                        class="label">不详</span></#if>
                                </td>
                                <td class="center">
                                    <#if ['ADMIN']?seq_contains(loginUser.role)>
                                        <span class="btn-group">
                                        <form action="${context.contextPath}/website/remove" method="post"
                                              style="display: inline;"><input type="hidden" name="id"
                                                                              value="${website.id}">
                                            <a class="btn btn-minier" href="/website/update/${website.id}"
                                               title="编辑网站条目"><span
                                                    class="fa fa-edit"></span></a>
                                            <button class="btn btn-minier" title="删除网站条目"><span class="fa fa-trash"></span>
                                            </button>
                                        </form>
                                        </span>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span
                                    class="col-md-2 btn-group"><#if ['ADMIN']?seq_contains(loginUser.role)><a
                                    href="${context.contextPath}/website/add" target="_self"
                                    style="color:#FFF;text-decoration:none;" title="添加入口网站"
                                    class="btn btn-info fa fa-plus"></a></#if>
                                <a href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
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

<script>
    $('.btn').tooltip();
</script>
</body>
</html>