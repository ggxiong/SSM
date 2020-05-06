<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/27
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>患者名称</th>
        <th>患者年龄</th>
        <th>症状</th>
        <th>医院/社康名称</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${patientByHospital}" var="hospital">
        <tr>
            <td>${hospital.name}</td>
            <td>${hospital.age}</td>
            <td>${hospital.symptom}</td>
            <td>${hospital.address.province}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>
