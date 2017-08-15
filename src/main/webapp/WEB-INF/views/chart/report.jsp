<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>人力统计</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container" style="width: 65%; margin: 0 auto">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">售前人力统计</a></li>
			<li><a href="#profile" data-toggle="tab">售后人力统计</a></li>
			<li><a href="#messages" data-toggle="tab">持续改进人力统计</a></li>
			<li><a href="#settings" data-toggle="tab">行业人力投入统计</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="home">
				售前人力统计
			</div>
			<div class="tab-pane" id="profile">
				售后人力统计
			</div>
			<div class="tab-pane" id="messages">
				持续改进人力统计
			</div>
			<div class="tab-pane" id="settings">
				行业人力投入统计
			</div>
		</div>
	</div>
</body>
</html>