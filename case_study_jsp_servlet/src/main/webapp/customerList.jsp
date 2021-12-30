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
        <a href="/furama?actionUser=createContractDetail">Add New Contract Detail</a>
    </h2>

</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Customers</h2></caption>
        <tr>
            <th>ID</th>
            <th>Type ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>ID Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Adđress</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td><c:out value="${customer.id}"/></td>
                <td><c:out value="${customer.typeId}"/></td>
                <td><c:out value="${customer.name}"/></td>
                <td><c:out value="${customer.birthday}"/></td>
                <td><c:out value="${customer.gender}"/></td>
                <td><c:out value="${customer.idCard}"/></td>
                <td><c:out value="${customer.phone}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <td><c:out value="${customer.address}"/></td>
                <td>
                    <a href="/furama?actionUser=editCustomer&id=${customer.id}">Edit</a>
                    <a href="/furama?actionUser=deleteCustomer&id=${customer.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>