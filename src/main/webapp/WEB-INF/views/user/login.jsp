<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.form-signin {
	background-color: #fff;
	border: 1px solid #e5e5e5;
	border-radius: 5px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
	margin: 0 auto 20px;
	max-width: 480px;
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
	font-weight:bold
}
.last1{}
</style>
</head>
<body>
	<form action="<%=path%>/user/authenticate" class="form-horizontal form-signin" method="post">
		<div class="control-group">
			<label class="control-label" for="inputEmail">账号</label>
			<div class="controls">
				<input type="text" name="account" placeholder="Account" class="text-full">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPassword">密码</label>
			<div class="controls">
				<input type="password" name="password" placeholder="Password" class="text-full">
			</div>
		</div>
		<div class="control-group" style="margin-bottom: 6px;">
			<label class="control-label" for="inputPassword">记住登录</label>
			<div class="controls">
				<input type="checkbox">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPassword"></label>
			<div class="controls">
				<button type="submit" class="btn btn-large btn-full btn-primary">登录</button>
			</div>
		</div>

	</form>
</body>
</html>