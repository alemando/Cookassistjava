<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>${messages.get("opc")}</h4>
        <ul class="link-list">
            <li>
                <a href=<c:url value="/bills"/>>${messages.get("my_bills")}</a>
            </li>
            <c:if test="${!empty user}">
                <c:if test="${user.getAdmin()}">
                    <li>
                        <a href=<c:url value="/bills?option=show"/>>${messages.get("bill_title")}</a>
                    </li>
                    <li>
                        <a href=<c:url value="/bills?option=new"/>>${messages.get("new_bill")}</a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>