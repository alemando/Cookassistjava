<div id="sidebar" class="col-md-2">
    <div id="nav_div">
        <h4>Opciones</h4>
        <ul class="link-list">
            <li>
                <a href=<c:url value="/chefs"/>>${messages.get("chef_title")}</a>
            </li>
            <li>
                <a href=<c:url value="/chefs?option=new"/>>${messages.get("new_chef")}</a>
            </li>
        </ul>
    </div>
</div>