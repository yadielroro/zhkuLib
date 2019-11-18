<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册校外用户</title>
</head>
<body>
<div id="content">
<form action="${pageContext.request.contextPath}/register.action"
						method="post">
   <h3>校外用户注册hddh</h3><br/>
   <label>账号 </label><input type="text" name="sid" /><br>
   <label>密码 </label><input type="password" name="spwd" /><br>
   <label>姓名 </label><input type="text" name="sname" /><br><br>
   <input type="submit" value="提交"/>
   <input type="reset" value="重置"/>
</form>
</div>
</body>
</html>