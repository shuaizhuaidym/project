<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${mission.missionName }</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.item_summary {
	background: #fafafa none;
	border: 1px #ddd solid;
	width: 100%;
	margin-bottom: 8px
}

.item_summary td{
	line-height: 15px;
	padding: 8px;
	text-align: left;
	vertical-align: bottom;
}

.item_summary th {
	text-align: right;
	padding-right: 32px;
	width: 20%;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend>
				<span>任务研发历史</span>
			</legend>
		</fieldset>
		<table class="item_summary">
			<thead>
				<tr>
					<th>任务名称</th>
					<td>${mission.missionName}</td>
					<th>任务状态</th>
					<td>${mission.status}</td>
				</tr>
				<tr>
					<th>开始时间</th>
					<td><f:formatDate value="${mission.startDate}" pattern="yyyy-MM-dd" /></td>
					<th>计划结束时间</th>
					<td><f:formatDate value="${mission.planEnd}" pattern="yyyy-MM-dd" /></td>
				</tr>
			<thead>
		</table>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th colspan="4">研发过程</th>
				</tr>
				<tr>
					<th class="w32px">序号</th>
					<th>工作内容</th>
					<th class="w48px">负责人</th>
					<th class="w108px">日期</th>
					<th class="w32px">工时</th>
					<th class="w108px">当前完成比例</th>
					<th class="w5p">备注</th>
				</tr>
			</thead>
			<c:forEach var="item" items="${obj}" varStatus="ndx">
				<tr>
				<td>${ndx.count}</td>
					<td>${item.progress_detail}</td>
					<td>${item.reporter}</td>
					
					<td>${fn:substring(item.report_date, 0, 10)}</td>
					<td>${item.hours}</td>
					<td>${item.percentage}%</td>
					<%-- <td>${item.state}</td> --%>
					<td>${item.problem}</td>
				</tr>

			</c:forEach>
		</table>
		<!-- /container -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>