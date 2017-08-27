<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="<%=path%>/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path%>/css/chart.css" rel="stylesheet" />
<style type="text/css">
.search-box tr th {
	padding: 5px
}

.search-box tr td {
	padding: 5px
}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/report/report.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#items" data-toggle="tab">任务明细列表</a></li>
			<li><a href="#work_type" data-toggle="tab">工作类型统计</a></li>
			<li><a href="#industry" data-toggle="tab">行业统计</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div id="condition">
			<form action="<%=path%>/labor_count">
				<input type="hidden" id="count_type" name="count_type" value="mission_type"/>
				开始日期 <input id="dt_begin" type="text" name="begin" class="datetime"/>
				<span class="glyphicon glyphicon-search"></span>
				结束日期 <input id="dt_end" type="text" name="end" class="datetime"/> 
				<span class="glyphicon glyphicon-search"></span>
				<button id="btnChart" type="submit" class="btn btn-danger">统计</button>
			</div>
			<%-- <form action="/report">
				<table class="table table-bordered search-box">
					<thead>
						<tr>
							<th>开始日期</th>
							<td><input type="text" id="dt_begin" name="begin" class="datetime" /></td>
							<th>结束日期</th>
							<td><input type="text" id="dt_end" name="end" class="datetime" /></td>
							<td style="display: none"><input type="hidden" id="count_type" name="count_type" /></td>
							<td>
								<button id="btnChart" class="btn btn-primary">统计</button>
							</td>
						</tr>
					</thead>
				</table>
			</form> --%>

			<div class="tab-pane active" id="items">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w32px">序号</th>
								<th class="w12">项目名称</th>
								<th class="w32px">行业</th>
								<th class="w64px">工作类型</th>
								<th class="w64px">项目经理</th>
								<th class="w36">工作内容</th>
								<th class="w48px">负责人</th>
								<th class="w6">当前状态</th>
								<th class="w8">开始日期</th>
								<th class="w8">结束日期</th>
								<th class="w64px">工时(h)</th>
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
									<td>${msn.engineer}</td>
									<td>${msn.state}</td>

									<td>${fn:substring(msn.startDate, 0, 10)}</td>
									<td>${fn:substring(msn.endDate, 0, 10)}</td>
									<td>${msn.investment}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>

			<div class="tab-pane" id="work_type">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p">序号</th>
								<th class="w50p">任务类型</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ct" items="${count_type}" varStatus="index">
								<tr>
									<td>${index.count}</td>
									<td>${ct.count_type}</td>
									<td>${ct.work_count}</td>
									<td>${ct.hours}小时</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="industry">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p"">序号</th>
								<th class="w50p">行业</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ci" items="${count_industry}" varStatus="index">
								<tr>
									<td>${index.count}</td>
									<td>${ci.count_type}</td>
									<td>${ci.work_count}</td>
									<td>${ci.hours}小时</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>