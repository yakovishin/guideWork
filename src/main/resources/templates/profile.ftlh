<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    <div> ${message!}</div>
    <form method="post">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" placeholder="password" class="from-control"/>
            </div>
        </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email </label>
                <div class="col-sm-6">
                    <input type="email" name="email" placeholder="some@some.com" class="from-control" value="${email!''}"/>
                </div>
            </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button class="btn btn-primary" type="submit">Save</button>
        </div>
    </form>
</@c.page>