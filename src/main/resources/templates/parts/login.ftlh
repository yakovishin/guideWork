<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name: </label>
            <div class="col-sm-6">
            <input type="text" name="username" value="<#if user??>${user.username}</#if>" class="from-control ${(usernameError??)?string('is-invalid','')}" placeholder="username"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" placeholder="password" class="from-control ${(passwordError??)?string('is-invalid','')}"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
 <#if isRegisterForm>
     <div class="form-group row">
         <label class="col-sm-2 col-form-label">Password: </label>
         <div class="col-sm-6">
             <input type="password" name="password2" placeholder="Retype password" class="from-control ${(password2Error??)?string('is-invalid','')}"/>
             <#if password2Error??>
                 <div class="invalid-feedback">
                     ${password2Error}
                 </div>
             </#if>
         </div>
     </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email </label>
            <div class="col-sm-6">
                <input type="email" name="email" value="<#if user??>${user.email}</#if>" placeholder="some@some.com" class="from-control ${(emailError??)?string('is-invalid','')}"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
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