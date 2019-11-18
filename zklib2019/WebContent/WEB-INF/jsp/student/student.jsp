<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
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
<link href="${pageContext.request.contextPath}/css/model.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="head">
		<%@ include file="student_head.jsp"%>
	</div>
	<div id="left">
		<%@ include file="student_left.jsp"%>
	</div>

	<div id="content">
		<div id="page-wrapper">
			<!-- 标题栏  -->
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">资源下载</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">当前借阅列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped"
							style="text-align: center">
							<thead>
								<tr>
									<th>借阅编号</th>
									<th>书名</th>
									<th>作者</th>
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
											onclick="again(${row.sid})">续借</a> <a href="#"
											class="btn btn-danger btn-xs" onclick="lost(${row.sid})">挂失</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!--页码栏 -->
					<div id="pagetable">
						<span> <c:if test="${pagemsg.currPage != 1}">
								<a
									href="${pageContext.request.contextPath }/stuBorrowlist.action?currentPage=1">[首页]</a>
								<a
									href="${pageContext.request.contextPath }/stuBorrowlist.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
							</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
								<a
									href="${pageContext.request.contextPath }/stuBorrowlist.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
								<a
									href="${pageContext.request.contextPath }/stuBorrowlist.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
							</c:if>
						</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
					</div>
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
</body>
</html>