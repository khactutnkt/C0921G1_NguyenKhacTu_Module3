<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Furama</title>
</head>
<body>
<center>
    <h1>Furama Management</h1>
    <h2>
        <a href="/furama?actionUser=createCustomer">Add New Customer</a>
    </h2>
    <h2>
        <a href="/furama?actionUser=customer">Show Customer List</a>
    </h2>
    <h2>
        <a href="/furama?actionUser=createService">Add New Service</a>
    </h2>
    <h2>
        <a href="/furama?actionUser=createEmployee">Add New Employee</a>
    </h2>
    <h2>
        <a href="/furama?actionUser=employee">Show Employee List</a>
    </h2>
    <h2>
        <a href="/furama?actionUser=createContract">Add New Contract</a>
    </h2>
    <h2>
        <a href="/users?actionUser=createContractDetail">Add New Contract Detail</a>
    </h2>
</center>
</body>
</html>