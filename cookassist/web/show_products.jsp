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
                        <div class="content table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Categoria</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Ver más</th>
                                        <th scope="col">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ListProducts}" var="pro">
                                        <tr>
                                            <td>${pro.value.getCode()}</td>
                                            <td>${pro.value.getName()}</td>
                                            <td>${pro.value.getPrice()}</td>
                                            <td>${pro.value.category_interpreter(pro.value.getCategory())}</td>
                                            <td>${pro.value.available_interpreter(pro.value.getAvailable())}</td>
                                            <td>
                                                <a class="btn btn-primary btn-block" href=<c:url value="/products?id="/>${pro.value.getCode()}>VER</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger btn-block" href=<c:url value="/products?option=edit&id="/>${pro.value.getCode()}>Editar</a>
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
    </section>
</main>
<%@ include file="footer.jsp" %>