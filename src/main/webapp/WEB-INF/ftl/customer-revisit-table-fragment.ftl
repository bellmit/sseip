<table id="customer-table-1"
       class="table table-striped table-hover table-condensed table-responsive smaller-90"
       style="word-wrap: break-word;table-layout:fixed;margin-bottom:4px;">
<#--table-bordered-->
    <colgroup class="row">
    <#--1-->
    <#--<col style="width: 3.5em;">-->
        <col style="width: 13.5em;">
        <col style="width:3em;">
        <col style="width:5em;">
        <col style="width:3em;">
        <col style="width: 8em;">
        <col class="">
    <#--5    -->
        <col style="width: 3em;">
        <col style="width: 10em;">
        <col style="width: 10em;">
    <#--<col >--> <#--style="width: 11em;"--> <#--备注-->
        <col style="width: 3em;">
    <#--9-->
        <col style="width: 4.3em;">
        <col style="width: 9.3em;">
        <col style="width: 9.3em;">
        <col style="width: 7em;">
    <#--<col class="col-sm-1">
    <col class="col-sm-2">
    <col class="col-sm-2">
    <col class="col-sm-2">
    <col class="col-sm-2">
    <col class="col-sm-1">
    <col class="col-sm-2">-->
    </colgroup>
    <thead>
    <tr>
    <#--<th class="text-right"><input type="checkbox" id="check-all"></th>-->
        <th class=""><input type="checkbox" id="check-all">姓名</th>
        <th class="">发邮</th>
        <th class="">通话</th>
        <th class="">年龄</th>
        <th class="">国家</th>
        <th class="">症状</th>
        <th class="" title="是否住院">住院</th>
        <th class="">所属网站群组</th>
        <th class="">来源域名</th>
        <th class="" title="是否报备">报备</th>
        <th class="">提交人</th>
        <th class="">待回访日</th>
        <th class="">创建时间</th>

        <th class="center">功能</th>
    </tr>
    </thead>

    <tbody>
    <#list page.list as customer>
    <tr>
    <#--<td class="text-right id-col">-->
    <#--${customer.id?c}-->
    <#--<input type="checkbox" class="checkbox-each-id" name="customer-ids"
           value="${customer.id?c}" form="pass-on-form" style="margin: 0;">-->
    <#--<label style="width: 100%;"></label>-->
    <#--</td>-->
        <td class="checkbox-control"
            <#if (customer.patientName)??>title="${customer.patientName}"</#if>>
            <input type="checkbox" class="checkbox-each-id" name="customer-ids"
                   value="${customer.id?c}" form="pass-on-form" style="margin: 0;">

            <span class="label-yellow">${(customer.stars)!'0'}</span>
            <#if (customer.patientName)??>
                <#if customer.patientName?length gt 18>${customer.patientName?substring(0,18)+'...'}<#else>${customer.patientName}</#if>
            <#else>
                <#if (customer.liaisonName)??>
                ${customer.liaisonName}<#else><#--<span
                                class="label"><span class="fa fa-question"></span>--></#if>
            </#if>

        <#--<div></div>-->
        <#--<div class="stars-ui-ele btn-minier rating"
             data-init-score="${(customer.stars)!'0'}" title="意向的星级"
             style="font-size: 7px"></div>-->
        </td>
        <td class="center"
            title="${((customer.emailSent)?? && customer.emailSent)?string('已发送','未发送')}"><#if (customer.emailSent)?? && customer.emailSent>
            <span class="fa fa-envelope-square bigger-140 text-success"></#if></td>
        <td title="${(customer.callState)!''}">${(customer.callState)!''}</td>
        <td title="${(customer.age)!''}">${(customer.age)!''}</td>
        <td class=""<#if customer.patientCountry??>
            title="${customer.patientCountry.name}"</#if>><#if customer.patientCountry??><#if (customer.patientCountry.name)?length gt 7>${customer.patientCountry.name?substring(0,6)+'...'}<#else>${customer.patientCountry.name}</#if><#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
        <td class=""
            title="${(customer.symptom)!''}"><#if customer.symptom??><#if (customer.symptom)?length gt 24>${customer.symptom?substring(0,24)+'...'}<#else>${customer.symptom}</#if><#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
        <td class="center"
            title="${(customer.hospitalization.textName)!''}"><#if (customer.hospitalization)??>
            <#switch customer.hospitalization>
                <#case 'YES'><span class="fa bigger-140 fa-hotel text-danger"></span>
                    <#break>
                <#case 'NO'><span class="fa bigger-140 fa-thumbs-o-down text-info"></span>
                    <#break>
                <#case 'DISCHARGE'><span class="fa bigger-140 fa-child text-success"></span>
                    <#break>
            </#switch>
        <#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
        <td class=""
            title="${(customer.website.name)!''}"><#if customer.website??><#if customer.website.name?length gt 8>${customer.website.name?substring(0,8)+'...'}<#else>${customer.website.name}</#if><#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
        <td class=""
            title="${(customer.sourceWebsite)!''}"><#if customer.sourceWebsite??><#if customer.sourceWebsite?length gt 16>${customer.sourceWebsite?substring(0,15)+'...'}<#else>${customer.sourceWebsite}</#if><#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
    <#--<td class=""
        title="${(customer.memo)!''}"><#if customer.memo??><#if customer.memo?length gt 26>${customer.memo?substring(0,26)+'...'}<#else>${customer.memo}</#if><#else>
        <span class="label"><span class="fa fa-question"></span></#if></td>-->
        <td class="center"
            title="<#if (customer.ifReport)??>${customer.ifReport?string('报备','不报备')}</#if>"><#if (customer.ifReport)??><#if customer.ifReport>
            <span class="fa bigger-140 fa-circle-o-notch green"></span></#if><#else><#--<span class="label"><span class="fa fa-question"></span></span>--></#if>
        </td>
    <#--<td class=""
        title="${(customer.diseaseType.name)!''}"><#if customer.diseaseType??><#if customer.diseaseType.name?length gt 8>${customer.diseaseType.name?substring(0,5)+'...'}<#else>${customer.diseaseType.name}</#if><#else>
        <span class="label"><span class="fa fa-question"></span></#if></td>-->
        <td class=""
            title="${(customer.user.realName)!''}"><#if ((customer.user.realName))??><#if customer.user.realName?length gt 8>${customer.user.realName?substring(0,5)+'...'}<#else>${customer.user.realName}</#if><#else>
        <#--<span class="label"><span class="fa fa-question"></span>--></#if></td>
        <td title="${(customer.revisitDate?string('yyyy.MM.dd'))!''}"><#if customer.revisitDate??>${customer.revisitDate?string('yyyy.MM.dd')}<#else>
        <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>
        <td class=""
            <#if customer.added??>title="${customer.added?string('yyyy.MM.dd HH:mm:ss')}"</#if>><#if customer.added??>${customer.added?string('yyyy.MM.dd HH:mm')}<#else>
        <#--<span class="label"><span class="fa fa-question"></span></span>--></#if></td>

        <td class="">
            <#if loginUser.role?? && ((loginUser.role=='EMPLOYEE'&& customer.userId?? && loginUser.id==customer.ownerUserId) ||(loginUser.role='DIRECTOR' && customer.groupId?? && loginUser.groupId?? && loginUser.groupId==customer.groupId)||loginUser.role='ADMIN'||loginUser.role='MANAGER')>
                <span class="btn-group"><a class="btn btn-minier" href="/customer/update/${customer.id?c}"
                                           title="编辑"><span class="fa fa-paint-brush "></span></a>

                <#--<#if ['ADMIN']?seq_contains(loginUser.role)>
                    <form action="${context.contextPath}/customer/remove" method="post"
                          style="display: inline;"><input type="hidden" name="id"
                                                          value="${customer.id?c}">
                        <button class="btn btn-minier"
                                href="${context.contextPath}/customer/remove"><span
                                class="fa fa-trash"></span></button>
                    </form></#if>-->
                    <button form="from-discard-customer-${customer_index}"
                            class="remove-control btn btn-minier <#if customer.discard>btn-pink<#else>btn-success</#if>"
                            title="<#if customer.discard>已提交删除<#else>未提交删除</#if>"><span
                            class="fa fa-eraser "></span>
                    </button>
                    <form id="from-discard-customer-${customer_index}"
                          action="${context.contextPath}/customer/update-discard" method="post"
                          style="display: none;"><input type="hidden" name="id"
                                                        value="${customer.id?c}"><input
                            type="hidden" name="discard"
                            value="${customer.discard?string('0','1')}">
                    </form>
                </span>
            </#if>
        </td>
    </tr>
    </#list>
    </tbody>
</table>
