<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div>
        <@l.logout/>
    </div>

    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Введите Тэг">
            <input name="file" type="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Добавить</button>
        </form>
    </div>

<div>
    <p>Filter</p>
    <form method="get" action="/index">
        <input type="text" name="filter" value="${filter!}">
        <button type="submit">Найти</button>
    </form>
</div>

    <div>Список сообщений </div>

  <#list messages as message >
        <div>
            <b>${message.id}</b>
            <strong>${message.authorName}</strong>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}"
                </#if>
            </div>
        </div>
      <#else>
      No messages
  </#list>
</@c.page>