<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#continuebtn").click(function () {
                //location.href=document.referrer;
                location.href="${pageContext.request.contextPath}/account/continuee";
            })
            $("#logout").click(function () {
                location.href="${pageContext.request.contextPath}/account/logout"
            })
        })
    </script>
</head>
<body>
<div style="width: 600px">
    <div align="center">
        <h1>转账成功</h1>
        <table>
            <tr>
                <td><input id="continuebtn" type="button" value="继续操作"></td>
                <td><input id="logout" type="button" value="退出登录"></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
