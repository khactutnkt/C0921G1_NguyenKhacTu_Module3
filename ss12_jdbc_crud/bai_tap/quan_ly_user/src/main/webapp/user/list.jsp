<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?actionUser=create">Add New User</a>
    </h2>
    <form style="margin-top: 30px" action="/users">
        <input type="text" name="countryName" placeholder="Input name of country">
        <input type="text" name="actionUser" value="findByCountry" hidden>
        <button>Find By Country</button>
    </form>
    <form style="margin-top: 30px" action="/users">
        <input type="text" name="actionUser" value="sort" hidden>
        <select name="sort">
            <option>Ascending</option>
            <option>Descending</option>
        </select>
        <button>Sort</button>
    </form>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?actionUser=edit&id=${user.id}">Edit</a>
                    <a href="/users?actionUser=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>