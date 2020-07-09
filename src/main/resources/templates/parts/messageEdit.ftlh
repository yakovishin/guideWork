
<a class="btn btn-primary ml-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
</div>

<div class="collapse <#if message??>show</#if> mb-2 " id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if message??>${message.text}</#if>"
                       placeholder="Введите сообщение">
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" value="<#if message??>${message.tag}</#if>" name="tag" class="form-control ${(tagError??)?string('is-invalid','')}" placeholder="Введите Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="custom-file">
                <input name="file" type="file" id="custom_id">
                <label class="custom-file-label" for="custom_id">Choose file</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
            <div class="form-group mt-3">
                <button type="submit"  class="btn btn-primary">Save message</button>
            </div>
        </form>
    </div>
</div>
