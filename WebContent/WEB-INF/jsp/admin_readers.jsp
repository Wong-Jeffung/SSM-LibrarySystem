<%@ page import="com.library.pojo.Reader" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<meta charset="utf-8">
    <title>全部读者信息</title>
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
					<h1 class="page-header" style="margin-top: 4%">全部读者</h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/reader/list" method="post">
						<div class="form-group">
							<label for="readerNumber">编号</label> 
							<input type="text" class="form-control" id="readerNumber" value="${readerNumber }" name="readerNumber">
						</div>
						<div class="form-group">
							<label for="readerName">姓名</label> 
							<input type="text" class="form-control" id="readerName" value="${readerName }" name="readerName">
						</div>
						<div class="form-group">
							<label for="readerType">类型</label> 
							<select	class="form-control" id="readerType" placeholder="类型" name="readerType">
								<option value="">--请选择--</option>
								<c:forEach items="${sessionScope.readerTypes}" var="item">
									<option value="${item.number}"<c:if test="${item.number == readerType}">selected</c:if>>${item.name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#readerAddDialog">增加读者</a>
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
                				<th>姓名</th>
                				<th>详情</th>
                				<th>编辑</th>
                				<th>删除</th>
            				</tr>
            				</thead>
            				<tbody>
            					<c:forEach items="${readers}" var="reader">
            					<tr>
									<td><c:out value="${reader.number}"></c:out></td>
                					<td><c:out value="${reader.name}"></c:out></td>
                					<td><a href="#" class="btn btn-success btn-xs" data-toggle="modal" data-target="#readerDetailDialog" onclick="detailReader('${reader.number}')">详情</a></td>
                					<td><a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#readerEditDialog" onclick="editReader('${reader.number}')">编辑</a></td>
                					<td><a href="#" class="btn btn-danger btn-xs" onclick="deleteReader('${reader.number}')">删除</a></td>
            					</tr>
            					</c:forEach>
            				</tbody>
        				</table>
						<%-- <div class="col-md-12 text-right">
							<itheima:page url="${pageContext.request.contextPath }/reader/list.action" />
						</div> --%>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="readerDetailDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">读者信息详情</h4>
					</div>
					<div class="modal-body">
						<fieldset disabled="disabled">
						<form class="form-horizontal" id="detail_reader_form">
							<input type="hidden" id="detail_readerid" name="id"/>
							<div class="form-group">
								<label for="detail_readerName" class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerName" placeholder="姓名" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerType" style="float:left;padding:7px 15px 0 27px;">读者类型</label> 
								<div class="col-sm-10">
									<select	class="form-control" id="detail_readerType" placeholder="读者类型" name="type">
										<option value="">--请选择--</option>
										<c:forEach items="${sessionScope.readerTypes}" var="item">
											<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerNumber" class="col-sm-2 control-label">编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerNumber" placeholder="编号" name="number">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerSex" class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerSex" placeholder="性别" name="sex">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerWordUnit" class="col-sm-2 control-label">工作单位</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerWorkUnit" placeholder="工作单位" name="workunit">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerHomeAddress" class="col-sm-2 control-label">家庭住址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerHomeAddress" placeholder="家庭住址" name="homeaddress">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerTel" class="col-sm-2 control-label">电话号码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerTel" placeholder="电话号码" name="tel">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerEmail" class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerEmail" placeholder="邮箱" name="email">
								</div>
							</div>
							<div class="form-group">
								<label for="detail_readerRemark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="detail_readerRemark" placeholder="备注" name="remark">
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
		<div class="modal fade" id="readerEditDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">编辑读者信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="edit_reader_form">
							<input type="hidden" id="edit_readerid" name="id"/>
							<div class="form-group">
								<label for="edit_readerName" class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerName" placeholder="姓名" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerType" style="float:left;padding:7px 15px 0 27px;">读者类型</label> 
								<div class="col-sm-10">
									<select	class="form-control" id="edit_readerType" placeholder="读者类型" name="type">
										<option value="">--请选择--</option>
										<c:forEach items="${sessionScope.readerTypes}" var="item">
											<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group" >
								<label for="edit_readerNumber" class="col-sm-2 control-label">编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerNumber" placeholder="编号" name="number" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerSex" class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerSex" placeholder="性别" name="sex">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerWordUnit" class="col-sm-2 control-label">工作单位</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerWorkUnit" placeholder="工作单位" name="workunit">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerHomeAddress" class="col-sm-2 control-label">家庭住址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerHomeAddress" placeholder="家庭住址" name="homeaddress">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerTel" class="col-sm-2 control-label">电话号码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerTel" placeholder="电话号码" name="tel">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerEmail" class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerEmail" placeholder="邮箱" name="email">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_readerRemark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_readerRemark" placeholder="备注" name="remark">
								</div>
							</div>
							<p style="text-align: right;color: red;position: absolute" id="editinfo"></p><br/>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="updateReader()">保存修改</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="readerAddDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加读者信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="add_reader_form">
							<input type="hidden" id="add_readerid" name="id" value="5"/>
							<div class="form-group">
								<label for="add_readerName" class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerName" placeholder="姓名" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerType" style="float:left;padding:7px 15px 0 27px;">读者类型</label> 
								<div class="col-sm-10">
									<select	class="form-control" id="add_readerType" placeholder="读者类型" name="type">
										<option value="">--请选择--</option>
										<c:forEach items="${sessionScope.readerTypes}" var="item">
											<option value="${item.number}"<c:if test="${item.number == type}"> selected</c:if>>${item.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group" >
								<label for="add_readerNumber" class="col-sm-2 control-label">编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerNumber" placeholder="编号" name="number">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerSex" class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerSex" placeholder="性别" name="sex">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerWordUnit" class="col-sm-2 control-label">工作单位</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerWorkUnit" placeholder="工作单位" name="workunit">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerHomeAddress" class="col-sm-2 control-label">家庭住址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerHomeAddress" placeholder="家庭住址" name="homeaddress">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerTel" class="col-sm-2 control-label">电话号码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerTel" placeholder="电话号码" name="tel">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerEmail" class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerEmail" placeholder="邮箱" name="email">
								</div>
							</div>
							<div class="form-group">
								<label for="add_readerRemark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_readerRemark" placeholder="备注" name="remark">
								</div>
							</div>
							<p style="text-align: right;color: red;position: absolute" id="addinfo"></p><br/>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="addReader()">保存</button>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	function detailReader(number) {
		$.ajax({
			type:"get",
			url:"<%=basePath%>reader/edit.action",
			data:{"number":number},
			success:function(data) {  
				$("#detail_readerid").val(data.id);
				$("#detail_readerName").val(data.name);
				$("#detail_readerType").val(data.type);
				$("#detail_readerSex").val(data.sex);
				$("#detail_readerWorkUnit").val(data.workunit);
				$("#detail_readerNumber").val(data.number);
				$("#detail_readerHomeAddress").val(data.homeaddress);
				$("#detail_readerTel").val(data.tel);
				$("#detail_readerEmail").val(data.email);
				$("#detail_readerRemark").val(data.remark);
			}
		});
	}
		
		function editReader(number) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>reader/edit.action",
				data:{"number":number},
				success:function(data) {  
					$("#edit_readerid").val(data.id);
					$("#edit_readerName").val(data.name);
					$("#edit_readerType").val(data.type);
					$("#edit_readerSex").val(data.sex);
					$("#edit_readerWorkUnit").val(data.workunit);
					$("#edit_readerNumber").val(data.number);
					$("#edit_readerHomeAddress").val(data.homeaddress);
					$("#edit_readerTel").val(data.tel);
					$("#edit_readerEmail").val(data.email);
					$("#edit_readerRemark").val(data.remark);
				}
			});
		}
		
		function updateReader() {
			$("#editinfo").empty();
		    var readerNumberList = <%=session.getAttribute("readerNumbers")%>; 
			if($("#edit_readerName").val() == ""){
				$("#editinfo").text("提示:姓名不能为空"); 
			}
			if($("#editinfo").text() == ""){
				console.log($("#edit_reader_form").serialize());
				$.post("<%=basePath%>reader/update.action",$("#edit_reader_form").serialize(),function(data){
						alert("读者信息更新成功！");
						/* window.location.reload(); */
						window.location.href="<%=basePath %>reader/list";
					});
			}
		}
		
		function addReader() {
			$("#addinfo").empty();
			console.log($("#add_reader_form").serialize())
			var readerNumberList = <%=session.getAttribute("readerNumbers")%>; 
			if($("#add_readerName").val() == ""){
				$("#addinfo").text("提示:姓名不能为空");
			}else if($("#add_readerNumber").val() == ""){
				$("#addinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<readerNumberList.length;i++){
					if($("#add_readerNumber").val() == readerNumberList[i])
						$("#addinfo").text("提示:该编号已存在");
				}
			}
			if($("#addinfo").text() == ""){
				$.post("<%=basePath%>reader/add.action",$("#add_reader_form").serialize(),function(data){
					alert("读者信息添加成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>reader/list";
				});
			}	
		}
		
		function deleteReader(number) {
			if(confirm('确实要删除该读者吗?')) {
				$.post("<%=basePath%>reader/delete.action",{"number":number},function(data){
					alert("读者删除成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>reader/list";
				});
			}
		}	

	</script>
</body>
</html>