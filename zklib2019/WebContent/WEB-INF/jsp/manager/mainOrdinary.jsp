<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>仲恺图书馆管理端_主页</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type=text/css rel=stylesheet>
<style type="text/css">
#content {
	border: 2px #f5f5f5 solid;
	height: 500px;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 50px;
}
/* 导航栏高度调整  */
.navbar {
	height: 70px;
}

#bs-example-navbar-collapse-1, a.navbar-brand {
	margin-top: 10px;
}

span#error {
	margin-left: 5px;
}

.moinput {
	width: 300px;
	height: 30px;
	border: none;
	border: 2px #e5e5e5 solid;
	border-radius: 15px;
	margin: 10px auto;
	padding-left: 10px;
}

span#wordinput {
	margin-left: 70px;
}

.btn {
	margin: 10px 255px;
}
</style>

</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">图书馆管理端</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#"><img
							src="${pageContext.request.contextPath}/images/admin.png" /><span
							class="sr-only">(current)</span></a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">用户管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">添加用户</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/studentList.action">查删改用户</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">图书管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">添加图书</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/bookList.action">查删改图书</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">借阅管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" id="borrowBtn"
								data-target="#borrowDialog">借阅图书</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" data-toggle="modal" id="returnBtn"
								data-target="#returnDialog">归还图书</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/amerce.action">罚款管理</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">布告管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">添加布告</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/noticeList.action">查删改布告</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">资源管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">添加资源</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/sourceList.action">查删改资源</a></li>
						</ul></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">您好！管理员${sessionScope.Mid}<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">修改密码</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">注销</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addmanager" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加普通管理员</h4>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/addManager.action"
						class="moform" method="post">
						<span id="wordinput">账 号： <input type="text"
							placeholder="请输入该新增管理员的账号" name="mid" class="moinput"
							onblur="isExistId()" id="newManager" /></span><span id="error"></span><br>
						<span id="wordinput">密 码：<input type="text"
							placeholder="请输入该新增管理员的密码" name="mpwd" class="moinput" /></span><br>
						<button type="button" class="btn btn-primary" onclick="submit()">提
							交</button>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 借书模态框 -->
	<div class="modal fade" id="borrowDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">图书借阅</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="borrowform">
						<div class="form-group">
							<label for="borrow_sid" class="col-sm-2 control-label">
								账号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="borrow_sid"
									placeholder="请输入借书人账号" name="sid" />
							</div>
						</div>
						<div class="form-group">
							<label for="borrow_bid" class="col-sm-2 control-label">
								书号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="borrow_bid"
									placeholder="请输入图书编号" name="bid" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="borrow()">提
						交</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 还书模态框 -->
	<div class="modal fade" id="returnDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">图书归还</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="returnform">
						<div class="form-group">
							<label for="return_bid" class="col-sm-2 control-label">
								书号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="return_bid"
									placeholder="请输入图书编号" name="bid" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="returns()">提交</button>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function isExistId() {
			var mid = document.getElementById("newManager").value;
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/isExistId.action",
						data : "mid=" + mid,
						success : function(data) {
							if (data == "true") {
								document.getElementById("error").innerHTML = "<font color='red'>"
										+ "该ID已存在！" + "</font>";
							} else {
								document.getElementById("error").innerHTML = "<font color='green'>"
										+ "该ID可以使用!" + "</font>";
							}
						}
					});
		}

		function borrow() {
			$.post("${pageContext.request.contextPath}/borrow.action", $(
					"#borrowform").serialize(), function(data) {
				console.log(data);
				if (data == "OK") {
					alert("借阅成功！");
					window.location.reload();
				} else {
					alert(data + "!");
					window.location.reload();
				}
			});
		}

		function returns() {
			$.post("${pageContext.request.contextPath}/returns.action", $(
					"#returnform").serialize(), function(data) {
				console.log(data);
				if (data == "OK") {
					alert("归还成功！");
					window.location.reload();
				} else {
					alert(data);
					window.location.reload();
				}
			});
		}
	</script>
</body>
</html>