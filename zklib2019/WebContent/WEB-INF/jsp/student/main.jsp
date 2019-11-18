<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仲恺大学图书馆</title>
<link href="${pageContext.request.contextPath}/css/all.css"
	type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/header.css"
	type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/section.css"
	type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/footer.css"
	type=text/css rel=stylesheet>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/js/setTab.js"></script>
</head>
<body>
	<header>
		<div>
			<img id="icon"
				src="${pageContext.request.contextPath}/images/icon.png" />
		</div>
		<div id="nav">
			<ul>
				<li id="b"><a
					href="${pageContext.request.contextPath}/toResource.action">资源</a></li>
				<li id="c"><a
					href="${pageContext.request.contextPath}/toService.action">服务</a></li>
				<li id="d"><a
					href="${pageContext.request.contextPath}/toSummary.action">概况</a></li>
				<li id="e"><a
					href="${pageContext.request.contextPath}/toAllBook.action">书库</a></li>
			</ul>
		</div>
	</header>

	<section class="first">
		<img id="table"
			src="${pageContext.request.contextPath}/images/table.png" />
		<div id="Tab">
			<div class="Menubox">
				<ul>
					<li id="one1" onmouseover="setTab('one',1,2)" class="hover">馆藏资料</li>
					<li id="one2" onmouseover="setTab('one',2,2)">我的图书馆</li>
				</ul>
			</div>
			<div class="Contentbox">
				<div id="con_one_1" class="hover">
					<form
						action="${pageContext.request.contextPath}/getBooksByWord.action"
						method="post">
						<h3>馆藏资料</h3>
						<br /> <span class="STYLE2">书籍名目</span> <input type="text"
							id="search_input" name="word" class="info" style="width: 300px;"
							onkeyup="test(this.value,event)"> <img
							src="${pageContext.request.contextPath}/images/check.png"
							class="ci" onclick="submit()" /><br /> <select
							multiple="multiple" id="sel" onchange="test2()"
							style="width: 300px; display: none; margin-left: 94px; color: gray"></select>
					</form>
				</div>

				<div id="con_one_2" style="display: none">
					<form action="${pageContext.request.contextPath}/login.action"
						method="post">
						<h3>我的图书馆</h3>
						<%-- 提示信息--%>
						<span id="message">${msg}</span><br /> <span class="STYLE2">账
							号</span> <input type="text" name="sid" size="20" maxlength="20"
							class="info"><br /> <span class="STYLE2">密 码</span> <input
							type="password" name="spwd" size="20" maxlength="20" class="info"><br />

						<input type="submit" value="登录" id="login" class="btn" /><br />

						<span class="word"><a href="#">忘记密码</a></span> <span class="word"><a
							href="register.jsp">校外注册</a></span>
					</form>
				</div>
			</div>
			<!-- Contentbox -->
		</div>
		<!-- tab -->
	</section>

	<footer>
		<div id="left">
			<p>咨询电话: 020-89013812
			<p>版权所有: 仲恺农业工程学院图书馆&nbsp;&nbsp;&nbsp;&nbsp; 地址:
				广州市白云区钟落潭镇广新路388号&nbsp;&nbsp;&nbsp;&nbsp; 邮编: 510000</p>
			<p>Copyright ©1999-2019 Zhongkai University Library. All rights
				reserved. Powered by Yadiel.</p>
		</div>
	</footer>
</body>
</html>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	function test(word, event) {
		//定义全局变量         
		var sel = document.getElementById("sel");
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax1.action",
			type : "POST",
			dataType : "json",
			//contentType : "application/json;charset=UTF-8",
			//<!-- 向后端传输的数据 -->
			data : {
				word : $("#search_input").val(),
			},
			success : function(result) {
				//<!-- 处理后端返回的数据 -->
				for (var i = 0; i < result.length; i++) {
					//将当前循环满足条件的商品名称生成一个下拉的选项    
					sel.options[i] = new Option(result[i], i);
				}
				//自动设置高度  
				sel.size = result.length;
				//判断是否有满足条件的商品    
				if (result.length > 0) {
					sel.style.display = 'block';
				} else {
					sel.style.display = 'none';
				}
			},
			error : function(result) {
				alert("error");
			}
		});
		//当用户按下上下键时获取相应的值    
		if (event.keyCode == 40) {
			sel.focus();
		}

	};

	function test2() {
		//将选中的下拉列表中的内容添加到输入框中    
		$("#search_input").val($("option:selected").text());
		//输入回车，获取输入框内容焦点    
		$("#sel").keypress(function() {
			$("#search_input").focus();
			$("#search_input").attr("onkeyup", "");
			$("#sel").hide();

		});
		//双击，获取输入框内容焦点    
		$("#sel").click(function() {
			$("#search_input").focus();
			$("#sel").css("display", "none");
		});

	}
</script>