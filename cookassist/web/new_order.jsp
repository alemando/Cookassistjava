<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <form action="<c:url value="/products?option=new"/>" class="form-horizontal" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="content table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Precio</th>
                                                <th scope="col">Cantidad</th>
                                                <th scope="col">Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ListProductTemp}" var="pro">
                                                <tr>
                                                    <td></td>
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
                            
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Descripción:</label>
                                    <textarea id="description" class="form-control" name="description"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <button class="btn btn-lg btn-primary btn-block btn_submit">Ordernar</button>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>