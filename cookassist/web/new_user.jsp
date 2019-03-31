<%@ include file="header.jsp" %>
<main>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 offset-2" >
                    <div class="content">
                        <form action="<c:url value="/register"/>" class="form-horizontal" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>* Email: </label>
                                    <input id="name" class="form-control" type="email" name="name" required>
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