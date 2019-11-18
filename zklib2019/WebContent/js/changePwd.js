function checkStuChangePwd(){
	var oldPwd = document.stuChangePwd.oldPwd.value;
	var newPwd = document.stuChangePwd.newPwd.value;
	var newPwdAgain = document.stuChangePwd.newPwdAgain.value;
	if(oldPwd==""){
		alert("旧密码为空！！！");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}
	/*
	if(oldPwd.trim().length<6){
		alert("旧密码不得包含空格且长度不得小于6位！！！");
		stuChangePwd.oldPwd.value="";
		stuChangePwd.oldPwd.focus();
		return;
	}*/
	if(newPwd==""){
		alert("新密码为空！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	/*
	if(newPwd.trim().length<6){
		alert("新密码不得包含空格且长度不得小于6位！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}*/
	if(newPwd!=newPwdAgain){
		alert("两次输入密码不一致！！！");
		stuChangePwd.newPwd.value="";
		stuChangePwd.newPwdAgain.value="";
		stuChangePwd.newPwd.focus();
		return;
	}
	document.changePwd.submit();			   
}