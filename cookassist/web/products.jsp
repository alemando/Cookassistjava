<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10 content">
                    <div class="row">
                        <h2>Productos</h2>
                    </div>
                    <div class="row">
                        <div class="card-columns" style="padding: 10px">
                            <c:forEach items="${ListProducts}" var="pro">
                                <div class="card">
                                    <img src=${pro.value.getImageUrl()} class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">${pro.value.getName()}</h5>
                                    <p class="card-text">${pro.value.getDescription()}</p>
                                    <p class="card-text">$ ${pro.value.getPrice()} pesos</p>
                                    <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/products?id="/>${pro.value.getCode()}>VER</a>
                                    <button class="btn btn-lg btn-warning btn-block">Ordenar</button>
                                </div>
                              </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>