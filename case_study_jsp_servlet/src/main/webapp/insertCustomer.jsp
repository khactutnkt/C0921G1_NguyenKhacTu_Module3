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
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Customer</h2>
            </caption>
            <tr>
                <th>Customer Id:</th>
                <td>
                    <input type="text" name="id" id="id" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Type Id:</th>
                <td>
                    <input type="text" name="typeId" id="typeId" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Birthday:</th>
                <td>
                    <input type="text" name="birthday" id="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Gender:</th>
                <td>
                    <input type="text" name="gender" id="gender" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>