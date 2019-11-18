<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookCrud</title>
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
				<h2 class="page-header">图书管理</h2>
			</div>
		</div>

		<!-- 查找和新建栏  -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get"
					action="${pageContext.request.contextPath }/findBookById.action">
					<div class="form-group">
						<label for="bid">图书编号</label> <input type="text"
							class="form-control" id="bid" name="bid" />
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
					<div class="panel-heading">图书信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						style="text-align: center">
						<thead>
							<tr>
								<th>编号</th>
								<th>书名</th>
								<th>作者</th>
								<th>出版社</th>
								<th>ISBN</th>
								<th>入库时间</th>
								<th>价格</th>
								<th>图书状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagemsg.lists}" var="row">
								<tr>
									<td>${row.bid}</td>
									<td>${row.bname}</td>
									<td>${row.author}</td>
									<td>${row.publishment}</td>
									<td>${row.isbn}</td>
									<td>${row.buytime}</td>
									<td>${row.price}</td>
									<td>${row.status}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#editDialog"
										onclick="editBook(${row.bid})">修改</a> <a href="#"
										class="btn btn-danger btn-xs" onclick="deleteBook(${row.bid})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--页码栏 -->
				<div id="pagetable">
					<span> <c:if test="${pagemsg.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/bookList.action?currentPage=1">[首页]</a>
							<a
								href="${pageContext.request.contextPath }/bookList.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
						</c:if> <c:if test="${pagemsg.currPage != pagemsg.totalPage}">
							<a
								href="${pageContext.request.contextPath }/bookList.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
							<a
								href="${pageContext.request.contextPath }/bookList.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
						</c:if>
					</span> <span id="totals">第${pagemsg.currPage }/${pagemsg.totalPage}页</span>
				</div>
			</div>
		</div>

		<!-- 添加图书模态框 -->
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
						<h4 class="modal-title" id="myModalLabel">新增图书信息</h4>
					</div>
					<!-- 内容  -->
					<div class="modal-body">
						<form class="form-horizontal" id="newform">
							<div class="form-group">
								<label for="newBid" class="col-sm-2 control-label"> 编号 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newBid"
										placeholder="请输入编号" name="bid" />
								</div>
							</div>
							<div class="form-group">
								<label for="newBname" class="col-sm-2 control-label"> 书名
								</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newBname"
										placeholder="请输入书名" name="bname" />
								</div>
							</div>
							<div class="form-group">
								<label for="newAuthor" class="col-sm-2 control-label">
									作者 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newAuthor"
										placeholder="请输入作者" name="author" />
								</div>
							</div>
							<div class="form-group">
								<label for="newPublishment" class="col-sm-2 control-label">
									出版社 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newPublishment"
										placeholder="请输入出版社" name="publishment" />
								</div>
							</div>
							<div class="form-group">
								<label for="newIsbn" class="col-sm-2 control-label">
									ISBN </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newIsbn"
										placeholder="请输入ISBN" name="isbn" />
								</div>
							</div>
							<div class="form-group">
								<label for="newBuytime" class="col-sm-2 control-label">
									入库时间 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newBuytime"
										placeholder="请输入入库时间" name="buytime" />
								</div>
							</div>
							<div class="form-group">
								<label for="newPrice" class="col-sm-2 control-label"> 价格
								</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newPrice"
										placeholder="请输入价格" name="price" />
								</div>
							</div>
							<div class="form-group">
								<label for="newStatus" class="col-sm-2 control-label">
									图书状态 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="newStatus"
										placeholder="请输入图书状态" name="status" />
								</div>
							</div>
						</form>
					</div>
					<!-- 脚部  -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="createBook()">确认</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 修改图书模态框 -->
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
						<h4 class="modal-title" id="myModalLabel">修改图书信息</h4>
					</div>
					<!-- 内容  -->
					<div class="modal-body">
						<form class="form-horizontal" id="editform">
							<input type="hidden" id="oldid" name="bid" />
							<div class="form-group">
								<label for="edit_bname" class="col-sm-2 control-label">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_bname"
										placeholder="" name="bname" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_author" class="col-sm-2 control-label">作者</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_author"
										placeholder="" name="author" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_publishment" class="col-sm-2 control-label">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_publishment"
										placeholder="" name="publishment" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_isbn" class="col-sm-2 control-label">ISBN</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_isbn"
										placeholder="" name="isbn" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_buytime" class="col-sm-2 control-label">入库时间</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_buytime"
										placeholder="" name="buytime" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_price" class="col-sm-2 control-label">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_price"
										placeholder="" name="price" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_status" class="col-sm-2 control-label">图书状态</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_status"
										placeholder="" name="status" />
								</div>
							</div>
						</form>
					</div>
					<!-- 脚部  -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="updateBook()">保存修改</button>
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
	    $("#newBid").val("");
	    $("#newBname").val("");
	    $("#newAuthor").val("");
	    $("#newPublishment").val("");
	    $("#newIsbn").val("");
	    $("#newBuytime").val("");
	    $("#newPrice").val("");
	    $("#newStatus").val("");
	}
	// 创建新的
	function createBook() {
	$.post("${pageContext.request.contextPath}/createBook.action",
	$("#newform").serialize(),function(data){
	        if(data =="OK"){
	            alert("图书创建成功！");
	            window.location.reload();
	        }else{
	            alert("图书创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的信息
	function editBook(bid) {
		if(bid<9){bid=""+"0"+bid;}
		console.log(typeof(bid));
	    $.ajax({
	        type:"get",
	        url:"${pageContext.request.contextPath}/getBookById.action",
	        data:{"bid":bid},
	        success:function(data) {
	        	$("#oldid").val(data.bid);
	            $("#edit_bname").val(data.bname);
	            $("#edit_author").val(data.author);
	            $("#edit_publishment").val(data.publishment);
	            $("#edit_isbn").val(data.isbn);
	            $("#edit_buytime").val(data.buytime);
	            $("#edit_price").val(data.price);
	            $("#edit_status").val(data.status);
	        }
	    });
	}
    // 执行修改操作
	function updateBook() {
		$.post("${pageContext.request.contextPath}/updateBook.action",$("#editform").serialize(),function(data){
			if(data =="OK"){
				alert("图书信息更新成功！");
				window.location.reload();
			}else{
				alert("图书信息更新失败！");
				window.location.reload();
			}
		});
	}
    
	// 执行删除操作
	function deleteBook(mid) {
		console.log(typeof mid);
	    if(confirm('确实要删除该图书吗?')) {
	$.post("${pageContext.request.contextPath}/deleteBook.action",{"bid":bid},
	function(data){
	            if(data =="OK"){
	                alert("删除图书成功！");
	                window.location.reload();
	            }else{
	                alert("删除图书失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	</script>
</body>
</html>