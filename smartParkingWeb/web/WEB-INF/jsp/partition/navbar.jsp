<%-- 
    Document   : header
    Created on : Oct 30, 2018, 8:57:58 PM
    Author     : linhph
--%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
        User user = null;
        
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
        }
 %>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">

        <img src="${pageContext.request.contextPath}/resources/images/logoParking.jpg" alt="logo" class="logo img-responsive"
            width="50px" height="45px">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navCollapse">

                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">My Parking</a>
        </div>
        <% if(user !=null) { %>
        <ul class="nav navbar-nav navbar-collapse collapse navCollapse">
            <li><a href="${pageContext.request.contextPath}/ticket/manageTiket">Ticket</a></li>
            <li><a href="${pageContext.request.contextPath}/vehicle/userVehiclePage">Vehicle</a></li>
            <li><a href="${pageContext.request.contextPath}/park/userParkInfor">Park</a></li>
            <li><a href="${pageContext.request.contextPath}/user/buyCoin">Buy Coin</a></li>
        </ul>
        <% } %>

        <!-- Nav right -->
        <ul class="nav navbar-nav navbar-right navbar-collapse collapse navCollapse">
            <% if(user ==null) { %>
            <li><a href="${pageContext.request.contextPath}/login.html?action=signup"><span class="glyphicon glyphicon-user"></span>
                    Sign Up</a></li>
            <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>
                    Login</a></li>

            <% } else { %>
            <li><a href="#">Hi: ${user.getFullname()}</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> My Account<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a class="glyphicon glyphicon-tag" href="${pageContext.request.contextPath}/ticket/manageTiket">
                            Ticket History</a></li>
                    <li><a class="glyphicon glyphicon glyphicon-bed" href="${pageContext.request.contextPath}/vehicle/userVehiclePage">
                            Manage Vehicle</a></li>
                    <li><a class="glyphicon glyphicon-cog" href="${pageContext.request.contextPath}/user/userInfor">
                            Personal Setting</a></li>
                    <li><a class="glyphicon glyphicon glyphicon-info-sign" href="${pageContext.request.contextPath}/park/userParkInfor">
                            Parking Infor</a></li>
                    <li id="logout1"><a class="glyphicon glyphicon-log-out" href="${pageContext.request.contextPath}/login/logout">
                            LogOut</a></li>
                </ul>
            </li>

            <% } %>
        </ul>

        <!-- End nav right -->

    </div>
</nav>