<#import "parts/common.ftlh" as c>
<@c.page>
    <h1>User Editor</h1>
    <form method="post" action="/user">
        <input type="text" name="username" value="${user.username}"/>
        <#list roles as role>
            <div>
               <label> <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId"/>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" value="save">Save</button>
    </form>
</@c.page>