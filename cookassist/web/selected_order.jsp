<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <div class="row">
                            <h2 class="offset-2">Pedido</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 offset-2">
                            <c:if test= "${!empty order}">
                                <div class="card d-block card_select">
                                    <div class="card-body">
                                        <h5 class="card-title">Codigo: ${order.getCode()}</h5>
                                        <p class="card-text">Usuario: ${order.getUser().getName()}</p>
                                        <p class="card-text">Chef: ${order.getChef()}</p>
                                        <p class="card-text">Factura: ${order.getBill()}</p>
                                        <p class="card-text">Descripción: ${order.getDescription()}</p>
                                        <button class="btn btn-lg btn-warning btn-block" type="button" data-toggle="collapse" data-target="#collapseid" aria-expanded="false" aria-controls="collapseid">Eliminar</button>
                                        <div class="collapse" id="collapseid">
                                            <div class="card card-body">
                                                <form action="<c:url value="/orders?option=delete&id=${order.getCode()}"/>" class="form-horizontal" method="POST">
                                                    <div class="row">
                                                        <div class="col-md">
                                                            <button class="btn btn-lg btn-success btn-block btn_submit">Eliminar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!--Faltan los comentarios y demas-->
                                    </div>
                                </div>
                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>