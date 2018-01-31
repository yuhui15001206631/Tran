<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/26
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../easyBase.jsp"%>
    <script type="text/javascript">
       $(function () {
           $("#dg").datagrid({
               url:"${pageContext.request.contextPath}/toHobby",
               method:"GET",
               pagination:true,
               striped:true,
               rownumbers:true,
               onLoadSuccess:function () {
                   $(".linkbuttonn").linkbutton();
               },
               toolbar:[
                   {
                      text:"添加",
                       iconCls:"icon-add",
                       handler:function () {
                           $("#addHobbyWindow").window("open");
                       }
                   }
               ],
               columns:[[
                   {field:"hobbyName",title:"爱好名称",width:100},
                   {field:"createTime",title:"创建时间",width:100,formatter:function (value,row,index) {
                       var date=new Date();
                       var Y=date.getFullYear();
                       var M=date.getMonth();
                       var d=date.getDate();
                       var h=date.getHours();
                       var m=date.getMinutes();
                       var s=date.getSeconds();
                       return Y+"-"+M+"-"+d+" "+h+":"+m+":"+s;
                   }},
                   {field:"id",title:"操作",width:150,formatter:function (value,row,index) {
                      var detail="<button class='linkbuttonn'  onclick='queryHobby("+value+")'>查看</button>";
                       var update="<button class='linkbuttonn' onclick='updateHobby("+value+")'>修改</button>";
                       var delate="<button class='linkbuttonn' onclick='dalateHobby("+value+")'>删除</button>";
                       return detail+update+delate;
                   }}
               ]]
           })
           $("#saveAddHobby").click(function () {
               var hoppy=$("#addHoppyForm").serialize();
               var url="${pageContext.request.contextPath}/addHobby";
               $.get(url,hoppy,function (data) {
                   $("#addHoppyForm").form("clear");
                   $("#addHobbyWindow").window("close");
                   $("#dg").datagrid("reload");
               })
           })
       })
       function queryHobby(id) {
           alert(id);
       }
       function updateHobby(id) {
           alert("id");
       }
    </script>
</head>
<body>
    <table id="dg"></table>
    <div id="addHobbyWindow" class="easyui-window" style="width: 500px;height: 300px;padding: 60px 110px" closed="true">
        <form id="addHoppyForm">
            <table>
                <tr>
                    <td>爱好名称：</td>
                    <td><input class="easyui-textbox" name="hobbyName"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="提交" id="saveAddHobby"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
