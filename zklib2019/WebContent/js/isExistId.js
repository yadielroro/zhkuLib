function isExistUserName() {
	var userName = document.getElementById("userName").value;
	$
			.ajax({
				type : "POST",
				url : "../user/isExistName.do",
				data : "userName=" + userName,
				success : function(data) {
					if (data == "true") {
						document.getElementById("error").innerHTML = "<font color='red'>"
								+ "用户名已存在！" + "</font>";
					} else {
						document.getElementById("error").innerHTML = "<font color='green'>"
								+ "用户名可以使用！" + "</font>";
					}
				}
			});
}
