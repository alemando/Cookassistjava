<%@ include file="header.jsp" %>
        <main role="main">
            <section>
                <div class="container">
                    <div class="col-md-12">
                        <div class="content">
                            <h2>${messages.get("error")}</h2>
                            <a class="btn btn-lg btn-primary btn-block" href=<c:url value="/"/>>${messages.get("ini_back")}</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
<%@ include file="footer.jsp" %>
    
