<%--
  Created by IntelliJ IDEA.
  User: THIC PC
  Date: 23/12/2021
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter</title>
  <style>
    input{
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<h2>Currency Converter</h2>
<form method="post" action="/convert">
  <label>Rate: </label><br/>
  <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
  <label>USD: </label><br/>
  <input type="text" name="usd" placeholder="USD" value="0"/><br/>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>
