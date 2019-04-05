<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_bill.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <h2>${messages.get("bill_title")}</h2>
                        <form id="bill"action="<c:url value="/bills?option=new"/>" class="form-horizontal" method="POST"></form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>* ${messages.get("user")}</label>
                                <select form="bill" id="user" class="form-control" name="user" required>
                                    <option></option>
                                    <c:forEach items="${ListUsers}" var="user">
                                        <option value=${user.key}>${user.value.getEmail()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md">
                                <h4>${messages.get("order_title")}</h4>
                            </div>
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">${messages.get("code")}</th>
                                            <th scope="col">${messages.get("user")}</th>
                                            <th scope="col">${messages.get("price")}</th>
                                            <th scope="col">${messages.get("remove")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="total" value="${total=0}" scope="page"/>
                                        <c:forEach items="${ListOrderTemp}" var="order">
                                            <c:set var="total" value="${total + order.value.total_price()}" scope="page"/>
                                            <form id="remove-${order.value.getCode()}"action="<c:url value="/bills?option=remove&id=${order.value.getCode()}"/>" class="form-horizontal" method="POST"></form>
                                            <tr>
                                                <td>${order.value.getCode()}</td>
                                                <td>${order.value.getUser().getEmail()}</td>
                                                <td>${order.value.total_price()}</td>
                                                <td>
                                                    <button class="btn btn-danger btn-block btn_submit" form="remove-${order.value.getCode()}">X</button>
                                                </td>
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
                        <c:if test="${!empty ListOrderTemp}">
                            <div class="row">
                                <div class="col-md">
                                    <button class="btn btn-lg btn-success btn-block btn_submit" form="bill">${messages.get("new_bill")}</button>
                                </div>
                            </div>
                        </c:if>                       
                        
                        <br>
                        <div class="row">
                            <div class="col-md">
                                 <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/orders?option=need_bill"/>>${messages.get("go_orders")}</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>