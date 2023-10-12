<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 25/9/2023
  Time: 上午2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <form id="exportForm" class="big-contain" action="User" method="post">
    <input name="username" type="text" value="${User.username}">
    <input name="password" type="text" value="${User.password}">
    <input name="email" type="text" value="${User.email}">
    <input name="phone" type="text" value="${User.phone}">
    <input type="hidden" id="event" name="event" value="update"/>
    <button>修改</button>
  </form>
  </body>
</html>
