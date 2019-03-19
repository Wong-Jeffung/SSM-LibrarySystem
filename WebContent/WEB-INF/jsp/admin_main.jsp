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
    <title>管理主页</title>
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
    <script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js" ></script> 
    <style>
        body{
            /* margin: 0;
            padding: 0;
            overflow: visible;
            background-color: rgb(240,242,245); */
            background-image: url("images/1.jpg");  
  			background-position: center 0;  
  			background-repeat: no-repeat;  
  			background-attachment: fixed;  
  			background-size: cover;  
  			-webkit-background-size: cover;  
  			-o-background-size: cover;  
  			-moz-background-size: cover;  
  			-ms-background-size: cover; 
        }
       /*  #newsa{
            width:500px;
            height: 200px;
            position: fixed;
            left: 35%;
            top:30%;
        } */
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


<!-- 模态框（Modal） -->
<%-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    温馨提示
                </h4>
            </div>
            <div class="modal-body">
                使用结束后请安全退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">知道了
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<c:if test="${!empty login}">
    <script>
        $(function () {
            $("#myModal").modal({
                show: true
            })
        })
    </script>
</c:if> --%>

</body>
</html>
