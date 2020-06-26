<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<h1>Login Page</h1>
<@l.login "/login"/>
<a href="/registration">Add new User</a>
</@c.page>