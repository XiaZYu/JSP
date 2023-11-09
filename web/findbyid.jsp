<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 7/11/2023
  Time: 下午6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="Article" method="get" id="form">
    <input type="hidden" id="event" name="id">
</form>
<script>
    window.onload = function () {
        document.getElementById("event").value = <%=request.getParameter("id")%>
        document.getElementById("form").submit();
    }
</script>
</body>
</html>
