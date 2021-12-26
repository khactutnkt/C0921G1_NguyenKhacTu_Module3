<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<h3>Simple Calculator</h3>
<form action="/calculator" method="post">
    <div>
        <label style="margin-right: 22px">First operand:</label>
        <input type="text" name="firstOperand">
    </div>
    <div>
        <label style="margin-right: 50px">Operator:</label>
        <select name="operand">
            <option value="+">Summation</option>
            <option value="-">Subtraction</option>
            <option value="*">Multiplication</option>
            <option value="/">Division</option>
        </select>
    </div>
    <div>
        <label style="margin-right: 4px">Second operand:</label>
        <input type="text" name="secondOperand">
    </div>
    <div>
        <input type="submit" value="Calculate">
    </div>
</form>
</body>
</html>
