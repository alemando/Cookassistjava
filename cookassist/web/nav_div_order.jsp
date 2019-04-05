<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>${messages.get("opc")}</h4>
        <ul class="link-list">
            <c:if test="${chef}">
                <li>
                    <a href=<c:url value="/orders?option=show_orders"/>>${messages.get("show_orders")}</a>
                </li>
                <li>
                    <a href=<c:url value="/orders?option=need_chef"/>>${messages.get("need_chef")}</a>
                </li>
            </c:if>
            <c:if test="${!chef}">
                <li>
                    <a href=<c:url value="/orders"/>>${messages.get("my_orders")}</a>
                </li>
                <li>
                    <a href=<c:url value="/orders?option=show_bill"/>>${messages.get("my_orders_nbill")}</a>
                </li>
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/orders?option=show"/>>${messages.get("order_title")}</a>
                    </li>

                    <li>
                        <a href=<c:url value="/orders?option=need_chef"/>>${messages.get("need_chef")}</a>
                    </li>


                    <li>
                        <a href=<c:url value="/orders?option=need_ready"/>>${messages.get("need_ready")}</a>
                    </li>
                    <li>
                        <a href=<c:url value="/orders?option=need_bill"/>>${messages.get("need_bill")}</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>