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
    <title>全部图书类型信息</title>
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
					<h1 class="page-header" style="margin-top: 4%">全部图书类型</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#bookTypeAddDialog">增加图书类型</a>
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
                				<th>类型名字</th>
                				<th>备注</th>
                				<th>编辑</th>
                				<th>删除</th>
            				</tr>
            				</thead>
            				<tbody>
            					<c:forEach items="${bookTypes}" var="bookType">
            					<tr>
									<td><c:out value="${bookType.number}"></c:out></td>
                					<td><c:out value="${bookType.name}"></c:out></td>
                					<td><c:out value="${bookType.remark}"></c:out></td>
                					<td><a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#bookTypeEditDialog" onclick="editBookType('${bookType.number}')">编辑</a></td>
                					<td><a href="#" class="btn btn-danger btn-xs" onclick="deleteBookType('${bookType.number}')">删除</a></td>
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
		<div class="modal fade" id="bookTypeEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑图书类型信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_booktype_form">
						<!-- 用于editinfo检验 不会传到后台-->
						<input type="hidden" id="bookTypeNumberTemp" name="bookTypeNumberTemp" disabled="disabled"/>
						<input type="hidden" id="edit_booktypeid" name="id"/>
						<div class="form-group">
							<label for="edit_bookTypeName" class="col-sm-2 control-label">类型名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookTypeName" placeholder="类型名称" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bookTypeNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bookTypeNumber" placeholder="编号" name="number">
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
					<button type="button" class="btn btn-primary" onclick="updateBookType()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="bookTypeAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加图书类型信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_booktype_form">
						<input type="hidden" id="add_booktypeid" name="id"/>
						<div class="form-group">
							<label for="add_bookTypeName" class="col-sm-2 control-label">类型名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookTypeName" placeholder="类型名称" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="add_bookTypeNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_bookTypeNumber" placeholder="编号" name="number">
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
					<button type="button" class="btn btn-primary" onclick="addBookType()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function editBookType(number) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>booktype/edit.action",
				data:{"number":number},
				success:function(data) {  
					$("#edit_booktypeid").val(data.id);
					$("#edit_bookTypeName").val(data.name);
					$("#edit_bookTypeNumber").val(data.number);
					$("#edit_bookRemark").val(data.remark);
					$("#bookTypeNumberTemp").val(data.number);
				}
			});
		}
		
		function updateBookType() {
			$("#editinfo").empty();
			var n = 0;
		    var bookTypeList = ${bookTypesJSON}; 
		    console.log(bookTypeList)
			if($("#edit_bookTypeName").val() == ""){
				$("#editinfo").text("提示:名称不能为空"); 
			}else if($("#edit_bookTypeNumber").val() == ""){
				$("#editinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<bookTypeList.length;i++){
					var bookType = bookTypeList[i];
					if($("#edit_bookTypeNumber").val() == bookType.number){
							n++;
						}   														
				}
			}
			if(n > 0 && $("#edit_bookTypeNumber").val() != $("#bookTypeNumberTemp").val()){
				$("#editinfo").text("提示:该编号已存在");
			}
			if($("#editinfo").text() == ""){
				$.post("<%=basePath%>booktype/update.action",$("#edit_booktype_form").serialize(),function(data){
						alert("图书类别信息更新成功！");
						/* window.location.reload(); */
						window.location.href="<%=basePath %>booktype/list";
					});
			}
		}
		
		function addBookType() {
			$("#addinfo").empty();
			var bookTypeList = ${bookTypesJSON}; 
			if($("#add_bookTypeName").val() == ""){
				$("#addinfo").text("提示:名称不能为空");
			}else if($("#add_bookTypeNumber").val() == ""){
				$("#addinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<bookTypeList.length;i++){
					if($("#add_bookTypeNumber").val() == bookTypeList[i].number)
						$("#addinfo").text("提示:该编号已存在");
				}
			}
			if($("#addinfo").text() == ""){
				$.post("<%=basePath%>booktype/add.action",$("#add_booktype_form").serialize(),function(data){
					alert("图书类别信息添加成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>booktype/list";
				});
			}	
		}
		
		function deleteBookType(number) {
			if(confirm('确实要删除该图书类型吗?')) {
				$.post("<%=basePath%>booktype/delete.action",{"number":number},function(data){
					alert("图书类型删除成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>booktype/list";
				});
			}
		}

	</script>
</body>
</html>