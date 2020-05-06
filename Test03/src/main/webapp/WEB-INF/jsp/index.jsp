<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2020/4/27
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
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
        <th>省份</th>
        <th>疑是</th>
        <th>感染</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${numList}" var="numList">
            <tr>
                <td>${numList.provinceName}</td>
                <td>${numList.doubtNum}</td>
                <td>${numList.illNum}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<a href="/address/province">省查询</a>
<a href="/address/city">市查询</a>
<a href="/address/county">县查询</a>
<a href="/address/hospital">医院查询</a>
<a href="/address/addList">添加</a>

</body>
</html>
