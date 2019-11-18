<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--link href="${pageContext.request.contextPath}/css/student_left.css"
	rel="stylesheet" type="text/css" /-->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
a, a:hover, a:focus {
	color: #ffffff;
	text-decoration: none;
}

.panel-group {
	background-color: #404040;
	width: 250px;
	height: 600px;
	overflow-y: auto;
}

.panel-group .panel {
	background-color: #404040;
	border: none;
}

.panel-heading {
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
}

.panel-default>.panel-heading {
	border: none;
	color: #ffffff;
	background-color: #505050;
}

.panel-default>.panel-heading>span {
	font-size: 10px;
}

.panel-default>.panel-heading:active, .panel-default>.panel-heading:hover
	{
	background-color: #4a8bc2;
}

.panel-default>.panel-heading>a:hover {
	text-decoration: none;
	background-color: #4a8bc2;
}

.panel-group .panel-heading+.panel-collapse>.panel-body {
	border: none;
}

.panel-body {
	padding: 0px;
}

.nav>li {
	padding: 1px 0px 0px 0px;
}

.nav>li>a {
	text-decoration: none;
	padding: 10px 10px 10px 35px;
}

.nav>li>a:hover, .nav>li>a:focus {
	background-color: #505050;
}
</style>
</head>

<body>
	<div class="panel-group" id="panelContainer">
		<div class="panel panel-default">
			<div id="header1" class="panel-heading" data-toggle="collapse"
				data-target="#sub1" data-parent="#panelContainer">
				<i class="glyphicon glyphicon-list-alt"></i> <a href="#">栏目菜单 1</a>
				<span class="glyphicon glyphicon-triangle-right pull-right"></span>
			</div>
			<div id="sub1" class="collapse panel-collapse">
				<div class="panel-body">
					<ul class="nav">
						<li><a href="#"><span></span>添加栏目1</a></li>
						<li><a href="#">添加栏目2</a></li>
						<li><a href="#">添加栏目3</a></li>
						<li><a href="#">添加栏目4</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div id="header2" class="panel-heading" data-toggle="collapse"
				data-target="#sub2" data-parent="#panelContainer">
				<i class="glyphicon glyphicon-leaf"></i> <a href="#">栏目菜单 2</a> <span
					class="glyphicon glyphicon-triangle-right pull-right"></span>
			</div>
			<div id="sub2" class="collapse panel-collapse">
				<div class="panel-body">
					<ul class="nav">
						<li><a href="#">添加栏目1</a></li>
						<li><a href="#">添加栏目2</a></li>
						<li><a href="#">添加栏目3</a></li>
						<li><a href="#">添加栏目4</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 外部JavaScript文件导入 -->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$(".panel-heading")
					.on(
							"click",
							function(e) {
								var idLength = e.currentTarget.id.length;
								var index = e.currentTarget.id.substr(
										idLength - 1, idLength);
								$("#sub" + index)
										.on(
												'hidden.bs.collapse',
												function() {
													$(e.currentTarget)
															.find("span")
															.removeClass(
																	"glyphicon glyphicon-triangle-bottom");
													$(e.currentTarget)
															.find("span")
															.addClass(
																	"glyphicon glyphicon-triangle-right");
												})
								$("#sub" + index)
										.on(
												'shown.bs.collapse',
												function() {
													$(e.currentTarget)
															.find("span")
															.removeClass(
																	"glyphicon glyphicon-triangle-right");
													$(e.currentTarget)
															.find("span")
															.addClass(
																	"glyphicon glyphicon-triangle-bottom");
												})
							})

			$(".panel-body > .nav > li > a").on("click", function(e) {
				alert(e.currentTarget.textContent);
			});
		});
	</script>

	<!--div id="left">
		<ul>
			<li><a href="${pageContext.request.contextPath}/">当前借阅</a></li>
			<li><a href="${pageContext.request.contextPath}/">历史借阅</a></li>
			<li><a href="${pageContext.request.contextPath}/">丢失记录</a></li>
			<li><a href="${pageContext.request.contextPath}/">罚款记录</a></li>
			<li><a href="${pageContext.request.contextPath}/">欠款状态</a></li>
			<li><a href="${pageContext.request.contextPath}/">挂失状态</a></li>
		</ul>
	</div-->
</body>
</html>

