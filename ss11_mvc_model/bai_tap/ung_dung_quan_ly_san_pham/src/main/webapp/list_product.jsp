<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <H1>Products: </H1>
    <p>
        <a href="/products?actionUser=create">Create new product</a>
    </p>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items='${requestScope["productList"]}' var="product">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getQuantity()}</td>
                <td>${product.getCountry()}</td>
                <td><a href="/products?actionUser=edit&id=${product.getId()}">Edit</a></td>
                <td><a href="/products?actionUser=delete&id=${product.getId()}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
