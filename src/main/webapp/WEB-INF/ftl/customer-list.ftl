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
                        <div class="position-relative">
                            <div class="row"><span class="col-md-2"><a href="${context.contextPath}/customer/add"
                                                                       target="_self"
                                                                       style="color:#FFF;text-decoration:none;"
                                                                       title="填写资源"
                                                                       class="btn btn-info fa fa-plus"></a> <a
                                    href="" style="color:#FFF;text-decoration:none;" class="btn btn-info fa fa-refresh"
                                    title="刷新列表"></a></span>
                                <span class="col-md-10">
                                <#if page.totalRows gt 0><#import "/common/pager.ftl" as pager><@pager.pager page context.contextPath+path></@pager.pager></#if>
                                </span>
                            </div>
                        </div>
                        <table id="sample-table-1"
                               class="table table-striped table-bordered table-hover table-condensed table-responsive"
                               style="word-wrap: break-word;table-layout:fixed">
                            <thead>
                            <tr>
                                <th class="text-right">ID</th>
                                <th class="text-right">患者国家</th>
                                <th class="text-right">患者姓名</th>
                                <th class="text-right">病种</th>
                                <th class="text-right">所属人</th>
                                <th class="text-right">创建人</th>
                                <th class="text-right">来源网站</th>
                                <th class="text-right">是否住院</th>
                                <th class="text-right">更新时间</th>
                                <th class="text-right">创建时间</th>

                                <th class="text-right">功能</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list page.list as customer>
                            <tr>
                                <td class="text-right">${customer.id?c}</td>
                                <td class="text-right"><#if customer.patientCountry??>${customer.patientCountry.name}<#else><#if customer.liaisonCountry??>${customer.liaisonCountry.name}
                                    <span
                                            class="label label-green">(咨询人国家)</span><#else><span
                                        class="label">不详</span></#if></#if></td>
                                <td class="text-right"><#if (customer.patientName)??>
                                    <div>${customer.patientName}</div><#else><#if (customer.liaisonName)??>
                                    <div>${customer.liaisonName}</div><#else><span class="label">不详</span></#if></#if>
                                    <div class="stars-ui-ele btn-minier rating"
                                         data-init-score="${(customer.stars)!'0'}" title="意向的星级"></div>
                                </td>
                                <td class="text-right"><#if customer.diseaseType??>${customer.diseaseType.name}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td><#if customer.ownerUser??>${customer.ownerUser.realName}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if (customer.user.realName)??>${customer.user.realName}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.website??>${customer.website.name}<#else><span
                                        class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.hospitalization??>${customer.hospitalization.textName}<#else>
                                    <span
                                            class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.updated??>${customer.updated?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>
                                <td class="text-right"><#if customer.added??>${customer.added?string('yyyy-MM-dd HH:mm:ss')}<#else>
                                    <span class="label">不详</span></#if></td>

                                <td class="center">
                                    <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.userId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                                        <a class="btn btn-minier" href="/customer/update/${customer.id?c}"><span
                                                class="fa fa-edit"></span></a>

                                        <#if ['ADMIN']?seq_contains(loginUser.role)>
                                            <form action="${context.contextPath}/customer/remove" method="post"
                                                  style="display: inline;"><input type="hidden" name="id"
                                                                                  value="${customer.id?c}">
                                                <button class="btn btn-minier"
                                                        href="${context.contextPath}/customer/remove"><span
                                                        class="fa fa-trash"></span></button>
                                            </form>
                                            <a class="btn btn-minier"
                                               href="${context.contextPath}/customer/get/${customer.id?c}"><span
                                                    class="fa fa-search"></span></a>
                                        </#if>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                        <div class="page-header position-relative">
                            <div class="row"><span class="col-md-2 btn-group btn-corner"><a
                                    href="${context.contextPath}/customer/add"
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

<script src="${context.contextPath}/resources/ace/assets/js/jquery.raty.js"></script>

<script type="text/javascript">
    $(function () {
        $('.stars-ui-ele').raty({
            noRatedMsg: "它还没有星星",
            starType: 'span',
            hints: ['很糟糕', '不好', '一般', '好', '很向往'],
            space: false,
            score: function () {
                return $(this).attr('data-init-score');
            },
            readOnly: true,
            size: 4,
            space: false
        });
    });
</script>
</body>
</html>