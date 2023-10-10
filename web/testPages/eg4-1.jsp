<%--
  Created by IntelliJ IDEA.
  User: 19073
  Date: 10/10/2023
  Time: 下午1:57
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP页面基本结构实例</title>
</head>
<body>
<%!int sum=0;
  int x = 1;
%>
<%
  while (x <= 10)
  {
    sum += x;
    ++x;
  }
%>
<p>1加到10的结果是:<%=sum%></p>
<p>现在的时间是:<%=new java.util.Date()%></p>
<p>
  这是一个JSP注释内容<%--dasda--%>
</p>
<p>
  这是一个html注释内容<!-- comment [ <%= 1234 %> ] -->

</p>
</body>
</html>