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
    <title>全部读者类型信息</title>
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
					<h1 class="page-header" style="margin-top: 4%">全部读者类型</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#readerTypeAddDialog">增加读者类型</a>
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
                				<th>可借书数量</th>
                				<th>借书期限</th>
                				<th>备注</th>
                				<th>编辑</th>
                				<th>删除</th>
            				</tr>
            				</thead>
            				<tbody>
            					<c:forEach items="${readerTypes}" var="readerType">
            					<tr>
									<td><c:out value="${readerType.number}"></c:out></td>
                					<td><c:out value="${readerType.name}"></c:out></td>
                					<td><c:out value="${readerType.borrownumber}"></c:out></td>
                					<td><c:out value="${readerType.borrowterm}"></c:out></td>
                					<td><c:out value="${readerType.remark}"></c:out></td>
                					<td><a href="#" class="btn btn-info btn-xs" data-toggle="modal" data-target="#readerTypeEditDialog" onclick="editReaderType('${readerType.number}')">编辑</a></td>
                					<td><a href="#" class="btn btn-danger btn-xs" onclick="deleteReaderType('${readerType.number}')">删除</a></td>
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
		<div class="modal fade" id="readerTypeEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑读者类型信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_readertype_form">
						<!-- 用于editinfo检验 不会传到后台-->
						<input type="hidden" id="readerTypeNumberTemp" name="readerTypeNumberTemp" disabled="disabled"/>
						<input type="hidden" id="edit_readertypeid" name="id"/>
						<div class="form-group">
							<label for="edit_readerTypeName" class="col-sm-2 control-label">类型名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_readerTypeName" placeholder="类型名称" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_readerTypeNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_readerTypeNumber" placeholder="编号" name="number">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_readerTypeBorrowNumber" class="col-sm-2 control-label">可借书数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_readerTypeBorrowNumber" placeholder="可借书数量" name="borrownumber">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_readerTypeBorrowTerm" class="col-sm-2 control-label">借书期限</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_readerTypeBorrowTerm" placeholder="借书期限" name="borrowterm">
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
					<button type="button" class="btn btn-primary" onclick="updateReaderType()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="readerTypeAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑读者类型信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_readertype_form">
						<input type="hidden" id="add_readertypeid" name="id"/>
						<div class="form-group">
							<label for="add_readerTypeName" class="col-sm-2 control-label">类型名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_readerTypeName" placeholder="类型名称" name="name">
							</div>
						</div>
						<div class="form-group">
							<label for="add_readerTypeNumber" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_readerTypeNumber" placeholder="编号" name="number">
							</div>
						</div>
						<div class="form-group">
							<label for="add_readerTypeBorrowNumber" class="col-sm-2 control-label">可借书数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_readerTypeBorrowNumber" placeholder="可借书数量" name="borrownumber">
							</div>
						</div>
						<div class="form-group">
							<label for="add_readerTypeBorrowTerm" class="col-sm-2 control-label">借书期限</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_readerTypeBorrowTerm" placeholder="借书期限" name="borrowterm">
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
					<button type="button" class="btn btn-primary" onclick="addReaderType()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function editReaderType(number) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>readertype/edit.action",
				data:{"number":number},
				success:function(data) {  
					$("#edit_readertypeid").val(data.id);
					$("#edit_readerTypeName").val(data.name);
					$("#edit_readerTypeNumber").val(data.number);
					$("#edit_readerTypeBorrowNumber").val(data.borrownumber);
					$("#edit_readerTypeBorrowTerm").val(data.borrowterm);
					$("#edit_readerRemark").val(data.remark);
					$("#readerTypeNumberTemp").val(data.number);
				}
			});
		}
		
		function updateReaderType() {
			$("#editinfo").empty();
			var n = 0;
		    var readerTypeList = ${readerTypesJSON}; 
		    console.log(readerTypeList)
			if($("#edit_readerTypeName").val() == ""){
				$("#editinfo").text("提示:名称不能为空"); 
			}else if($("#edit_readerTypeNumber").val() == ""){
				$("#editinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<readerTypeList.length;i++){
					var readerType = readerTypeList[i];
					if($("#edit_readerTypeNumber").val() == readerType.number){
							n++;
						}   														
				}
			}
			if(n > 0 && $("#edit_readerTypeNumber").val() != $("#readerTypeNumberTemp").val()){
				$("#editinfo").text("提示:该编号已存在");
			}
			if($("#editinfo").text() == ""){
				$.post("<%=basePath%>readertype/update.action",$("#edit_readertype_form").serialize(),function(data){
						alert("读者类别信息更新成功！");
						/* window.location.reload(); */
						window.location.href="<%=basePath %>readertype/list";
					});
			}
		}
		
		function addReaderType() {
			$("#addinfo").empty();
			var readerTypeList = ${readerTypesJSON}; 
			if($("#add_readerTypeName").val() == ""){
				$("#addinfo").text("提示:名称不能为空");
			}else if($("#add_readerTypeNumber").val() == ""){
				$("#addinfo").text("提示:编号不能为空");
			}else{
				for(var i = 0;i<readerTypeList.length;i++){
					if($("#add_readerTypeNumber").val() == readerTypeList[i].number)
						$("#addinfo").text("提示:该编号已存在");
				}
			}
			if($("#addinfo").text() == ""){
				$.post("<%=basePath%>readertype/add.action",$("#add_readertype_form").serialize(),function(data){
					alert("读者类别信息添加成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>readertype/list";
				});
			}	
		}
		
		function deleteReaderType(number) {
			if(confirm('确实要删除该读者类型吗?')) {
				$.post("<%=basePath%>readertype/delete.action",{"number":number},function(data){
					alert("读者类型删除成功！");
					/* window.location.reload(); */
					window.location.href="<%=basePath %>readertype/list";
				});
			}
		}

	</script>
</body>
</html>