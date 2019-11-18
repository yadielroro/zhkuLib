<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>罚款记录</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/metisMenu.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- owner CSS -->
<link href="${pageContext.request.contextPath}/css/main_model.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/main_own.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<!-- wrapper start-->
	<div id="wrapper">
		<!-- 导航栏start -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<!-- 导航栏左侧start -->
			<div class="navbar-header">
				<span class="navbar-brand"><a class="back"
					href="${pageContext.request.contextPath }/toMain.action">&lt;</a>
					Hello,${uname}!</span>
			</div>
			<!-- 导航栏左侧end -->

			<!-- 导航栏右侧start -->
			<ul class="nav navbar-top-links navbar-right">
				<!-- 消息通知 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i>新回复 <span
										class="pull-right text-muted small">4分钟之前</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"><strong>查看所有提醒</strong><i
								class="fa fa-angle-right"></i></a></li>
					</ul></li>
				<!-- 消息通知 end -->

				<!-- 用户信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>用户：${uname}</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>修改密码</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"><i
								class="fa fa-sign-out fa-fw"></i>退出登录</a></li>
					</ul></li>
				<!-- 用户信息和系统设置结束 -->
			</ul>
			<!-- 导航栏右侧end -->

			<!-- 左侧列表start-->
			<div class="navbar-default sidebar own_side" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a
							href="${pageContext.request.contextPath}/nowBorrow.action"
							class="side_a_center"><i class="fa fa-edit fa-fw l"></i>当前借阅</a></li>
						<li><a
							href="${pageContext.request.contextPath}/historyBorrow.action"
							class="side_a_center"><i class="fa fa-github"></i>&nbsp;历史借阅</a></li>
						<li><a
							href="${pageContext.request.contextPath}/amerceList.action"
							class="active side_a_center"><i class="fa fa-slack"></i>&nbsp;罚款记录</a></li>
						<li><a
							href="${pageContext.request.contextPath}/orderList.action"
							class="side_a_center"><i class="fa fa-apple"></i>&nbsp;预约记录</a></li>
						<li><a
							href="${pageContext.request.contextPath}/orderBook.action"
							class="side_a_center"><i class="fa fa-weibo"></i>&nbsp;预约图书</a></li>
					</ul>
				</div>
			</div>
			<!-- 左侧列表end-->
		</nav>
		<!-- 导航栏end -->

		<!-- 列表区start-->
		<div id="page-wrapper">

			<!-- 标题栏start -->
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">罚款记录</h2>
				</div>
			</div>
			<!-- 标题栏end -->

			<!-- 列表栏start -->
			<div class="row">
				<!-- table_start -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">罚款项目列表</div>
						<table class="table table-bordered table-striped"
							style="text-align: center">
							<thead>
								<tr>
									<th>罚款编号</th>
									<th>借阅编号</th>
									<th>罚款项目</th>
									<th>罚款金额</th>
									<th>是否支付</th>
									<th>支付时间</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pagemsg.lists}" var="row">
									<tr>
										<td>${row.amerce_id}</td>
										<td>${row.borrow_id}</td>
										<td>${row.item}</td>
										<td>${row.money}</td>
										<td>${row.ispay}</td>
										<td>${row.paytime}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 页码栏start -->
					<div id="pagetable">
						<span class="page_center"> <c:if
								test="${pagemsg.currPage != 1}">
								<a
									href="${pageContext.request.contextPath }/amerceList.action?currentPage=1">[首页]</a>
								<a
									href="${pageContext.request.contextPath }/amerceList.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
							</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
								<a
									href="${pageContext.request.contextPath }/amerceList.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
								<a
									href="${pageContext.request.contextPath }/amerceList.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
							</c:if>
						</span> <span class="page_center">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
					</div>
					<!-- 页码栏end -->
				</div>
				<!-- table_end -->
			</div>
			<!-- 列表栏end -->
		</div>
		<!-- wrapper end-->

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