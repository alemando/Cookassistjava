<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>${messages.get("my_orders")}</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">${messages.get("code")}</th>
                                            <th scope="col">${messages.get("status")}</th>
                                            <th scope="col">${messages.get("chef")}</th>
                                            <th scope="col">${messages.get("bill")}</th>
                                            <th scope="col">${messages.get("see")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListOrdersUser}" var="order">
                                            <tr>
                                                <td>${order.value.getCode()}</td>
                                                <td>${order.value.ready_interpreter(order.value.getReady())}</td>
                                                <td>${order.value.getChef().getEmail()}</td>
                                                <c:if test="${!empty order.value.getBill()}">
                                                    <td>
                                                        <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/bills?id="/>${order.value.getBill().getCode()}>${messages.get("see")}</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${empty order.value.getBill()}">
                                                    <td>${messages.get("not_bill")}</td>
                                                </c:if>
                                                <td>
                                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/orders?id="/>${order.value.getCode()}>${messages.get("see")}</a>
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