<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div class="form-row mb-2">
        <form method="get" action="/index" class="form-inline">
            <input type="text" name="filter" value="${filter!}" class="" placeholder="Search by tag">
            <button type="submit"  class="btn btn-primary ml-2">Search</button>
        </form>
        <a class="btn btn-primary ml-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new Message
        </a>
    </div>

    <div class="mb-2 collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control" placeholder="Введите сообщение">
                </div>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control" placeholder="Введите Тэг">
                </div>
                <div class="custom-file">
                    <input name="file" type="file" id="custom_id">
                    <label class="custom-file-label" for="custom_id">Choose file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group mt-3">
                    <button type="submit"  class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message >
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}"
                    </#if>
                </div>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>