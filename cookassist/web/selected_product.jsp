<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <div class="row">
                            <h2 class="offset-2">Producto</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-2">
                            <c:if test= "${!empty product}">
                                <div class="card d-block card_select">
                                    <img src=${product.getImageUrl()} class="card-img-top img-fluid">
                                    <div class="card-body">
                                        <h5 class="card-title">${product.getName()}</h5>
                                        <p class="card-text">Codigo: ${product.getCode()}</p>
                                        <p class="card-text">Categoria: ${product.category_interpreter(product.getCategory())}</p>
                                        <c:if test="${!empty user and user.getAdmin()}">
                                        <p class="card-text">Estado: ${product.available_interpreter(product.getAvailable())}</p>
                                        </c:if>
                                        <p class="card-text">Descripción: ${product.getDescription()}</p>
                                        <p class="card-text">Precio: $ ${product.getPrice()} pesos</p>
                                        <c:if test="${!empty user and product.getAvailable()}">
                                        <button class="btn btn-lg btn-warning btn-block" type="button" data-toggle="collapse" data-target="#collapseid-${product.getCode()}" aria-expanded="false" aria-controls="collapseid-${product.getCode()}">Ordenar</button>
                                        <div class="collapse" id="collapseid-${product.getCode()}">
                                            <div class="card card-body">
                                                <form action="<c:url value="/orders?option=add&id=${product.getCode()}"/>" class="form-horizontal" method="POST">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label>Cantidad</label>
                                                            <c:if test="${!empty ListProductTemp.get(product.getCode())}">
                                                                <input id="quantity" class="form-control" value="${ListProductTemp.get(product.getCode())[1]}" name="quantity" required>
                                                            </c:if>
                                                            <c:if test="${empty ListProductTemp.get(product.getCode())}">
                                                                <input id="quantity" class="form-control" name="quantity" required>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">Ordenar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                                        <!--Faltan los comentarios y demas-->
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