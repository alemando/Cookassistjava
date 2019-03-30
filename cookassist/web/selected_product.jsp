<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10 content">
                    <div class="row">
                        <h2 class="offset-2">Producto</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-8 offset-2">
                        <c:if test= "${!empty product}">
                                <div class="card d-block card_select ">
                                    <img src=${product.getImageUrl()} class="card-img-top img-fluid">
                                    <div class="card-body">
                                        <h5 class="card-title">${product.getName()}</h5>
                                        <p class="card-text">Codigo: ${product.getCode()}</p>
                                        <p class="card-text">Categoria: ${product.category_interpreter(product.getCategory())}</p>
                                        <p class="card-text">Estado: ${product.available_interpreter(product.getAvailable())}</p>
                                        <p class="card-text">Descripción: ${product.getDescription()}</p>
                                        <p class="card-text">Precio: $ ${product.getPrice()} pesos</p>
                                        <button class="btn btn-lg btn-warning btn-block">Ordenar</button>
                                        <!--Faltan los comentarios y demas-->
                                    </div>
                              </div>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>