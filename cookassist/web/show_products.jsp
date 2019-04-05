<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2>${messages.get("product_title")}</h2>
                        </div>
                        <div class="row">
                            <div class="content table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">${messages.get("code")}</th>
                                            <th scope="col">${messages.get("name")}</th>
                                            <th scope="col">${messages.get("price")}</th>
                                            <th scope="col">${messages.get("category")}</th>
                                            <th scope="col">${messages.get("status")}</th>
                                            <th scope="col">${messages.get("see")}</th>
                                            <th scope="col">${messages.get("edit")}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListProducts}" var="pro">
                                            <tr>
                                                <td>${pro.value.getCode()}</td>
                                                <td>${pro.value.getName()}</td>
                                                <td>${pro.value.getPrice()}</td>
                                                <td>${pro.value.category_interpreter(pro.value.getCategory())}</td>
                                                <c:if test ="${pro.value.getAvailable()}">
                                                    <td>
                                                        <form action=<c:url value="/products?option=status&id="/>${pro.value.getCode()} method="POST">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${pro.value.available_interpreter(pro.value.getAvailable())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <c:if test ="${!pro.value.getAvailable()}">
                                                    <td>
                                                        <form action=<c:url value="/products?option=status&id="/>${pro.value.getCode()} method="POST">
                                                            <button class="btn btn-lg btn-danger btn-block btn_submit">${pro.value.available_interpreter(pro.value.getAvailable())}</button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <a class="btn btn-primary btn-block" href=<c:url value="/products?id="/>${pro.value.getCode()}>${messages.get("see")}</a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-danger btn-block" href=<c:url value="/products?option=edit&id="/>${pro.value.getCode()}>${messages.get("edit")}</a>
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