<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="row">
                            <h2>Usuarios</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Tipo usuario</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListUsers}" var="user">
                                            <tr>
                                                <c:if test ="${user.value.getAdmin()}">
                                                <td>
                                                    <form action=<c:url value="/users?option=type&email="/>${user.value.getEmail()} method="POST">
                                                        <button class="btn btn-lg btn-primary btn-block btn_submit">${user.value.admin_interpreter(user.value.getAdmin())}</button>
                                                    </form>
                                                </td>
                                                </c:if>
                                                <c:if test ="${!user.value.getAdmin()}">
                                                    <td>
                                                        <form action=<c:url value="/users?option=type&email="/>${user.value.getEmail()} method="POST">
                                                            <button class="btn btn-lg btn-warning btn-block btn_submit">${user.value.admin_interpreter(user.value.getAdmin())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <td>${user.value.getName()}</td>
                                                <td>${user.value.getEmail()}</td>
                                                <c:if test ="${user.value.getStatus()}">
                                                    <td>
                                                        <form action=<c:url value="/users?option=status&email="/>${user.value.getEmail()} method="POST">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${user.value.status_interpreter(user.value.getStatus())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <c:if test ="${!user.value.getStatus()}">
                                                    <td>
                                                        <form action=<c:url value="/users?option=status&email="/>${user.value.getEmail()} method="POST">
                                                            <button class="btn btn-lg btn-danger btn-block btn_submit">${user.value.status_interpreter(user.value.getStatus())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>