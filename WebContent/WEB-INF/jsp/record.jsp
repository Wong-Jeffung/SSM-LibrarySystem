<%@ page import="com.library.pojo.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<meta charset="utf-8">
    <title>借阅记录</title>
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
		                <li><a href="login.html"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.id}，已登录</a></li>
		                <li><a href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
		            </ul>
		        </div>
		    </div>
		</nav>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="margin-top: 4%">借阅记录</h1>
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
                				<th>读者编号</th>
                				<th>书籍编号</th>
                				<th>借出时间</th>
                				<th>归还时间</th>
                				<th>备注</th>
            				</tr>
            				</thead>
            				<tbody>
            					<c:forEach items="${records}" var="record">
            					<tr>
									<td><c:out value="${record.id}"></c:out></td>
                					<td><c:out value="${record.readerNumber}"></c:out></td>
                					<td><c:out value="${record.bookNumber}"></c:out></td>
                					<td><fmt:formatDate value="${record.borrowDate}" pattern="yyyy-MM-dd"/></td>
                					<td><fmt:formatDate value="${record.returnDate}" pattern="yyyy-MM-dd"/></td>
                					<td><c:out value="${record.remark}"></c:out></td>
            					</tr>
            					</c:forEach>
            				</tbody>
        				</table>
					</div>
				</div>
			</div>
		</div>
</body>