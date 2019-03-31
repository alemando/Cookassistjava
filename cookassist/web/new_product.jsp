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
                                <div class="form-group col-md-6">
                                    <label>* Nombre: </label>
                                    <input id="name" class="form-control" type="text" name="name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>* Descripción:</label>
                                    <textarea id="description" class="form-control" name="description" required></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>* Categoria</label>
                                    <select id="category" class="form-control" name="category" required>
                                        <option></option>
                                        <c:forEach items="${productCategories}" var="category">
                                            <option value=${category.key}>${category.value}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>* Precio</label>
                                    <input id="price" class="form-control"  type="number" name="price" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>* Imagen</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" required>
                                        <label class="custom-file-label" for="image">Choose file</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <p id="men_obl">Campos marcados con (*) son obligatorios.</p>
                                    <button class="btn btn-lg btn-primary btn-block btn_submit">Enviar</button>
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