<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>Opciones</h4>
        <ul class="link-list">
            <c:if test="${chef}">
                <li>
                    <a href=<c:url value="/orders?option=show_orders"/>>Pedidos a mi cargo</a>
                </li>
                <li>
                    <a href=<c:url value="/orders?option=need_chef"/>>Pedidos sin chef</a>
                </li>
            </c:if>
            <c:if test="${!chef}">
                <li>
                    <a href=<c:url value="/orders"/>>Mis pedidos</a>
                </li>
                <li>
                    <a href=<c:url value="/orders?option=show_bill"/>>Mis pedidos sin pagar</a>
                </li>
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/orders?option=show"/>>Pedidos</a>
                    </li>

                    <li>
                        <a href=<c:url value="/orders?option=need_chef"/>>Pedidos sin chef</a>
                    </li>


                    <li>
                        <a href=<c:url value="/orders?option=need_ready"/>>Pedidos sin terminar</a>
                    </li>
                    <li>
                        <a href=<c:url value="/orders?option=need_bill"/>>Pedidos sin pagar</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>