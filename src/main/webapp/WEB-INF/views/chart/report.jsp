<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">售前人力统计</a></li>
			<li><a href="#profile" data-toggle="tab"></a></li>


			<li><a href="#messages" data-toggle="tab"> </a></li>
			<li><a href="#settings" data-toggle="tab"> </a></li>

		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="home">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w4">序号</th>
								<th class="w12">项目名称</th>
								<th class="w8">行业</th>
								<th class="w8">工作类型</th>
								<th class="w8">项目经理</th>
								<th class="w36">工作内容</th>
								<th class="w6">当前状态</th>
								<th class="w6">负责人</th>
								<th class="w8">开始日期</th>
								<th class="w8">结束日期</th>
								<th class="w8">人力投入</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="msn" items="${obj}" varStatus="index">
								<tr>
									<td>${(pageNo-1)*pageSize + index.count}</td>
									<td>${msn.mission }</td>
									<td>${msn.industry}</td>
									<td>${msn.type}</td>
									<td>${msn.manager}</td>
									<td>${msn.content}</td>
									<td>${msn.state}</td>
									<td>${msn.engineer}</td>

									<td>${msn.startDate}</td>
									<td>${msn.endDate}</td>
									<td>${msn.investment}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="profile">

			<div class="tab-pane" id="messages">

			<div class="tab-pane" id="settings"></div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>