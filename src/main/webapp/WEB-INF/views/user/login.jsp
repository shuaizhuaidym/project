<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/commom.css" rel="stylesheet">
<style type="text/css">
body {
	background: #FFFFFF url(<%=path%>/images/skey-lake.jpg) no-repeat;
	font-family: -apple-system, BlinkMacSystemFont, Helvetica Neue,
		PingFang SC, Microsoft YaHei, Source Han Sans SC, Noto Sans CJK SC,
		WenQuanYi Micro Hei, sans-serif;
}

.form-signin {
	background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
	box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.6);
	border-radius: 5px;
	margin: 0 auto 20px;
	max-width: 320px;
	padding: 19px 29px 29px;
}

.btn-full {
	width: 100%;
}

.text-full {
	border: 1px solid #fcf;
	min-height: 35px;
	width: 100%;
	line-height: 30px;
	padding: 7px 9px;
	font-weight: bold
}

.control-group {
	margin-bottom: 32px;
}

.slogon {
	margin-top: 15px;
	color: #ffff00;
	font-size: 32px;
	text-align:center;
	
}
</style>
</head>
<body>

	<form action="<%=path%>/user/authenticate" class="form-horizontal form-signin" method="post">
		<div class="control-group slogon">
			技术改变世界
		</div>
		<div class="control-group">
			<h3 style="color:red">${obj.message}</h3>
		</div>
		<div class="control-group">
			<div class="">
				<input type="text" name="account" placeholder="账号" class="text-full">
			</div>
		</div>
		<div class="control-group">
			<div class="">
				<input type="password" name="password" placeholder="口令" class="text-full">
			</div>
		</div>
		<!-- <div class="control-group" style="margin-bottom: 6px;">
			<label class="control-label" for="inputPassword">记住登录</label>
			<div class="controls">
				<input type="checkbox">
			</div>
		</div> -->
		<div class="control-group">
			<label class="control-label" for="inputPassword"></label>
			<div class="">
				<button type="submit" class="btn btn-large btn-full btn-primary">登录</button>
			</div>
		</div>

	</form>
</body>
</html>