<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_chef.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>Chefs</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListChefs}" var="chef">
                                            <tr>
                                                <td>${chef.value.getName()}</td>
                                                <td>${chef.value.getEmail()}</td>
                                                <c:if test ="${chef.value.getStatusChef()}">
                                                    <td>
                                                        <form action=<c:url value="/chefs?option=status&email="/>${chef.value.getEmail()} method="POST">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${chef.value.status_interpreter(chef.value.getStatusChef())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <c:if test ="${!chef.value.getStatusChef()}">
                                                    <td>
                                                        <form action=<c:url value="/chefs?option=status&email="/>${chef.value.getEmail()} method="POST">
                                                            <button class="btn btn-lg btn-danger btn-block btn_submit">${chef.value.status_interpreter(chef.value.getStatusChef())}</button>
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