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
				<h2 class="page-header">账号管理</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findManagerById.action">
					<div class="form-group">
						<label for="mid">管理员账号</label> <input type="text"
							class="form-control" id="mid" name="mid" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
				<a href="#" class="btn btn-primary" data-toggle="modal" id="addBtn"
					data-target="#newDialog" onclick="clearManager()">添加</a>
			</div>
		</div>

		<!-- 列表栏：更新和删除  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">管理员信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>管理员账号</th>
								<th>管理员密码</th>
								<th>管理员等级</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.mid}</td>
									<td>${row.mpwd}</td>
									<td>${row.level}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editManager(${row.mid})">修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteManager(${row.mid})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/list.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/list.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/list.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/list.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
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
					<h4 class="modal-title" id="myModalLabel">新增管理员信息</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="newform">
						<div class="form-group">
							<label for="new_managerId" class="col-sm-2 control-label">
								新账号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_managerId"
									placeholder="请输入管理员账号" name="mid" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_managerPwd" class="col-sm-2 control-label">
								新密码 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_managerPwd"
									placeholder="请输入管理员密码" name="mpwd" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createManager()">确认</button>
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
						<input type="hidden" id="oldid" name="mid" />
						<div class="form-group">
							<label for="edit_id" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_id"
									placeholder="" name="mpwd" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateManager()">保存修改</button>
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
	//清空新建管理员窗口中的数据
	function clearManager() {
	    $("#new_managerId").val("");
	    $("#new_managerPwd").val("");
	}
	// 创建管理员
	function createManager() {
	$.post("${pageContext.request.contextPath}/createManager.action",
	$("#newform").serialize(),function(data){
	        if(data =="OK"){
	            alert("管理员创建成功！");
	            window.location.reload();
	        }else{
	            alert("管理员创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	function editManager(mid) {
	    $.ajax({
	        type:"get",
	        url:"${pageContext.request.contextPath}/getManagerById.action",
	        data:{"mid":mid},
	        success:function(data) {
	            $("#edit_id").val(data.mpwd);
	            $("#oldid").val(data.mid);
	        }
	    });
	}
    // 执行修改客户操作
	function updateManager() {
		$.post("${pageContext.request.contextPath}/updateManager.action",$("#editform").serialize(),function(data){
			if(data =="OK"){
				alert("管理员信息更新成功！");
				window.location.reload();
			}else{
				alert("管理员信息更新失败！");
				window.location.reload();
			}
		});
	}
    
	// 删除客户
	function deleteManager(mid) {
		console.log(typeof mid);
	    if(confirm('确实要删除该客户吗?')) {
	$.post("${pageContext.request.contextPath}/deleteManager.action",{"mid":mid},
	function(data){
	            if(data =="OK"){
	                alert("删除管理员成功！");
	                window.location.reload();
	            }else{
	                alert("删除管理员失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>

</body>
</html>