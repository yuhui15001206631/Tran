<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/10
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/grade/toGrade?pageNum=1&pageSize=2">班级管理</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/student/toStudent?pageNum=1&pageSize=5">学生管理</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
