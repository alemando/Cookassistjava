<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="row">
                            <h2 class="offset-2">${messages.get("bill")}</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-2">
                            <c:if test= "${!empty bill}">
                                <div class="card d-block card_select">
                                    <div class="card-body">
                                        <h5 class="card-title">${messages.get("code")}: ${bill.getCode()}</h5>
                                        <p class="card-text">${messages.get("user")}: ${bill.getUser().getName()}</p>
                                        <div class="content table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">${messages.get("code")}</th>
                                                        <th scope="col">${messages.get("user")}</th>
                                                        <th scope="col">${messages.get("price")}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="total" value="${total=0}" scope="page"/>
                                                    <c:forEach items="${bill.getListOrders()}" var="order">
                                                        <tr>
                                                            <c:set var="total" value="${total + order.value.total_price()}" scope="page"/>
                                                            <td>${order.value.getCode()}</td>
                                                            <td>${order.value.getUser().getEmail()}</td>
                                                            <td>${order.value.total_price()}</td>
                                                        </tr>
                                                    </c:forEach>
                                                        <tr>

                                                            <td>${messages.get("total")}</td>
                                                            <td colspan="4">$ <c:out value = "${total}"/> ${messages.get("cop")}</td>

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