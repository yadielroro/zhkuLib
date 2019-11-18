<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<style>
div#h {
	background-color: #d60366;
	height: 60px;
}

ul {
	list-style: none;
}

ul.nav {
	padding: 3px 30px;
}

.nav>li {
	float: right;
}

ul a, ul li span {
	display: block;
	text-decoration: none;
	width: 100px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	color: white;
	/*background-color: #2f3e45;*/
}

.drop-down-content>li>a {
	background-color: #d60366;
}

.drop-down {
	position: relative;
}

.drop-down-content {
	padding: 0;
	position: absolute;
	left: 999px;
}

.drop-down-content li:hover a {
	background-color: #950040;
}

.nav .drop-down:hover .drop-down-content {
	left: 0;
}
</style>
</head>
<body>
	<div id="h">
		<ul class="nav">
			<li class="drop-down"><span>用户中心</span>
				<ul class="drop-down-content">
					<li><a href="${pageContext.request.contextPath}/toInformation.action">账号信息</a></li>
					<li><a href="${pageContext.request.contextPath}/logout.action">注销用户</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/toMain.action">返回首页</a></li>
		</ul>
	</div>
</body>
</html>