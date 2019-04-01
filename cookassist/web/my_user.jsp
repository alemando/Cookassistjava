<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <c:if test= "${!empty user}">
                            
                            <div class="accordion col-md-12" id="accordion_user">
                                <div class="card d-block card_select ">
                                    <div class="card-body">
                                        <h5 class="card-title">${user.getName()}</h5>
                                        <c:if test ="${user.getTypeUser() eq 1}">
                                            <p class="card-text">Administrador</p>
                                        </c:if>
                                        <p class="card-text">Email: ${user.getEmail()}</p>
                                       
                                    </div>
                                </div>
                                <div class="card">
                                    <button id="heading-user"class="card-header btn btn-link collapsed btn-block" type="button" data-toggle="collapse" data-target="#collapse-user1" aria-expanded="false" aria-controls="collapse-user">
                                    <p>Cambiar nombre</p>
                                    </button>
                                    <div id="collapse-user1" class="collapse" aria-labelledby="heading-user" data-parent="#accordion_user">
                                        <div class="card-body">
                                            <form action="<c:url value="/my_user?option=name"/>" class="form-horizontal" method="POST">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label>Nuevo nombre: </label>
                                                        <input id="name" class="form-control"  type="text" name="name" required>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md">
                                                        <button class="btn btn-lg btn-primary btn-block btn_submit">Enviar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <button id="heading-user"class="card-header btn btn-link collapsed btn-block" type="button" data-toggle="collapse" data-target="#collapse-user2" aria-expanded="false" aria-controls="collapse-user">
                                    <p>Cambiar contraseña</p>
                                    </button>
                                    <div id="collapse-user2" class="collapse" aria-labelledby="heading-user" data-parent="#accordion_user">
                                        <div class="card-body">
                                            <form action="<c:url value="/my_user?option=password"/>" class="form-horizontal" method="POST">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label>Vieja contraseña: </label>
                                                        <input id="old_password" class="form-control"  type="password" name="old_password" required>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label>Nueva contraseña: </label>
                                                        <input id="new_password" class="form-control"  type="password" name="new_password" required>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md">
                                                        <button class="btn btn-lg btn-primary btn-block btn_submit">Enviar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <button id="heading-user"class="card-header btn btn-link collapsed btn-block" type="button" data-toggle="collapse" data-target="#collapse-user3" aria-expanded="false" aria-controls="collapse-user">
                                    <p>Desactivar</p>
                                    </button>
                                    <div id="collapse-user3" class="collapse" aria-labelledby="heading-user" data-parent="#accordion_user">
                                        <div class="card-body">
                                            <form action=<c:url value="/my_user?option=status"/> method="POST">
                                                <button class="btn btn-lg btn-danger btn-block btn_submit">Desactivar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="footer.jsp" %>