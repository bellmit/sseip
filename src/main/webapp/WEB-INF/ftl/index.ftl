<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>欢迎使用双友之春CRM</title>
</head>
<body class="no-skin">
<!-- header -->
<#include "/common/top.ftl">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        /*try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }*/
    </script>
<#include "/common/left.ftl">
    <div class="main-content">
    <#if ['ADMIN','TELADMIN']?seq_contains(loginUser.role)>
        <iframe name="mainFrame" id="mainFrame" frameborder="0" src="${context.contextPath}/customer/filter"
                style="margin:0 auto;width:100%;height:100%;"></iframe>
    <#else>
        <iframe name="mainFrame" id="mainFrame" frameborder="0" src="${context.contextPath}/customer/filter-own"
                style="margin:0 auto;width:100%;height:100%;"></iframe>
    </#if>
    </div>
</div>
<#include "/common/foot.ftl">
<#include "/common/common_js.ftl">
<script>
    $(function () {
        $('ul.nav-list li:not(:has(li))').click(function (e) {
            $('ul.nav-list .active').removeClass('active');
            $(this).addClass('active');
        })
    });
    function loginFrame() {
        var mainFrame = document.getElementById("mainFrame");
        var bheight = document.documentElement.clientHeight;
        mainFrame.style.width = '100%';
        mainFrame.style.height = (bheight - 51) + 'px';

    }
    loginFrame();
    window.onresize = function () {
        loginFrame();
    }
</script>
</body>
</html>