<#macro pager page baseUrl>
<div class="dataTables_paginate">
    <ul class="pagination">
        <li>
        <#--<span>${page.pageNo?c}/${page.maxPageNo?c}页</span>-->
            <span>共${page.totalRows?c}条, 第${(page.rowOffset+1)?c}~${(page.rowOffset+page.pageSize)?c}条</span>
        </li>
        <li>
            <span style="padding: 0;margin: 0;"><form style="display: inline;margin: 0;padding: 0;"><input
                    style="width: 3em;">

            </form></span>
        </li>
        <#if page.totalRows gt 0>
            <#if !page.firstPage>
                <li><a href="${baseUrl+'/1'}${('?'+query)!''}">1</a></li><#else>
                <li class="active"><span class="">1</span></li></#if>

        <#--
                    <#if !page.firstPage && page.maxPageNo gte 3>
                        <li>
                            <a href="${baseUrl+'/'+(page.pageNo-1)}${('?'+query)!''}">上页</a>
                        </li>
                    </#if>
        -->
            <#if page.maxPageNo gte 3><#list  (page.pageNo-3>2)?then(page.pageNo-3,2)..(page.pageNo+3 lt page.maxPageNo)?then(page.pageNo+3,page.maxPageNo-1) as i>
                <#if page.pageNo=i>
                    <li class="active"><span class="">${i?c}</span></li><#else>
                    <li><a href="${baseUrl+'/'+i?c}${('?'+query)!''}">
                        <#switch i >
                            <#case page.pageNo-1>
                                <span class="fa fa-angle-left"></span>
                                <#break >
                            <#case page.pageNo+1>
                                <span class="fa fa-angle-right"></span>
                                <#break >
                            <#default>
                            ${i?c}
                        </#switch>
                    </a>
                    </li></#if>
            </#list></#if>
        <#--
                    <#if !page.lastPage && page.maxPageNo gte 3>
                        <li>
                            <a href="${baseUrl+'/'+(page.pageNo+1)}${('?'+query)!''}">下页</a>
                        </li>
                    </#if>
        -->
            <#if page.maxPageNo gte 2>
                <#if !page.lastPage>
                    <li><a href="${baseUrl+'/'+page.maxPageNo?c}${('?'+query)!''}">${page.maxPageNo?c}</a></li><#else>
                    <li class="active"><span class="">${page.maxPageNo?c}</span></li></#if>

            </#if>
        </#if>
    </ul>
</div>
</#macro>