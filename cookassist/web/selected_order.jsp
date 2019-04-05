<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="row">
                            <h2 class="offset-2">${messages.get("order_text")}</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-2">
                            <c:if test= "${!empty order}">
                                <div class="card d-block card_select">
                                    <div class="card-body">
                                        <h5 class="card-title">${messages.get("code")}: ${order.getCode()}</h5>
                                        <p class="card-text">${messages.get("status")}: ${order.ready_interpreter(order.getReady())}</p>
                                        <p class="card-text">${messages.get("user")}: ${order.getUser().getName()}</p>
                                        <p class="card-text">${messages.get("chef")}: ${order.getChef().getEmail()}</p>
                                        <p class="card-text">${messages.get("bill")}: ${order.getBill()}</p>
                                        <p class="card-text">${messages.get("desc")}: ${order.getDescription()}</p>
                                        <div class="content table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">${messages.get("name")}</th>
                                                        <th scope="col">${messages.get("price")}</th>
                                                        <th scope="col">${messages.get("quantity")}</th>
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

                                                            <td>${messages.get("total")}</td>
                                                            <td colspan="4">$ ${order.total_price()} ${messages.get("cop")}</td>

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