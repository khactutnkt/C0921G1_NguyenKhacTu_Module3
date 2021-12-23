<%--
  Created by IntelliJ IDEA.
  User: THIC PC
  Date: 23/12/2021
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculator" method="post">
    <input type="text" name="product" placeholder="Enter name of product: "/>
    <input type="text" name="price" placeholder="Enter list price of product: "/>
    <input type="text" name="percent" placeholder="Enter discount percent: "/>
    <input type = "submit" id = "submit" value = "calculator"/>
  </form>
  <h3>
    Discount Amount: ${discountAmount}
  </h3>
  <h3>
    Discount Price: ${discountPrice}
  </h3>
  </body>
</html>
