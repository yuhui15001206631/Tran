<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/10
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../basic.jsp"%>
    <script>
        $(function () {
            /*分页*/
            $("li>a").click(function () {
                var no=$(this).attr("no")
                var url=location.href.split("?")[0]+"?pageNum="+no;
                location.href=url;
            })
            /*详情*/
            $("button[name='detail']").click(function () {
                var gradeId=$(this).attr("gradeId");

                var url="${pageContext.request.contextPath}/grade/getGradeById";
                $.get(url,{"gradeId":gradeId},function (data) {
                     $("#detailGradeName").html(data.gradeName);
                    $("#detailGradCreateDate").html(data.date);
                    $("#detailGradeDetail").html(data.details);
                })
                $("#detailModel").modal("show");
            })
            /*单条删除*/
           $("button[name='delete']").click(function () {
               var gradeId=$(this).attr("gradeId");
               var url="${pageContext.request.contextPath}/grade/deleteGradeById";
               $.get(url,{"gradeId":gradeId},function (data) {
                   if(confirm("是否要删除这个班级？")){
                       alert(data.msg);
                       location.href = location.href;
                   }
               })
           })
            /*批量删除班级*/
            $("#deleteGradeByIds").click(function () {
                var gradeIds="";
                $.each($("input:checkbox"),function () {
                    if(this.checked){
                       gradeIds=gradeIds+$(this).val()+",";
                    }
                })
                if(gradeIds==""){
                    alert("请选择要删除的班级")
                }else if(confirm("确定要删除班级吗？")){
                    var url="${pageContext.request.contextPath}/grade/deleteGradeByIds";
                    alert(gradeIds);
                    $.get(url,{"gradeIds":gradeIds},function (data) {
                        alert("666");
                         alert(data.msg);
                         location.href = location.href;
                    })
                }
            })
            /*添加班级*/
            $("#addGradeBtn").click(function () {
                $("#addGradeModel").modal("show");
                $("#saveAddGrade").click(function () {
                    var grade =$("#addGradeForm").serialize();
                    var url="${pageContext.request.contextPath}/grade/addGrade";
                    $.post(url,grade,function (data) {
                        alert(data.msg);
                        $("#addGradeModel").modal("hide");
                        location.href=location.href;
                    })
                })
            })
        })
    </script>
</head>
<body>
    <%@include file="../top.jsp"%>

        <div class="row">
            <div class="col-lg-2">
                <%@include file="../left.jsp"%>
            </div>
            <div class="col-lg-8">
                <div>
                    <button type="button" class="btn btn-info btn " id="addGradeBtn">添加</button>
                </div>
                <table class="table table-striped">
                    <tr>
                        <td><input type="button" id="deleteGradeByIds" value="删除"></td>
                        <td>id</td>
                        <td>班级名称</td>
                        <td>创建时间</td>
                        <td>描述</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="grade">
                        <tr>
                            <td><input type="checkbox" name="gradeIds" value="${grade.id}"></td>
                            <td>${grade.id}</td>
                            <td>${grade.gradeName}</td>
                            <td>
                                <fmt:formatDate value="${grade.date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                            <td>${grade.details}</td>
                            <td>
                                <button type="button" class="btn btn-info " name="detail" gradeId="${grade.id}">详情</button>
                                <button type="button" class="btn btn-info btn ">修改</button>
                                <button type="button" class="btn btn-danger btn " name="delete" gradeId="${grade.id}">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="col-lg-10 col-lg-offset-1 ">
                <%@include file="../page.jsp"%>
            </div>
        </div>
    <%--模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="detailModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form action="" id="queryGradeForm">
                        <table class="table table-bordered">
                            <tr>
                                <td>班级名称</td>
                                <td>
                                    <div id="detailGradeName"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>创建时间</td>
                                <td><div id="detailGradCreateDate"></div></td>
                            </tr>
                            <tr>
                                <td>描述</td>
                                <td>
                                    <div id="detailGradeDetail"></div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--添加班级态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="addGradeModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addGradeForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级名称</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control"  name="gradeName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级描述</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control"  name="details">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveAddGrade">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</body>
</html>
