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
                            <div class="card-columns" style="padding: 10px">
                                <c:forEach items="${ListProducts}" var="pro">
                                    <c:if test="${pro.value.getAvailable()}">
                                    <div class="card">
                                        <img src=${pro.value.getImageUrl()} class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">${pro.value.getName()}</h5>
                                        <p class="card-text">${pro.value.getDescription()}</p>
                                        <p class="card-text">$ ${pro.value.getPrice()} ${messages.get("cop")}</p>
                                        <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/products?id="/>${pro.value.getCode()}>${messages.get("see")}</a>
                                        <c:if test="${!empty user and !chef}">
                                        <button class="btn btn-lg btn-warning btn-block" type="button" data-toggle="collapse" data-target="#collapseid-${pro.value.getCode()}" aria-expanded="false" aria-controls="collapseid-${pro.value.getCode()}">${messages.get("order")}</button>
                                        <div class="collapse" id="collapseid-${pro.value.getCode()}">
                                            <div class="card card-body">
                                                <form action="<c:url value="/orders?option=add&id=${pro.value.getCode()}"/>" class="form-horizontal" method="POST">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label>${messages.get("quantity")}</label>
                                                            <c:if test="${!empty ListProductTemp.get(pro.value.getCode())}">
                                                                <input id="quantity" class="form-control" value="${ListProductTemp.get(pro.value.getCode())[1]}" name="quantity" required>
                                                            </c:if>
                                                            <c:if test="${empty ListProductTemp.get(pro.value.getCode())}">
                                                                <input id="quantity" class="form-control" name="quantity" required>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">${messages.get("order")}</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                                    </div>
                                  </div>
                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>