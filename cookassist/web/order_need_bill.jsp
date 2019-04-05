<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_order.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>${messages.get("need_bill")}</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">${messages.get("code")}</th>
                                            <th scope="col">${messages.get("user")}</th>
                                            <th scope="col">${messages.get("chef")}</th>
                                            <th scope="col">${messages.get("status")}</th>
                                            <th scope="col">${messages.get("bill")}</th>
                                            <th scope="col">${messages.get("see")}</th>
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
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${messages.get("add_to_bill")}</button>
                                                        </form>

                                                    </td>
                                                    <td>
                                                        <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/orders?id="/>${order.value.getCode()}>${messages.get("see")}</a>
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
                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/bills?option=new"/>>${messages.get("go_to_bill")}</a>
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