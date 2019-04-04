<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>Opciones</h4>
        <ul class="link-list">
            <li>
                <a href=<c:url value="/products"/>>Menu</a>
            </li>
            <c:if test="${!empty user}">
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/products?option=new"/>>Crear</a>
                    </li>
                    <li>
                        <a href=<c:url value="/products?option=show"/>>Listar productos</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>