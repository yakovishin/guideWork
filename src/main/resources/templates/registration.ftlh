<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <h1>Add new User</h1>
       <div> ${message!}</div>
    <@l.login "/registration"/>

</@c.page>