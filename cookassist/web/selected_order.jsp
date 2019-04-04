<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="row">
                            <h2 class="offset-2">Pedido</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-2">
                            <c:if test= "${!empty order}">
                                <div class="card d-block card_select">
                                    <div class="card-body">
                                        <h5 class="card-title">Codigo: ${order.getCode()}</h5>
                                        <p class="card-text">Estado: ${order.ready_interpreter(order.getReady())}</p>
                                        <p class="card-text">Usuario: ${order.getUser().getName()}</p>
                                        <p class="card-text">Chef: ${order.getChef().getEmail()}</p>
                                        <p class="card-text">Factura: ${order.getBill()}</p>
                                        <p class="card-text">Descripción: ${order.getDescription()}</p>
                                        <div class="content table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Precio</th>
                                                        <th scope="col">Cantidad</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${order.getListOrderDetails()}" var="order">
                                                        <tr>
                                                            <td>${order.value.getCode()}</td>
                                                            <td>${order.value.getProduct().getName()}</td>
                                                            <td>${order.value.getPrice()}</td>
                                                            <td>${order.value.getQuantity()}</td>
                                                        </tr>
                                                    </c:forEach>
                                                        <tr>

                                                            <td>Total</td>
                                                            <td colspan="4">$ ${order.total_price()} pesos</td>

                                                        </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>