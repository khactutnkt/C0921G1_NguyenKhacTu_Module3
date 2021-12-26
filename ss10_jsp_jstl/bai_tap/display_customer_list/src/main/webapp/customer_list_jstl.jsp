<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <tr><th colspan="4">Danh sách khách hàng</th></tr>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dayOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.img}" style="width: 60px; height: 50px"></td>
        </tr>
    </c:forEach>


    </table>
</body>
</html>
