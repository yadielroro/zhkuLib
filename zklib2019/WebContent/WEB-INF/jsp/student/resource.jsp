<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆资源</title>
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
				<h2 class="page-header">
					<a class="back"
						href="${pageContext.request.contextPath }/toMain.action">&lt;</a> 资源下载
				</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findSourceByWord.action">
					<div class="form-group">
						<label for="word">资源简介</label> <input type="text"
							class="form-control" id="word" name="word" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
				<a href="#" class="btn btn-primary" data-toggle="modal" id="load"
					data-target="#uploadDialog">上传</a> <a href="#"
					class="btn btn-primary" data-toggle="modal" id="addBtn"
					data-target="#newDialog" onclick="clear()">资源创建</a>
			</div>
		</div>

		<!-- 列表栏  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">资源信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>资源编号</th>
								<th>资源简介</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.souid}</td>
									<td>${row.ssum}</td>
									<!--<td><a href="#" class="btn btn-primary btn-xs"
										onclick="doload({saddress:'${row.saddress}',sformat:'${row.sformat}'})">下载</a>
									</td> -->
									<td>
										<form
											action="${pageContext.request.contextPath }/download.action"
											method="post">
											<input type="hidden" name="saddress" value="${row.saddress}" />
											<input type="hidden" name="sformat" value="${row.sformat}" />
											<input type="submit" class="btn btn-primary btn-xs"
												value="下载">
										</form>
									</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/toResource.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/toResource.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/toResource.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/toResource.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
						</c:if>
					</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
				</div>
			</div>
		</div>

	</div>
	<!-- page-wrapper结束  -->

	<!-- 添加资源模态框 -->
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
					<h4 class="modal-title" id="myModalLabel">上传个人资源</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="newform"
						action="${pageContext.request.contextPath }/addSource.action">
						<div class="form-group">
							<label for="newSouid" class="col-sm-2 control-label"> 编号
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newSouid"
									placeholder="请输入编号" name="souid" />
							</div>
						</div>
						<div class="form-group">
							<label for="newMid" class="col-sm-2 control-label"> 发布者 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newMid"
									placeholder="请输入发布者" name="mid" />
							</div>
						</div>
						<div class="form-group">
							<label for="newSsum" class="col-sm-2 control-label"> 简介 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newSsum"
									placeholder="请输入简介" name="ssum" />
							</div>
						</div>
						<div class="form-group">
							<label for="newSaddress" class="col-sm-2 control-label">
								地址 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newSaddress"
									placeholder="请输入地址" name="saddress" />
							</div>
						</div>
						<div class="form-group">
							<label for="newformat" class="col-sm-2 control-label"> 格式
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newformat"
									placeholder="请输入格式" name="sformat" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createSource()">确认</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 上传资源模态框 -->
	<div class="modal fade" id="uploadDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" method="post"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/upload.action">
						<div class="form-group">
							<div class="col-sm-12">
								<input type="file" name="file" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<input type="submit" class="btn btn-primary" value="上传" />
							</div>
						</div>
					</form>
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
		function clear() {
			$("#newSouid").val("");
			$("#newMid").val("");
			$("#newSsum").val("");
			$("#newSaddress").val("");
			$("#newformat").val("");
		}
		// 创建新的
		function createSource() {
			$.post("${pageContext.request.contextPath}/addSource.action", $(
					"#newform").serialize(), function(data) {
				if (data == "OK") {
					alert("资源创建成功！");
					window.location.reload();
				} else {
					alert("资源创建失败！");
					window.location.reload();
				}
			});
		}
		//使用自定义函数post，下载保存框无法在浏览器显示，需要使用form提交，下面函数废弃 
		function doload(parm) {
			console.log(parm.sformat);
			$.post("${pageContext.request.contextPath}/download.action", {
				"saddress" : parm.saddress,
				"sformat" : parm.sformat
			});
		}
	</script>
</body>
</html>