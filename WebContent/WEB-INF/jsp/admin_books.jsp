<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<meta charset="utf-8">
    <title>全部图书信息</title>
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">  
    <script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js" ></script>  
    <style>
        body{
            background-color: rgb(240,242,245);
        } 
    </style>
</head>
<body>

<nav  style="position:fixed;z-index: 999;width: 100%;background-color: #fff" class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="<%=basePath %>admin_main.html">图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        图书管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath %>book/list">全部图书</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=basePath %>booktype/list">图书类型</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        读者管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath %>reader/list">全部读者</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=basePath %>readertype/list">读者类型</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        借还管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath %>record/list">借还日志</a></li>
                    </ul>
                </li>
                <li >
                    <a href="<%=basePath %>book/list" >
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=basePath %>login.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.id}，已登录</a></li>
                <li><a href="<%=basePath %>logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</nav>


<!-- <div style="padding: 70px 550px 10px">
    <form   method="post" action="querybook.html" class="form-inline"  id="searchform">
        <div class="input-group">
           <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        function mySubmit(flag){
            return flag;
        }
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''){
                alert("请输入关键字");
                return mySubmit(false);
            }
        })
    </script>
</div>-->
<%-- <div style="position: relative;top: 10%">
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${error}
    </div>
</c:if>
</div> --%>
<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="margin-top: 4%">全部图书</h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/book/list" method="post">
						<div class="form-group">
							<label for="bookName">书名</label> 
							<input type="text" class="form-control" id="bookName" value="${bookName }" name="bookName">
						</div>
						<div class="form-group">
							<label for="bookType">类型</label> 
							<select	class="form-control" id="bookType" placeholder="类型" name="bookType">
								<option value="">--请选择--</option>
								<c:forEach items="${sessionScope.bookTypes}" var="item">
									<option value="${item.number}"<c:if test="${item.number == bookType}">selected</c:if>>${item.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="bookType">出版社</label> 
							<input type="text" class="form-control" id="bookPress" value="${bookPress }" name="bookPress">
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#bookAddDialog">增加图书</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<table class="table table-hover">
            				<thead>
            				<tr>
            					<th>编号</th>
                				<th>书名</th>
                				<th>作者</th>
                				<th>出版社</th>
                				<th>价格</th>
                				<th>借还</th>
                				<th>详情</th>
                				<th>编辑</th>
                				<th>删除</th>
            				</tr>
            				</thead>
            				<tbody>
            					<c:forEach items="${books}" var="book">
            					<tr>
									<td><c:out value="${book.number}"></c:out></td>
                					<td><c:out value="${book.name}"></c:out></td>
                					<td><c:out value="${book.author}"></c:out></td>
                					<td><c:out value="${book.press}"></c:out></td>
                					<td><c:out value="${book.price}"></c:out></td>
                					<c:if test="${book.isborrow==0}">
                    					<%-- <td><a href="lendbook.html?number=<c:out value="${book.number}"></c:out>"><button type="button" class="btn btn-primary btn-xs">借阅</button></a></td> --%>
                    					<td><a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#lentBookDialog" onclick="transferParmToDialog('${book.number}')">借阅</a></td>
                					</c:if>
                					<c:if test="${book.isborrow==1}">
                    					<%-- <td><a href="returnbook.html?number=<c:out value="${book.number}"></c:out>"><button type="button" class="btn btn-primary btn-xs">归还</button></a></td> --%>
                    					<td><a href="#" class="btn btn-success btn-xs" onclick="returnBook('${book.number}')">归还</a></td>
                					</c:if>
                					<td><a href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#bookDetailDialog" onclick="detailBook('${book.number}')">详情</a></td>
                					<td><a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#bookEditDialog" onclick="editBook('${book.number}')">编辑</a></td>
                					<td><a href="#" class="btn btn-danger btn-xs" onclick="deleteBook('${book.number}')">删除</a></td>
            					</tr>
            					</c:forEach>
            				</tbody>
        				</table>
						<%-- <div class="col-md-12 text-right">
							<itheima:page url="${pageContext.request.contextPath }/customer/list.action" />
						</div> --%>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="bookDetailDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">图书信息详情</h4>
					</div>
					<div class="modal-body">
						<fieldset disabled="disabled">
						<form class="form-horizontal" id="detail_book_form">
							<input type="hidden" id="detail_bookid" name="id"/>
							<div class="form-group">
								<label for="detail_bookName" class="col-sm-2 control-label">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookName" placeholder="书名" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookType" style="float:left;padding:7px 15px 0 27px;">图书类型</label> 
								<div class="col-sm-10">
									<select	class="form-control" id="detail_bookType" placeholder="图书类型" name="type">
										<option value="">--请选择--</option>
										<c:forEach items="${sessionScope.bookTypes}" var="item">
											<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookNumber" class="col-sm-2 control-label">编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookNumber" placeholder="编号" name="number">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookAuthor" class="col-sm-2 control-label">作者</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookAuthor" placeholder="作者" name="author">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookPress" class="col-sm-2 control-label">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookPress" placeholder="出版社" name="press">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookPublicationdate" class="col-sm-2 control-label">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookPublicationdate" placeholder="出版日期" name="publicationdate">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookPrice" class="col-sm-2 control-label">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookPrice" placeholder="价格" name="price">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookPagecount" class="col-sm-2 control-label">总页数</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookPagecount" placeholder="总页数" name="pagecount">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_bookRemark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_bookRemark" placeholder="备注" name="remark">
								</div>
							</div>
						</form>
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="bookEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑图书信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_book_form">
						<!-- 用于editinfo检验 不会传到后台-->
						<input type="hidden" id="bookNumberTemp" name="bookNumberTemp" disabled="disabled"/>
						<input type="hidden" id="edit_bookid" name="id"/>
						<div class="form-group">
							<label for="edit_bookName" class="col-sm-2 control-label">书名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookName" placeholder="书名" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookType" style="float:left;padding:7px 15px 0 27px;">图书类型</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_bookType" placeholder="图书类型" name="type">
									<option value="">--请选择--</option>
									<c:forEach items="${sessionScope.bookTypes}" var="item">
										<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookNumber" placeholder="编号" name="number">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookAuthor" class="col-sm-2 control-label">作者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookAuthor" placeholder="作者" name="author">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookPress" class="col-sm-2 control-label">出版社</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookPress" placeholder="出版社" name="press">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookPublicationdate" class="col-sm-2 control-label">出版日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookPublicationdate" placeholder="出版日期" name="publicationdate">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookPrice" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookPrice" placeholder="价格" name="price">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookPagecount" class="col-sm-2 control-label">总页数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookPagecount" placeholder="总页数" name="pagecount">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookRemark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookRemark" placeholder="备注" name="remark">
							</div>
						</div>
						<p style="text-align: right;color: red;position: absolute" id="editinfo"></p><br/>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateBook()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="bookAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加图书信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_book_form">
						<input type="hidden" id="add_bookid" name="id"/>
						<div class="form-group">
							<label for="add_bookName" class="col-sm-2 control-label">书名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookName" placeholder="书名" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookType" style="float:left;padding:7px 15px 0 27px;">图书类型</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="add_bookType" placeholder="图书类型" name="type">
									<option value="">--请选择--</option>
									<c:forEach items="${sessionScope.bookTypes}" var="item">
										<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookNumber" placeholder="编号" name="number">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookAuthor" class="col-sm-2 control-label">作者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookAuthor" placeholder="作者" name="author">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookPress" class="col-sm-2 control-label">出版社</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookPress" placeholder="出版社" name="press">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookPublicationdate" class="col-sm-2 control-label">出版日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookPublicationdate" placeholder="出版日期" name="publicationdate">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookPrice" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookPrice" placeholder="价格" name="price">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookPagecount" class="col-sm-2 control-label">总页数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookPagecount" placeholder="总页数" name="pagecount">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookRemark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookRemark" placeholder="备注" name="remark">
							</div>
						</div>
						<p style="text-align: right;color: red;position: absolute" id="addinfo"></p><br/>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="addBook()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="lentBookDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">借阅图书</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="lent_book_form">
							<input type="hidden" id="lent_bookNumber" name="bookNumber"/>
							<div class="form-group">
								<label for="lent_readerNumber" class="col-sm-2 control-label">读者编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="lent_readerNumber" placeholder="读者编号" name="readerNumber">
								</div>
							</div>
							<div class="form-group">
								<label for="lent_Remark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="lent_Remark" placeholder="备注" name="remark">
								</div>
							</div>
							<p style="text-align: right;color: red;position: absolute" id="lentinfo"></p><br/>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="lentBook()">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		
	<script type="text/javascript">
		function detailBook(number) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>book/edit.action",
				data:{"number":number},
				success:function(data) {  
					var publicationTime = new Date(data.publicationdate);
					var publicationTimeStr = publicationTime.getFullYear() + '-'
				    + (parseInt(publicationTime.getMonth()) + 1) + '-'
				    + publicationTime.getDate();
					$("#detail_bookid").val(data.id);
					$("#detail_bookName").val(data.name);
					$("#detail_bookType").val(data.type);
					$("#detail_bookAuthor").val(data.author);
					$("#detail_bookPress").val(data.press);
					$("#detail_bookNumber").val(data.number);
					$("#detail_bookPublicationdate").val(publicationTimeStr);
					$("#detail_bookPrice").val(data.price);
					$("#detail_bookPagecount").val(data.pagecount);
					$("#detail_bookRemark").val(data.remark);
				}
			});
		}
		
		function editBook(number) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>book/edit.action",
				data:{"number":number},
				success:function(data) {  
					var publicationTime = new Date(data.publicationdate);
					var publicationTimeStr = publicationTime.getFullYear() + '-'
				    + (parseInt(publicationTime.getMonth()) + 1) + '-'
				    + publicationTime.getDate();
					$("#edit_bookid").val(data.id);
					$("#edit_bookName").val(data.name);
					$("#edit_bookType").val(data.type);
					$("#edit_bookAuthor").val(data.author);
					$("#edit_bookPress").val(data.press);
					$("#edit_bookNumber").val(data.number);
					$("#edit_bookPublicationdate").val(publicationTimeStr);
					$("#edit_bookPrice").val(data.price);
					$("#edit_bookPagecount").val(data.pagecount);
					$("#edit_bookRemark").val(data.remark);
					$("#bookNumberTemp").val(data.number);
				}
			});
		}
		
		function updateBook(number) {
			$("#editinfo").empty();
			var n = 0;
		    var bookNumberList = <%=session.getAttribute("bookNumbers")%>; 
			if($("#edit_bookName").val() == ""){
				$("#editinfo").text("提示:书名不能为空"); 
			}else if($("#edit_bookNumber").val() == ""){
				$("#editinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<bookNumberList.length;i++){
					if($("#edit_bookNumber").val() == bookNumberList[i]){
						n++;
					}   														
				}
			}
			if(n > 0 && $("#edit_bookNumber").val() != $("#bookNumberTemp").val()){
				$("#editinfo").text("提示:该编号已存在");
			}
			if($("#editinfo").text() == ""){
				$.post("<%=basePath%>book/update.action",$("#edit_book_form").serialize(),function(data){
						alert("图书信息更新成功！");
						/* window.location.reload(); */
						window.location.href="<%=basePath %>book/list";
					});
			}
		}
		
		function addBook() {
			$("#addinfo").empty();
			var bookNumberList = <%=session.getAttribute("bookNumbers")%>; 
			if($("#add_bookName").val() == ""){
				$("#addinfo").text("提示:书名不能为空");
			}else if($("#add_bookNumber").val() == ""){
				$("#addinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<bookNumberList.length;i++){
					if($("#add_bookNumber").val() == bookNumberList[i])
						$("#addinfo").text("提示:该编号已存在");
				}
			}
			if($("#addinfo").text() == ""){
				$.post("<%=basePath%>book/add.action",$("#add_book_form").serialize(),function(data){
					alert("图书信息添加成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>book/list";
				});
			}	
		}
		
		function deleteBook(number) {
			if(confirm('确实要删除该图书吗?')) {
				$.post("<%=basePath%>book/delete.action",{"number":number},function(data){
					alert("图书删除成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>book/list";
				});
			}
		}
		
		function transferParmToDialog(number) {
			$("#lent_bookNumber").val(number);
		}
		
		function lentBook(){
			$("#lentinfo").empty();
			var n = 0;
			var readerNumberList = <%=session.getAttribute("readerNumbers")%>; 
			for(var i = 0;i<readerNumberList.length;i++){
				if($("#lent_readerNumber").val() != readerNumberList[i])
					n++;
			}
			console.log(n == readerNumberList.length);
			if(n == readerNumberList.length){
				$("#lentinfo").text("提示:该编号不存在");
			}
			console.log($("#lentinfo").text() == "");
			if($("#lentinfo").text() == ""){
				$.post("<%=basePath%>book/lent.action",$("#lent_book_form").serialize(),function(data){
					alert("图书借阅成功！");
					window.location.href="<%=basePath %>book/list";
				});
			}
		}
		
		function returnBook(number){
			$.post("<%=basePath%>book/return.action",{"bookNumber":number},function(data){
				alert("图书归还成功！");
				window.location.href="<%=basePath %>book/list";
			});
		}
	</script>
</body>
</html>
