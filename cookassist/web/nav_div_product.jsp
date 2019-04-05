<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>${messages.get("opc")}</h4>
        <ul class="link-list">
            <li>
                <a href=<c:url value="/products"/>>${messages.get("menu")}</a>
            </li>
            <c:if test="${!empty user}">
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/products?option=new"/>>${messages.get("new")}</a>
                    </li>
                    <li>
                        <a href=<c:url value="/products?option=show"/>>${messages.get("list_products")}</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>