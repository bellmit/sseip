<ul id="memo-ul-container" class="text-left">
<#if (customer.memos)?? || memos??>
    <#list (customer??)?then(customer.memos,memos) as memo>
        <li><span class="blue">${memo.content?html}</span> -
            <span class="text-warning">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
            -
            <span class="text-primary">${(memo.user.realName)!''}</span>
        </li>
    </#list>
</#if>
</ul>