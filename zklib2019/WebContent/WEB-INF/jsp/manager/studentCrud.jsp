<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>managerCrud</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<!-- owner CSS -->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/crudChange.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="page-wrapper">
		<!-- 标题栏  -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">用户管理</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findStudentById.action">
					<div class="form-group">
						<label for="sid">用户账号</label> <input type="text"
							class="form-control" id="sid" name="sid" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
				<a href="#" class="btn btn-primary" data-toggle="modal" id="addBtn"
					data-target="#newDialog" onclick="clearStudent()">添加</a>
			</div>
		</div>

		<!-- 列表栏：更新和删除  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>账号</th>
								<th>密码</th>
								<th>姓名</th>
								<th>年龄</th>
								<th>性别</th>
								<th>班级</th>
								<th>系别</th>
								<th>借书权限</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.sid}</td>
									<td>${row.spwd}</td>
									<td>${row.sname}</td>
									<td>${row.age}</td>
									<td>${row.gender}</td>
									<td>${row.lesson}</td>
									<td>${row.department}</td>
									<td>${row.permitted}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editStudent(${row.sid})">修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteStudent(${row.sid})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/studentList.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/studentList.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/studentList.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/studentList.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
						</c:if>
					</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
				</div>
			</div>
		</div>

	</div>
	<!-- page-wrapper结束  -->

	<!-- 添加管理员模态框 -->
	<div class="modal fade" id="newDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增用户信息</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="newform">
						<div class="form-group">
							<label for="newSid" class="col-sm-2 control-label">
								账号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newSid"
									placeholder="请输入账号" name="sid" />
							</div>
						</div>
						<div class="form-group">
							<label for="newSpwd" class="col-sm-2 control-label">
								密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newSpwd"
									placeholder="请输入密码" name="spwd" />
							</div>
						</div>
						<div class="form-group">
							<label for="newName" class="col-sm-2 control-label">
								姓名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newName"
									placeholder="请输入姓名" name="sname" />
							</div>
						</div>
						<div class="form-group">
							<label for="newGender" class="col-sm-2 control-label">
								性别 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newGender"
									placeholder="请输入性别" name="gender" />
							</div>
						</div>
						<div class="form-group">
							<label for="newAge" class="col-sm-2 control-label">
								年龄 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newAge"
									placeholder="请输入年龄" name="age" />
							</div>
						</div>
						<div class="form-group">
							<label for="newLesson" class="col-sm-2 control-label">
								班级 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newLesson"
									placeholder="请输入班级" name="lesson" />
							</div>
						</div>
						<div class="form-group">
							<label for="newDepartment" class="col-sm-2 control-label">
								系别 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newDepartment"
									placeholder="请输入系别" name="department" />
							</div>
						</div>
						<div class="form-group">
							<label for="newPermitted" class="col-sm-2 control-label">
								借阅权限 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newPermitted"
									placeholder="请输入借阅权限" name="permitted" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createStudent()">确认</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改客户模态框 -->
	<div class="modal fade" id="editDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改管理员信息</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="editform">
						<input type="hidden" id="oldid" name="sid" />
						<div class="form-group">
							<label for="edit_pwd" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_pwd"
									placeholder="" name="spwd" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_name" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_name"
									placeholder="" name="sname" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_age" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_age"
									placeholder="" name="age" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_gender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_gender"
									placeholder="" name="gender" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_lesson" class="col-sm-2 control-label">班级</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_lesson"
									placeholder="" name="lesson" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_department" class="col-sm-2 control-label">系别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_department"
									placeholder="" name="department" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_permitted" class="col-sm-2 control-label">借阅权限</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_permitted"
									placeholder="" name="permitted" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateStudent()">保存修改</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 外部JavaScript文件导入 -->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/dataTables.bootstrap.min.js"></script>
	<!-- Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.js"></script>

	<!-- owner JavaScript -->
	<script type="text/javascript">
	//清空新建窗口中的数据
	function clearStudent() {
	    $("#newSid").val("");
	    $("#newSpwd").val("");
	    $("#newName").val("");
	    $("#newGender").val("");
	    $("#newAge").val("");
	    $("#newLesson").val("");
	    $("#newDepartment").val("");
	    $("#newPermitted").val("");
	}
	// 创建新的
	function createStudent() {
	$.post("${pageContext.request.contextPath}/createStudent.action",
	$("#newform").serialize(),function(data){
	        if(data =="OK"){
	            alert("学生创建成功！");
	            window.location.reload();
	        }else{
	            alert("学生创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的信息
	function editStudent(sid) {
	    $.ajax({
	        type:"get",
	        url:"${pageContext.request.contextPath}/getStudentById.action",
	        data:{"sid":sid},
	        success:function(data) {
	        	$("#oldid").val(data.sid);
	            $("#edit_pwd").val(data.spwd);
	            $("#edit_name").val(data.sname);
	            $("#edit_age").val(data.age);
	            $("#edit_gender").val(data.gender);
	            $("#edit_lesson").val(data.lesson);
	            $("#edit_department").val(data.department);
	            $("#edit_permitted").val(data.permitted);
	        }
	    });
	}
    // 执行修改操作
	function updateStudent() {
		$.post("${pageContext.request.contextPath}/updateStudent.action",$("#editform").serialize(),function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
    
	// 执行删除操作
	function deleteStudent(sid) {
		console.log(typeof sid);
	    if(confirm('确实要删除该学生吗?')) {
	$.post("${pageContext.request.contextPath}/deleteStudent.action",{"sid":sid},
	function(data){
	            if(data =="OK"){
	                alert("删除学生成功！");
	                window.location.reload();
	            }else{
	                alert("删除学生失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>

</body>
</html>