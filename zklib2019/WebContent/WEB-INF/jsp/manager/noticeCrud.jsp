<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sourceCrud</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<!-- owner CSS -->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/crudChange.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="page-wrapper">
		<!-- 标题栏  -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">布告管理</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findNoticeById.action">
					<div class="form-group">
						<label for="nid">布告编号</label> <input type="text"
							class="form-control" id="nid" name="nid" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
				<a href="#" class="btn btn-primary" data-toggle="modal" id="addBtn"
					data-target="#newDialog" onclick="clear()">添加</a>
			</div>
		</div>

		<!-- 列表栏：更新和删除  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">布告信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>编号</th>
								<th>发布者</th>
								<th>简介</th>
								<th>日期</th>
								<th>内容</th>
								<th>图片</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.nid}</td>
									<td>${row.mid}</td>
									<td>${row.nsum}</td>
									<td>${row.ndate}</td>
									<td>${row.ncontent}</td>
									<td>${row.npic}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editNotice(${row.nid})">修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteNotice(${row.nid})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/noticeList.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/noticeList.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/noticeList.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/noticeList.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
						</c:if>
					</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
				</div>
			</div>
		</div>

	</div>
	<!-- page-wrapper结束  -->

	<!-- 添加布告模态框 -->
	<div class="modal fade" id="newDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<!-- 头部  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增布告信息</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="newform">
						<div class="form-group">
							<label for="newNid" class="col-sm-2 control-label"> 编号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newNid"
									placeholder="请输入编号" name="nid" />
							</div>
						</div>
						<div class="form-group">
							<label for="newMid" class="col-sm-2 control-label"> 发布者 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newMid"
									placeholder="请输入发布者" name="mid" />
							</div>
						</div>
						<div class="form-group">
							<label for="newNsum" class="col-sm-2 control-label"> 简介 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newNsum"
									placeholder="请输入简介" name="nsum" />
							</div>
						</div>
						<div class="form-group">
							<label for="newNdate" class="col-sm-2 control-label"> 日期
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newNdate"
									placeholder="请输入日期" name="ndate" />
							</div>
						</div>
						<div class="form-group">
							<label for="newNcontent" class="col-sm-2 control-label">
								内容 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newNcontent"
									placeholder="请输入内容" name="ncontent" />
							</div>
						</div>
						<div class="form-group">
							<label for="newNpic" class="col-sm-2 control-label"> 图片 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="newNpic"
									placeholder="请输入图片" name="npic" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createNotice()">确认</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改布告模态框 -->
	<div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改布告信息</h4>
				</div>
				<!-- 内容  -->
				<div class="modal-body">
					<form class="form-horizontal" id="editform">
						<input type="hidden" id="oldid" name="nid" />
						<div class="form-group">
							<label for="edit_mid" class="col-sm-2 control-label">发布者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mid"
									placeholder="" name="mid" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_nsum" class="col-sm-2 control-label">简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_nsum"
									placeholder="" name="nsum" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ndate" class="col-sm-2 control-label">日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ndate"
									placeholder="" name="ndate" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ncontent" class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ncontent"
									placeholder="" name="ncontent" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_npic" class="col-sm-2 control-label">图片</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_npic"
									placeholder="" name="npic" />
							</div>
						</div>
					</form>
				</div>
				<!-- 脚部  -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateNotice()">保存修改</button>
				</div>
			</div>
		</div>
	</div>

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

	<!-- owner JavaScript -->
	<script type="text/javascript">
	//清空新建窗口中的数据
	function clear() {
	    $("#newNid").val("");
	    $("#newMid").val("");
	    $("#newNsum").val("");
	    $("#newNdate").val("");
	    $("#newNcontent").val("");
	    $("#newNpic").val("");
	}
	// 创建新的
	function createNotice() {
	$.post("${pageContext.request.contextPath}/createNotice.action",
	$("#newform").serialize(),function(data){
	        if(data =="OK"){
	            alert("布告创建成功！");
	            window.location.reload();
	        }else{
	            alert("布告创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的信息
	function editNotice(nid) {
	    $.ajax({
	        type:"get",
	        url:"${pageContext.request.contextPath}/getNoticeById.action",
	        data:{"nid":nid},
	        success:function(data) {
	        	console.log(data);
	        	$("#oldid").val(data.nid);
	            $("#edit_mid").val(data.mid);
	            $("#edit_nsum").val(data.nsum);
	            $("#edit_ndate").val(data.ndate);
	            $("#edit_ncontent").val(data.ncontent);
	            $("#edit_npic").val(data.npic);
	        }
	    });
	}
    // 执行修改操作
	function updateNotice() {
		$.post("${pageContext.request.contextPath}/updateNotice.action",$("#editform").serialize(),function(data){
			if(data =="OK"){
				alert("布告信息更新成功！");
				window.location.reload();
			}else{
				alert("布告信息更新失败！");
				window.location.reload();
			}
		});
	}
    
	// 执行删除操作
	function deleteNotice(nid) {
		console.log(typeof nid);
	    if(confirm('确实要删除该布告吗?')) {
	$.post("${pageContext.request.contextPath}/deleteNotice.action",{"nid":nid},
	function(data){
	            if(data =="OK"){
	                alert("删除布告成功！");
	                window.location.reload();
	            }else{
	                alert("删除布告失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>