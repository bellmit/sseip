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
            <li class="active">顾客资源列表</li>
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
                               style="word-break: break-all;table-layout:fixed">
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
                                <th class="text-right">姓名</th>
                                <th class="text-right">性别</th>
                                <th class="text-right">年龄</th>
                                <th class="text-right">地址</th>
                                <th class="text-right">症状</th>
                                <th class="text-right">电子邮件</th>
                                <th class="text-right">电话</th>
                                <th class="text-right">网站</th>
                                <th class="text-right">疾病类型</th>
                                <th class="text-right">接入点类型</th>
                                <th class="text-right">边远</th>
                                <th class="text-right">急救</th>
                                <th class="text-right">创建时间</th>
                                <th class="text-right">创建人</th>
                                <th class="text-right">部门</th>
                                <th class="center">功能</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list page.list as customer>
                            <tr>
                                <td class="text-right">${customer.id}</td>
                                <td class="text-right"><#if (customer.name)??>${customer.name}<#else>
                                    <span>不详</span></#if>
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="${context.contextPath}/customer/detail/${customer.id}"
                                           class="list_link"><span class="fa fa-eye"></span></a>
                                    </#if></td>
                                <td class="text-right">
                                    <#if (customer.sex)??>${customer.sex.textName}<#else>
                                        <span>不详</span></#if></td>
                                <td class="text-right"><#if (customer.age)??>${customer.age}<#else>
                                    <span>没有写</span></#if>
                                </td>

                                <td class="text-right"><#if (customer.address)??>${customer.address}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.symptom)??>${customer.symptom}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.email)??>${customer.email}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.tel)??>${customer.tel}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.website)??>${customer.website.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.diseaseType)??>${customer.diseaseType.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.accessPointType)??>${customer.accessPointType.textName}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.faraway)??>${customer.faraway?string('是','否')}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.emergency)??>${customer.emergency?string('是','否')}<#else>
                                    <span>没有写</span></#if>
                                </td>
                                <td class="text-right"><#if (customer.added)??>${customer.added?string("yyyy-MM-dd,HH:mm:ss")}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="text-right"><#if (customer.user.realName)??>${customer.user.realName}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="text-right"><#if (customer.group.name)??>${customer.group.name}<#else>
                                    <span>没有写</span></#if></td>
                                <td class="center">
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a href="/customer/update/${customer.id}"><span
                                                class="fa fa-edit"></span></a>

                                        <form action="${context.contextPath}/customer/remove" method="post"
                                              style="display: inline;"><input type="hidden" name="id"
                                                                              value="${customer.id}">
                                            <button href="${context.contextPath}/customer/remove"><span
                                                    class="fa fa-trash"></span></button>
                                        </form>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2"><a href="${context.contextPath}/customer/add"
                                                                       target="_self"
                                                                       style="color:#FFF;text-decoration:none;"
                                                                       title="填写顾客资源"
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
<script src="${context.contextPath}/resources/js/ui/jquery.ui.datepicker.js"></script>
</body>
</html>