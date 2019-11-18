<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书馆资讯</title>
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
				<h2 class="page-header"><a class="back"
						href="${pageContext.request.contextPath }/toMain.action">&lt;</a> 校园资讯</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findNoticeByWord.action">
					<div class="form-group">
						<label for="word">资讯简介</label> <input type="text"
							class="form-control" id="word" name="word" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>

		<!-- 列表栏  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">资讯信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>资讯编号</th>
								<th>资讯简介</th>
								<th>发布日期</th>
								<th>详细内容</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.nid}</td>
									<td>${row.nsum}</td>
									<td>${row.ndate}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#checkDialog"
										onclick="show('${row.ncontent}')">查看</a></td>
								</tr>
								<!-- data-toggle="modal" data-target="#checkDialog" -->
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/toService.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/toService.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/toService.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/toService.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
						</c:if>
					</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
				</div>
			</div>
		</div>

	</div>
	<!-- page-wrapper结束  -->

	<!-- 查看资讯内容模态框 -->
	<div class="modal fade" id="checkDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详细内容</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body" id="ncontent"></div>
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
		//展示ncontent
		function show(ncontent) {
			$("#ncontent").html(ncontent);
		}
	</script>
</body>
</html>