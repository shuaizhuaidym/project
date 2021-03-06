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
<style type="text/css">
body {
	background: #FFFFFF url(<%=path%>/images/skey-lake.png) no-repeat;
	font-family: -apple-system, BlinkMacSystemFont, Helvetica Neue,
		PingFang SC, Microsoft YaHei, Source Han Sans SC, Noto Sans CJK SC,
		WenQuanYi Micro Hei, sans-serif;
	background-size: cover;
}

.form-login {
	backgroundColor: #FFF;
	background: rgba(255, 255, 255, 0.8) none repeat scroll 0 0;
	box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.6);
	border-radius: 1px;
	margin: 64px auto 20px;
	max-width: 320px;
	padding: 19px 29px 29px;
	border-top: 5px #ff8140 solid;
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

.header {
	padding: 0 40px;
	height: 70px;
	position: relative;
	z-index: 2;
	background:RGB(230,239,250);
	overflow: hidden;
}

.headerLogo {
	top: 16px;
	left: 40px;
	display: inline-block;
	width: 192px;
	height: 43px;
	position: absolute;
	background:url("../img/logo-light.png") no-repeat scroll;
	background-size: 100% 100%;
	background-position: 0 0;
	z-index: 3;
}

.slogon {
	font-weight: bold;
	padding: 0;
	color: #FF9933;
	font-size: 48px;
	line-height: 48px;
	text-align: center;
	letter-spacing: 4px;
	font-family: STCaiyun;
	display: block !important;
}
</style>
</head>
<body>
	<div class="header">
	<div class="headerLogo"></div>
	</div>
	<form action="<%=path%>/user/authenticate" class="form-horizontal form-login" method="post">
		<div class="slogon">
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
<script type="text/javascript">
	function dim(idd) {
		return document.getElementById(idd);
	}

	function support() {
		var input = document.createElement('input');
		if ("placeholder" in input) {
			return true;
		} else {
			return false;
		}
	}

	var node = dim('query_prjName');
	function placeholder(node, pcolor) {

		if (node && !support()) {

			placeholder = node.getAttribute('placeholder') || '';
			node.onfocus = function() {
				if (node.value == placeholder) {
					node.value = '';
					node.style.color = "";
				}
			}
			node.onblur = function() {
				if (node.value == '') {
					node.value = placeholder;
					node.style.color = pcolor;
				}
			}
			node.value = placeholder;
			node.style.color = pcolor;

		}
	}
	placeholder(node, "#AAA");
</script>
</html>