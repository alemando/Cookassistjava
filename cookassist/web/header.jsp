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
                        <a class="btn_nav btn nav-link" href=<c:url value="/"/>>${messages.get("ini_title")}</a>
                    </li>
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/products"/>>${messages.get("product_title")}</a>
                    </li>
                    <c:if test="${!empty user}">
                        <li class="li_nav nav-item">
                            <a class="btn_nav btn nav-link" href=<c:url value="/orders"/>>${messages.get("order_title")}</a>
                        </li>
                        <li class="li_nav nav-item">
                            <a class="btn_nav btn nav-link" href=<c:url value="/bills"/>>${messages.get("bill_title")}</a>
                        </li>
                        <c:if test="${user.getAdmin() and !chef}">
                            <li class="li_nav nav-item">
                                <a class="btn_nav btn nav-link" href=<c:url value="/users"/>>${messages.get("user_title")}</a>
                            </li>
                            <li class="li_nav nav-item">
                                <a class="btn_nav btn nav-link" href=<c:url value="/chefs"/>>${messages.get("chef_title")}</a>
                            </li>
                        </c:if>
                    </c:if>
                    <c:if test="${empty ListProducts}">
                    <li class="li_nav nav-item">
                        <a class="btn_nav btn nav-link" href=<c:url value="/ficticious_data"/>>${messages.get("add_ficticious")}</a>
                    </li>
                    </c:if>
                </ul>
                <c:if test="${!empty user}">
                    <ul class="navbar-nav ml-auto">
                        <c:if test="${!chef}">
                        <li class="li_nav nav-item dropdown">
                            <a class="btn_nav nav-link dropdown-toggle" href="" id="orderDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${messages.get("my_orders")}
                                
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="orderDropdown">
                                <h6 class="dropdown-header">${messages.get("act_order")}</h6>
                                <c:if test="${!empty ListProductTemp}">
                                    <a class="dropdown-item" href=<c:url value="/orders?option=new"/>>${messages.get("my_order")}</a>
                                </c:if>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">${messages.get("order_inp")} </h6>
                                <c:forEach items="${user.getListOrders()}" var="order">
                                    <a class="dropdown-item" href=<c:url value="/orders?id="/>${order.value.getCode()}>${messages.get("order_n")} ${order.value.getCode()}</a>
                                </c:forEach>
                            </div>
                        </li>
                        </c:if>
                        <li class="li_nav nav-item dropdown">
                            <a class="btn_nav nav-link dropdown-toggle" href=<c:url value="/my_user"/> id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <c:if test="${chef}">${messages.get("chef")}</c:if>
                                ${user.getName()}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href=<c:url value="/my_user"/>>${messages.get("my_user")}</a>
                                
                                <c:if test="${user.getClass().name eq 'models.Chef'}">
                                    <c:if test="${user.getStatusChef()}">
                                        <div class="dropdown-divider"></div>
                                        <form action=<c:url value="/?option=chef"/> method="POST">
                                            <button class="dropdown-item" href="#">${messages.get("way_ini")}</button>
                                        </form>
                                    </c:if>
                                </c:if>
                                <div class="dropdown-divider"></div>
                                <form action=<c:url value="/"/> method="POST">
                                    <button class="dropdown-item" href="#">${messages.get("close_session")} </button>
                                </form>
                            </div>
                          </li>
                    </ul>

                </c:if>
                <c:if test="${empty user}">
                    <ul class="navbar-nav ml-auto">
                        <li class="li_nav nav-item">
                            <a class="btn_nav btn nav-link" href=<c:url value="/login"/>>${messages.get("login")}</a>
                        </li>
                    </ul>
                </c:if>
                
            </div>
        </nav>
    </header>