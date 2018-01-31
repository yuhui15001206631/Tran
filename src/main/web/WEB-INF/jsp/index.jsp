<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/10
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/jquery-easyui-1.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/jquery-easyui-1.5.1/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
     <script type="text/javascript">
       $(function () {
           $("#showwindow").click(function () {
              // alert("11");
               $("#win").window("open");
           })
       })
     </script>
  </head>
  <body>

   <div id="win" class="easyui-window" style="top:20%; left:20%;width:500px;height: 300px;padding: 50px 110px" closed="true">
       <form action="${pageContext.request.contextPath}/user/login" method="post">
         <table>
           <tr>
             <td>用户名：</td>
             <td><input class="easyui-textbox" name="userName"></td>
           </tr>
           <tr>
             <td>密&nbsp;&nbsp;&nbsp;码：</td>
             <td><input class="easyui-passwordbox" name="password"></td>
           </tr>
           <tr>
             <td><input type="submit" class="easyui-linkbutton" style="width: 80px;height: 27px;" value="登录"></td>
             <td><input type="reset" class="easyui-linkbutton" style="width: 80px;height: 27px;" value="重置"></td>
           </tr>
         </table>
       </form>
   </div>
   <button id="showwindow">点我</button>
  </body>
</html>
