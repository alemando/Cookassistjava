<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>Pedidos a mi cargo</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Codigo</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Ver</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListChefOrders}" var="order">
                                            <tr>
                                                <td>${order.value.getCode()}</td>
                                                <td>${order.value.getUser().getEmail()}</td>
                                                <c:if test ="${order.value.getReady()}">
                                                    <td>
                                                        <form action=<c:url value="/orders?option=status&id="/>${order.value.getCode()} method="POST">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${order.value.ready_interpreter(order.value.getReady())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <c:if test ="${!order.value.getReady()}">
                                                    <td>
                                                        <form action=<c:url value="/orders?option=status&id="/>${order.value.getCode()} method="POST">
                                                            <button class="btn btn-lg btn-danger btn-block btn_submit">${order.value.ready_interpreter(order.value.getReady())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/orders?id="/>${order.value.getCode()}>VER</a>
                                                </td>
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