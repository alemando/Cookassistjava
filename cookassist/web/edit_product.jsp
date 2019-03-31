<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_product.jsp" %>
                <div class="col-md-10">
                    <div class="content">
                        <c:if test= "${!empty product}">
                        <form action=<c:url value="/products?option=edit&id="/>${product.getCode()} class="form-horizontal" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>* Nombre: </label>
                                    <input value=${product.getName()} id="name" class="form-control" type="text" name="name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>* Descripción:</label>
                                    <textarea id="description" class="form-control" name="description" required>${product.getDescription()}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>* Categoria</label>
                                    <select id="category" class="form-control" name="category" required>
                                        <option></option>
                                        <c:forEach items="${productCategories}" var="category">
                                            <option value=${category.key} <c:if test="${category.key eq product.getCategory()}">selected</c:if>>${category.value}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>* Precio</label>
                                    <input value=${product.getPrice()} id="price" class="form-control"  type="number" name="price" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>* Estado</label>
                                    <select id="available" class="form-control" name="available" required>
                                        <option value="false" <c:if test="${!product.getAvailable()}">selected</c:if>>No disponible</option>
                                        <option value="true" <c:if test="${product.getAvailable()}">selected</c:if>>Disponible</option>

                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Imagen</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="image" name="image" accept="image/*">
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
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>