<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset="utf-8">
    <title>CookAssist</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel=icon href=<c:url value="/img/favicon.png"/> sizes="16x16" type="image/png">
    <link rel="stylesheet" type="text/css" href=<c:url value="/css/bootstrap.min.css"/>>
    <link rel="stylesheet" type="text/css" href=<c:url value="/css/style.css"/>>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg fixed-top header_nav">
            <a class="navbar-brand" href=<c:url value="/"/>>
                <img class="cookassist_logo" src=<c:url value="/img/CookAssistLogo.png"/> alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbar1">
                <ul class="navbar-nav mr-auto">
                    <li class="li_nav nav-item active">
                        <a class="btn_nav btn nav-link" href=<c:url value="/"/>>Inicio</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/products"/>>Productos</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/orders"/>>Pedidos</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/bills"/>>Facturas</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/users"/>>Usuarios</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/chefs"/>>Chefs</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/ratings"/>>Calificaciones</a>
                    </li>
                    <c:if test="${empty ListProducts}">
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/ficticious_data"/>>Agregar datos ficticios</a>
                    </li>
                    </c:if>
                </ul>
                <c:if test="${!empty user}">
                    <ul class="navbar-nav ml-auto">
                        <li class="li_nav nav-item dropdown">
                            <a class="btn_nav nav-link dropdown-toggle" href="" id="orderDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Mis pedidos
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="orderDropdown">
                                <h6 class="dropdown-header">Pedido sin ordenar</h6>
                                <c:if test="${empty ListOrderTemp}">
                                    <li class="li_nav nav-item">
                                        <a class="btn_nav btn nav-link" href=<c:url value="/orders?option=temp_order"/>>pedido</a>
                                    </li>
                                </c:if>
                                <a class="dropdown-item" href=<c:url value="/my_user"/>>1</a>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">Pedidos pendientes</h6>
                                <a class="dropdown-item" href=<c:url value="/my_user"/>>2</a>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">Pedidos por pagar</h6>
                                <a class="dropdown-item" href=<c:url value="/my_user"/>>3</a>
                            </div>
                          </li>
                        <li class="li_nav nav-item dropdown">
                            <a class="btn_nav nav-link dropdown-toggle" href=<c:url value="/my_user"/> id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              ${user.getName()}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href=<c:url value="/my_user"/>>Mi usuario</a>
                                <div class="dropdown-divider"></div>
                                <form action=<c:url value="/"/> method="POST">
                                    <button class="dropdown-item" href="#">Cerrar sesion</button>
                                </form>
                            </div>
                          </li>
                    </ul>

                </c:if>
                <c:if test="${empty user}">
                    <ul class="navbar-nav ml-auto">
                        <li class="li_nav nav-item">
                            <a class="btn_nav btn nav-link" href=<c:url value="/login"/>>Iniciar sesion</a>
                        </li>
                    </ul>
                </c:if>
                
            </div>
        </nav>
    </header>