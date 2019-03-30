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
    <link rel=icon href="<c:url value="/img/favicon.png"/>" sizes="16x16" type="image/png">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md fixed-top header_nav">
            <a class="navbar-brand" href="#">
                <img src="<c:url value="/img/CookAssistLogo.png"/>" width="199" height="44" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbar1">
                <ul class="navbar-nav mr-auto">
                    <li class="li_nav nav-item active">
                        <a class="btn_nav btn nav-link" href="<c:url value="/"/>">Inicio</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/products"/>">Productos</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/orders"/>">Pedidos</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/bills"/>">Facturas</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/users"/>">Usuarios</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/chefs"/>">Chefs</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="<c:url value="/ratings"/>">Calificaciones</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href="#"><i class="fas fa-user"></i> Usuario</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>