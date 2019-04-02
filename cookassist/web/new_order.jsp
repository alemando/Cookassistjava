<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <form id="order"action="<c:url value="/orders?option=new"/>" class="form-horizontal" method="POST"></form>
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
                                        <c:set var="count" value="0" scope="page" />
                                        <c:forEach items="${ListProductTemp}" var="pro">
                                            <form id="remove-${pro.value[0].getCode()}"action="<c:url value="/orders?option=remove&id=${pro.value[0].getCode()}"/>" class="form-horizontal" method="POST"></form>
                                            <tr>
                                                <c:set var="count" value="${count + 1}" scope="page"/>
                                                <td><c:out value = "${count}"/></td>
                                                <td>${pro.value[0].getName()}</td>
                                                <td>${pro.value[0].getPrice()}</td>
                                                <td>${pro.value[1]}</td>
                                                <td>
                                                    <button class="btn btn-danger btn-block btn_submit" form="remove-${pro.value[0].getCode()}">X</button>
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
                                <textarea id="description" class="form-control" form="order" name="description"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md">
                                <button class="btn btn-lg btn-primary btn-block btn_submit" form="order">Ordenar</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>