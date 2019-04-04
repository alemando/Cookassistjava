<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>Pedidos sin pagar</h2>
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
                                            <th scope="col">Factura</th>
                                            <th scope="col">Ver</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListOrders}" var="order">
                                            <c:if test="${!empty order.value.getChef() and order.value.getReady() and empty order.value.getBill()}">
                                                <tr>
                                                    <td>${order.value.getCode()}</td>
                                                    <td>${order.value.getUser().getEmail()}</td>
                                                    <td>${order.value.getChef().getEmail()}</td>
                                                    <td>${order.value.ready_interpreter(order.value.getReady())}</td>
                                                    <td>
                                                        <form action=<c:url value="/bills?option=add&id="/>${order.value.getCode()} method="POST">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">Agregar a factura</button>
                                                        </form>

                                                    </td>
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
                        <div class="row">
                            <div class="content">
                                <div class="col-md-12">
                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/bills?option=new"/>>Ir a factura</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>