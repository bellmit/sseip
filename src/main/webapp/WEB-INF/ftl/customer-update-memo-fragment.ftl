<#if customer?? || memos??>
    <#list (customer??)?then(customer.memos,memos)  as memo>
    <li>${memo.content?html} -
        <span class="text-warning">${memo.added?string('yyyy-MM-dd HH:mm:ss')}</span>
        -
        <span class="text-primary">${(memo.user.realName)!''}</span>
    </li>
    </#list>
</#if>