<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name: </label>
            <div class="col-sm-6">
            <input type="text" name="username" class="from-control" placeholder="username"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" placeholder="password" class="from-control"/>
            </div>
        </div>
 <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email </label>
            <div class="col-sm-6">
                <input type="email" name="email" placeholder="some@some.com" class="from-control"/>
            </div>
        </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <#if !isRegisterForm>
                <a href="/registration">Add new User</a>
            </#if>
            <button class="btn btn-primary" type="submit"><#if isRegisterForm>Created <#else> Sing In</#if></button>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <button class="btn btn-primary" type="submit">Sign out </button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>