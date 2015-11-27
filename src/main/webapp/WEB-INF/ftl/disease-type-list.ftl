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
            <li class="active"><span class="fa fa-heartbeat orange"></span>疾病类型一览</li>
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
                                <col class="col-xs-4">
                                <col class="col-xs-4">
                                <col class="col-xs-4">
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-right">id</th>
                                <th class="text-right">名称</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as diseaseType>
                            <tr>
                                <td class="text-right">${diseaseType.id?long?c}</td>
                                <td class="text-right"><#if (diseaseType.name)??>${diseaseType.name}<#else><span
                                        class="label">不详</span></#if>
                                </td>
                                <td class="center">
                                    <#if ['ADMIN']?seq_contains(loginUser.role)>
                                        <span class="btn-group">
                                            <a class="btn btn-minier"
                                               href="/disease-type/update/${diseaseType.id?long?c}" title="编辑病种"><span
                                                    class="fa fa-pencil-square"></span></a>
                                            <button form="from-remove-disease-type-${diseaseType_index}"
                                                    class="remove-control btn btn-minier" title="删除病种"><span
                                                    class="fa fa-eraser"></span></button>
                                        </span>

                                        <form id="from-remove-disease-type-${diseaseType_index}"
                                              action="${context.contextPath}/disease-type/remove" method="post"
                                              style="display: inline;"><input type="hidden" name="id"
                                                                              value="${diseaseType.id?long?c}">
                                        </form>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span
                                    class="col-md-2 btn-group btn-corner"><#if ['ADMIN']?seq_contains(loginUser.role)><a
                                    href="${context.contextPath}/disease-type/add" target="_self"
                                    style="color:#FFF;text-decoration:none;" title="建造新的贸易国家与地区条目"
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