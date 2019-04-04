<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>Pedidos sin chef</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Codigo</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Chef</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Ver</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListOrders}" var="order">
                                            <c:if test="${empty order.value.getChef()}">
                                                <tr>
                                                    <td>${order.value.getCode()}</td>
                                                    <td>${order.value.getUser().getEmail()}</td>
                                                    <c:if test="${chef}">
                                                        <td>
                                                            <form action=<c:url value="/orders?option=take&id="/>${order.value.getCode()} method="POST">
                                                                <button class="btn btn-lg btn-success btn-block btn_submit">Tomar pedido</button>
                                                            </form>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${!chef}">
                                                        <td></td>
                                                    </c:if>
                                                    <td>${order.value.ready_interpreter(order.value.getReady())}</td>
                                                    <td>
                                                        <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/orders?id="/>${order.value.getCode()}>VER</a>
                                                    </td>
                                                </tr>
                                                
                                            </c:if>
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