<%@ include file="header.jsp" %>
<div id="login">
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action=<c:url value="/login"/> method="post">
                        <h3 class="text-center">${messages.get("login")}</h3>
                        <div class="form-group">
                            <label for="email">${messages.get("email")}: </label>
                            <input type="email" name="email" id="email" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" >${messages.get("password")}:</label>
                            <input type="password" name="password" id="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <br>
                            <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                        </div>
                        <div id="register-link" class="text-right">
                            <a href=<c:url value="/register"/> >${messages.get("register")}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    
<%@ include file="footer.jsp" %>