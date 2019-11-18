<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/js/changePwd.js"></script>
</head>
<body>
	<%
		String uname = (String) session.getAttribute("uname");
	%>
	<div>
		<p>
			<%
				out.print(uname);
			%>的资料卡
		</p>
		<p id="sid">账号：${sid}</p>
		<p id="sname">姓名：${sname}</p>
		<p id="age">年龄：${age}</p>
		<p id="gender">性别：${gender}</p>
		<p id="lesson">班级：${lesson}</p>
		<p id="department">院系：${department}</p>
		<p id="permitted">借阅权限：${permitted}</p>
		<form action="${pageContext.request.contextPath}/changePwd.action"
			name="changePwd">
			<span>请输入原密码</span><input type="password" name="oldPwd"><br>
			<span>请输入新密码</span><input type="password" name="newPwd"><br>
			<span>再收入新密码</span><input type="password" name="newPwdAgain"><br>
			<input type="submit" value="提交" onclick="checkStuChangePwd()" /> <input
				type="reset" value="重置" onclick="reset()" />
		</form>
	</div>
</body>
</html>