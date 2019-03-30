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
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${Products}" var="pro">
                                        <tr>
                                            <td>${pro.getCode()}</td>
                                            <td>${pro.getName()}</td>
                                            <td>${pro.getPrice()}</td>
                                            <td>${pro.category_interpreter(pro.getCategory())}</td>
                                            <td>${pro.available_interpreter(pro.getAvailable())}</td>
                                            <td><button>Ver</button></td>
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