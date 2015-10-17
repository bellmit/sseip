<#macro pager page baseUrl>
<div class="dataTables_paginate">
    <ul class="pagination">
        <li>
            <span>${page.pageNo?c}/${page.maxPageNo?c}页</span>
            <span>每页${page.pageSize?c}条</span>
        </li>
        <li>
            <span>共${page.totalRows?c}条</span>
        </li>
        <#if page.totalRows gt 0>
            <li><#if !page.firstPage><a href="${baseUrl+'/1'}${('?'+query)!''}">首页</a><#else><span>首页</span></#if></li>
        <#--
                    <#if !page.firstPage && page.maxPageNo gte 3>
                        <li>
                            <a href="${baseUrl+'/'+(page.pageNo-1)}${('?'+query)!''}">上页</a>
                        </li>
                    </#if>
        -->
            <#if page.maxPageNo gte 3><#list  (page.pageNo-10>2)?then(page.pageNo-10,2)..(page.pageNo+10 lt page.maxPageNo)?then(page.pageNo+10,page.maxPageNo-1) as i>
                <li><#if page.pageNo=i><span>${i?c}</span><#else>
                    <a href="${baseUrl+'/'+i?c}${('?'+query)!''}">
                        <#switch i >
                            <#case page.pageNo-1>
                                上一页
                                <#break >
                            <#case page.pageNo+1>
                                下一页
                                <#break >
                            <#default>
                            ${i?c}
                        </#switch>
                    </a>
                </#if></li>
            </#list></#if>
        <#--
                    <#if !page.lastPage && page.maxPageNo gte 3>
                        <li>
                            <a href="${baseUrl+'/'+(page.pageNo+1)}${('?'+query)!''}">下页</a>
                        </li>
                    </#if>
        -->
            <#if page.maxPageNo gte 2>
                <li>
                    <#if !page.lastPage><a href="${baseUrl+'/'+page.maxPageNo?c}${('?'+query)!''}">尾页</a><#else>
                        <span>尾页</span></#if>
                </li>
            </#if>
        </#if>
    </ul>
</div>
</#macro>