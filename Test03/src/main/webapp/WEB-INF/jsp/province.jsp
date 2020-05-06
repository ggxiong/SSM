<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/27
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/patient/patientByProvince" method="post">

    <select name="quiz1">
        <option value="">请选择省</option>

        <c:forEach var="province" items="${province}">
            <option value="${province}" selected="">${province}</option>
        </c:forEach>
    </select>
<input type="submit" value="查询">


</form>





</body>
</html>
