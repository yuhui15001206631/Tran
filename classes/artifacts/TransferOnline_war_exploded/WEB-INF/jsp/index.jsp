<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/15
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <div style="width: 600px">
      <div align="center">

        <form action="${pageContext.request.contextPath}/account/accountLogin" method="post">
          <h1>系统登录</h1>
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
              <td>账号：</td>
              <td><input type="text" name="account_number"></td>
            </tr>
            <tr>
              <td>密码</td>
              <td><input type="password" name="password"></td>
            </tr>
            <tr>
              <td><input type="submit" value="登录"></td>
              <td><input type="reset"></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </body>
</html>
