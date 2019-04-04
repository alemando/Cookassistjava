<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>Opciones</h4>
        <ul class="link-list">
            <li>
                <a href=<c:url value="/bills"/>>Mis facturas</a>
            </li>
            <c:if test="${!empty user}">
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/bills?option=show"/>>Facturas</a>
                    </li>
                    <li>
                        <a href=<c:url value="/bills?option=new"/>>Nueva factura</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>