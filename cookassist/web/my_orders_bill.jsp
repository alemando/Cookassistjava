<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>Mis pedidos sin pagar</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Codigo</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Chef</th>
                                            <th scope="col">Factura</th>
                                            <th scope="col">Ver</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListOrdersUser}" var="order">
                                            <c:if test="${empty order.value.getBill()}">
                                                <tr>
                                                    <td>${order.value.getCode()}</td>
                                                    <td>${order.value.ready_interpreter(order.value.getReady())}</td>
                                                    <td>${order.value.getChef()}</td>
                                                    <td>${order.value.getBill()}</td>
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