<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/26
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../easyBase.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("li>a").click(function () {
                alert("111");
                var title=$(this).text();
                var url=$(this).attr("url");
                var content="<iframe frameborder='0' style='width: 100%;height:100%' src='"+url+"'></iframe>";
                if($("#tt").tabs("exists",title)){
                   $("#tt").tabs("select",title);
                }else{
                    $("#tt").tabs("add",{
                        title:title,
                        content:content,
                        closable:true,
                        selected:true,
                    })
                }
            })
        })
    </script>
</head>
<body>
<div class="easyui-layout" style="width: 100%;height: 100%;">
    <div region="north" style="height: 20%;" >北</div>
    <div region="south" style="height: 20%;" >南</div>
    <div region="west" style="width: 20%;" title="列表">
        <ul>
            <li><a href="#" url="${pageContext.request.contextPath}/hoppy">爱好管理</a></li>
            <li><a href="#" url="${pageContext.request.contextPath}/score">成绩管理</a></li>
        </ul>
    </div>
    <div region="center" >
        <div id="tt" class="easyui-tabs" style="width: 100%;height: 100%;">
            <div title="欢迎"></div>
        </div>
    </div>
</div>
</body>
</html>
