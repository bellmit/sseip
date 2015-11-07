<#if customer?? || memos??>
    <#list (customer??)?then(customer.memos,memos)  as memo>
    <li><span class="orange">${memo.content?html}</span> -
        <span class="text-warning">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
        -
        <span class="text-primary">${(memo.user.realName)!''}</span>
    </li>
    </#list>
</#if>