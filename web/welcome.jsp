<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 25/9/2023
  Time: 上午2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <%=session.getAttribute("username")%>登陆成功
 <table>
     <c:forEach items="${user}" var="u">
         <tr>
             <td>${u.uid}</td>
             <td>${u.username}</td>
             <td>${u.password}</td>
         </tr>
     </c:forEach>
 </table>
</body>
</html>
