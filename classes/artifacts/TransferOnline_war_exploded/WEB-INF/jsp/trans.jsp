<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 600px">
    <div align="center">
        <form action="${pageContext.request.contextPath}/account/accountTrans" method="post">
            <h1>转账操作</h1>
            <table>
                <c:if test="${message!=null}">
                    <tr >
                        <td></td>
                        <td>
                            <span style="color: red;">${message.msg}</span>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>转入账号：</td>
                    <td><input type="text" name="account_number"></td>
                </tr>
                <tr>
                    <td>转账金额</td>
                    <td><input type="number" name="transmonney"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="确认转账"></td>
                    <td><input type="reset"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
