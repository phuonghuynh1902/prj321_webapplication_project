<%-- 
    Document   : orders
    Created on : Mar 17, 2019, 9:34:40 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Order List</title>
    </head>
    <style>
        body {
            background-color: azure;
        }
        .container {
            width: 80%;
            margin-top: 100px;
            background-color: white;
            border-radius: 50px;
            padding: 40px;
            border: 1px solid black;
        }
    </style>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="admin.jsp">HOME</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="usermng.jsp">User Management</a></li>
                    <li><a href="tourmng.jsp">Tour Management</a></li>
                    <li><a href="newtour.jsp">Create Tour</a></li>
                    <li class="active"><a href="orders.jsp">Order List</a></li>
                </ul>
                <form action="MainController" method="POST">
                    <input type="submit" name="action" value="Logout" class="btn btn-danger navbar-btn"/> 
                </form>
            </div>
        </nav>
        <div class="container">
            <h1>Order List</h1>
            <h3>Search</h3>
            <form action="MainController" method="POST" class="form-inline">
                <div class="form-group">
                    <label for="search">Username:</label>
                    <input type="text" name="search" class="form-control" id="search"/>
                </div>
                <div>
                    <input type="hidden" name="action" value="Search Order"/>
                    <input type="submit" value="Search" class="btn btn-primary"/>
                </div>
            </form>
            <br/>
            <c:if test="${requestScope.ORDER != null}">
                <c:if test="${not empty requestScope.ORDER}" var="checkData">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Username</th>
                                <th>Order ID</th>
                                <th>Tour ID</th>
                                <th>Tour Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Buy Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.ORDER}" var="dto" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${dto.username}</td>
                                    <td>${dto.id}</td>
                                    <td>${dto.tourid}</td>
                                    <td>${dto.name}</td>
                                    <td>${dto.quan}</td>
                                    <td>${dto.price}</td>
                                    <td>${dto.date}</td>
                                    <td>${dto.status}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${!checkData}">
                    No record found
                </c:if>
            </c:if>
        </div>

    </body>
</html>
