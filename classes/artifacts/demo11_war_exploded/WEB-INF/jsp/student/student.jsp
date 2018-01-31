<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../basic.jsp"%>
    <script TYPE="text/javascript">
        $(function () {
            /*分页跳转*/
            $("li>a").click(function () {
                var pageNum=$(this).attr("no");
                var url=location.href.split("?")[0]+"?pageNum="+pageNum;
                location.href=url;
            })
            /*学生详情*/
            $("button[name=detailsStudentBtn]").click(function () {
                $("#detailStudentModal").modal("show");
                var studentId=$(this).attr("studentId");
                var url="${pageContext.request.contextPath}/student/detailsStudent";
                $.get(url,{"studentId":studentId},function (data) {
                    $("#detailsStudentNum").val(data.studentNum);
                    $("#detailsStudentName").val(data.studentName);
                    $("#detailsStudentGender").val(data.gender);
                    $("#detailsStudentAge").val(data.age);
                    $("#detailsStudentGrade").val(data.grade.gradeName);
                })
            })
            /*查询所有班级*/

            /*添加学生*/
           $("#addStudentBtn").click(function () {
              $("#addStudentModal").modal("show");
              selectAllGrade($("#addStudentSelect"),null);
              $("#saveAddStudent").click(function () {
                  var gradeName=$("#addStudentForm").find("option:selected").text();
                  $("#addStudentSelectGradeName").val(gradeName);
                  var student=$("#addStudentForm").serialize();
                  var url="${pageContext.request.contextPath}/student/addStudent";
                  $.post(url,student,function (data) {
                      alert(data.msg);
                      $("#addStudentModal").modal("hide");
                      location.href=location.href;
                  })
              })
           })
            /*修改学生*/
            $("button[name=updateStudentBtn]").click(function () {
                $("#updateStudentModal").modal("shouw")
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
            <button type="button" class="btn btn-info btn " id="addStudentBtn">添加</button>
        </div>
        <table class="table table-striped">
            <tr>
                <td><input type="button" id="deleteGradeByIds" value="删除"></td>
                <td>id</td>
                <td>学生编号</td>
                <td>学生姓名</td>
                <td>性别</td>
                <td>年龄</td>
                <td>班级</td>
                <td>操作</td>
            </tr>
           <c:forEach items="${pageInfo.list}" var="student">
               <tr>
                   <td><input type="checkbox" studentId="${student.id}"></td>
                   <td>${student.id}</td>
                   <td>${student.studentNum}</td>
                   <td>${student.studentName}</td>
                   <td>${student.gender}</td>
                   <td>${student.age}</td>
                   <td>${student.grade.gradeName}</td>
                   <td>
                       <button type="button" class="btn btn-info "  name="detailsStudentBtn" studentId="${student.id}">详情</button>
                       <button type="button" class="btn btn-info btn " name="updateStudentBtn" studentId="${student.id}">修改</button>
                       <button type="button" class="btn btn-danger btn "  >删除</button>
                   </td>
               </tr>
           </c:forEach>
        </table>
    </div>
    <div class="col-lg-10 col-lg-offset-1 ">
        <%@include file="../page.jsp"%>
    </div>
    <%--学生详情模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="detailStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学生编号</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="detailsStudentNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学生姓名</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="detailsStudentName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="detailsStudentGender">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="detailsStudentAge">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="detailsStudentGrade">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--添加学生模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="addStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addStudentForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学生姓名</label>
                            <div class="col-sm-4">
                                <input type="hidden" class="form-control" id="addStudentNum" name="studentNum">
                                <input type="text" class="form-control" id="addStudentName" name="studentName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="addStudentGender" name="gender">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="addStudentAge" name="age">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="addStudentSelect" name="grade.id">
                                </select>
                                <input type="hidden" id="addStudentSelectGradeName" name="grade.gradeName">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveAddStudent">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--修改学生模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="updateStudentModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updateStudentForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学生编号</label>
                            <div class="col-sm-4">
                                <input type="hidden" class="form-control" id="updateStudentId" name="id">
                                <input type="text" class="form-control" id="updateStudentNum" name="studentNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学生姓名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="updateStudentName" name="studentName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="updateStudentGender" name="gender">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="updateStudentAge" name="age">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="updateStudentSelect" name="grade.id">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="saveupdateStudent">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
 </div>
</body>
</html>
