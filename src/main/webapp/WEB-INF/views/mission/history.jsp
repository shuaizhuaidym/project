<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
table {
	border: 1px #ddd solid;
	width:100%;
	margin-bottom:8px
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
		<table>
			<thead>
				<tr>
					<td>任务名称</td>
					<td>${mission.missionName}</td>
					<td>任务状态</td>
					<td>${mission.status}</td>
				</tr>
				<tr>
					<td>开始时间</td>
					<td><f:formatDate value="${mission.startDate}" pattern="yyyy-MM-dd" /></td>
					<td>计划结束时间</td>
					<td><f:formatDate value="${mission.planEnd}" pattern="yyyy-MM-dd" /></td>
				</tr>
			<thead>
		</table>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<td colspan="4">研发过程</td>
				</tr>
				<tr>
					<th class="w20px">序号</th>
					<th>工作内容</th>
					<!-- <th class="w5p">开始时间</th> -->
					<!-- <th class="w5p font12">计划完成时间</th>
					<th class="w5p font12">实际完成时间</th> -->
					<!-- <th class="w30p">工作内容</th> -->
					<th class="w20px">工时</th>
					<th class="w128px">当前完成比例</th>
					<!-- <th class="w10p">状态</th> -->
					<th class="w5p">备注</th>
				</tr>
			</thead>
			<c:forEach var="item" items="${obj}" varStatus="ndx">
				<tr>
				<td>${ndx.count}</td>
					<td>${item.detail}</td>
					<%-- <td><f:formatDate value="${item.start_date}" pattern="yyyy-MM-dd" /></td>
					<td><f:formatDate value="${item.plan_end}" pattern="yyyy-MM-dd" /></td>
					<td><f:formatDate value="${item.end_date}" pattern="yyyy-MM-dd" /></td> --%>
					<%-- <td>${item.detail}</td> --%>
					<td>${item.hours}</td>
					<td>${item.percentage}%</td>
					<%-- <td>${item.state}</td> --%>
					<td>${item.problerm}</td>
				</tr>

			</c:forEach>
		</table>
		<!-- /container -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>