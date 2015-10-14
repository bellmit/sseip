<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>提交资料完成</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><span class="ace-icon fa fa-home home-icon"></span><a href="${context.contextPath}/customer/list/1">顾客资源一览</a>
            </li>
            <li class="active">提交完成</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="alert alert-success">
                        顾客资源资料添加完成。
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>id</dt>
                            <dd>${customer.id}</dd>
                            <dt>顾客姓名</dt>
                            <dd><#if (customer.name)??>${customer.name}<#else><span class="label">不详</span></#if></dd>
                            <dt>性别</dt>
                            <dd><#if (customer.sex)??>${customer.sex.textName}<#else><span class="label">不详</span></#if>
                            </dd>
                            <dt>年龄</dt>
                            <dd><#if (customer.age)??>${customer.age}<#else><span class="label">不详</span></#if></dd>
                            <dt>地址</dt>
                            <dd><#if (customer.address)??>${customer.address}<#else><span class="label">不详</span></#if>
                            </dd>
                            <dt>症状</dt>
                            <dd><#if (customer.symptom)??>${customer.symptom}<#else><span class="label">不详</span></#if>
                            </dd>
                            <dt>电子邮件</dt>
                            <dd><#if (customer.email)??>${customer.email}<#else><span class="label">不详</span></#if></dd>
                            <dt>电话</dt>
                            <dd><#if (customer.tel)??>${customer.tel}<#else><span class="label">不详</span></#if></dd>
                            <dt>网站</dt>
                            <dd><#if (customer.website)??>${customer.website.textName}<#else><span
                                    class="label">不详</span></#if>
                            </dd>
                            <dt>疾病类型</dt>
                            <dd><#if (customer.diseaseType)??>${customer.diseaseType.textName}<#else><span
                                    class="label">不详</span></#if></dd>
                            <dt>接入点类型</dt>
                            <dd><#if (customer.accessPointType)??>${customer.accessPointType.textName}<#else><span
                                    class="label">不详</span></#if></dd>
                            <dt>是否边远</dt>
                            <dd><#if customer.faraway??>${customer.faraway?then('遥远','不遥远')}<#else><span
                                    class="label">不详</span></#if></dd>
                            <dt>是否急救</dt>
                            <dd><#if customer.emergency??>${customer.emergency?then('急救','不急救')}<#else><span
                                    class="label">不详</span></#if></dd>
                            <dt>创建日期</dt>
                            <dd><#if (customer.added)??>${customer.added?string('yyyy-MM-hh, HH:mm:ss')}<#else><span
                                    class="label">不详</span></#if></dd>
                            <dt>提交者</dt>
                            <dd><#if (customer.user.realName)??>${customer.user.realName}<#else><span
                                    class="label">不详</span></#if>
                            </dd>
                            <dt>所属部门</dt>
                            <dd><#if (customer.group.name)??>${customer.group.name}<#else><span
                                    class="label">不详</span></#if>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="row">
                    <a class="btn btn-info" href="${context.contextPath}/" target="_top">
                        <span class="ace-icon fa fa-home bigger-110"></span>回首页
                    </a>
                    <a class="btn btn-info" href="${context.contextPath}/customer/list/1"><span
                            class="ace-icon fa fa-list bigger-110"></span>顾客资源一览</a>
                    <a class="btn btn-info" href="${context.contextPath}/customer/add">
                        <span class="ace-icon fa fa-edit bigger-110"></span>继续添加
                    </a>
                    <a class="btn btn-info" href="javascript:;">
                        <span class="ace-icon fa fa-eye bigger-110"></span>查看提交内容
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/common/common_js.ftl">
</body>
</html>