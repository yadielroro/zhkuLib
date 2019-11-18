<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仲恺图书馆管理端_登录</title>
<link href="${pageContext.request.contextPath}/css/mlogin.css"
	type=text/css rel=stylesheet>

</head>

<body>
	<div id="father">

		<img src="${pageContext.request.contextPath}/images/icon.png" id="pic" />

		<form action="${pageContext.request.contextPath}/mlogin.action" method="post">
			<h4>Administration Entry in ZhkuLib</h4>
			<input type="text" name="mid" placeholder="请输入你的账号" class="box mid" /><br />
			<input type="password" name="mpwd" placeholder="请输入你的密码"
				class="box mpwd" /><br /> <input type="submit" value="登 录"
				class="btn" /> <input type="reset" value="重 置" class="btn" />
		</form>
	</div>
</body>
</html>