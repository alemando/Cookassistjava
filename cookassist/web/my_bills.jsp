<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_bill.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>${messages.get("my_bills")}</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">${messages.get("code")}</th>
                                            <th scope="col">${messages.get("price")}</th>
                                            <th scope="col">${messages.get("see")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${user.getListBills()}" var="bill">
                                            <tr>
                                                <td>${bill.value.getCode()}</td>
                                                <td>${bill.value.total_price()}</td>
                                                <td>
                                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/bills?id="/>${bill.value.getCode()}>${messages.get("see")}</a>
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