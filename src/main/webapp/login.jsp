<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/4/13
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="login">
        <input name="username">
        <input type="password" name="password">
        <input type="submit" value="登录">
        ${msg}
    </form>
</body>
</html>
