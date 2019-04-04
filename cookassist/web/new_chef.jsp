<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="nav_div_chef.jsp" %>
                <div class="col-md-8" >
                    <div class="content">
                        <form action="<c:url value="/chefs?option=new"/>" class="form-horizontal" method="POST">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>* Email: </label>
                                    <input id="email" class="form-control" type="email" name="email" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>* Nombre: </label>
                                    <input id="name" class="form-control"  type="text" name="name" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>* Contraseña: </label>
                                    <input id="password" class="form-control"  type="password" name="password" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <p id="men_obl">Campos marcados con (*) son obligatorios.</p>
                                    <button class="btn btn-lg btn-primary btn-block btn_submit">Enviar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
    
<%@ include file="footer.jsp" %>