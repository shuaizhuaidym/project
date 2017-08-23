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

<title>${me}[<f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" />]</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	table{border:1px #000000 solid}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend>
				<span>研发日报明细</span>
			</legend>
		</fieldset>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<td colspan="8">
						工作日报_<f:formatDate value="${obj.createDate}" pattern="yyyy/MM/dd" /> ${obj.ownerName}
					</td>
				</tr>
				<tr>
					<th class="w20p">任务名称</th>
					<th class="w5p">开始时间</th>
					<th class="w5p font10">计划完成时间</th>
					<th class="w5p font10">实际完成时间</th>
					<th class="w30p">工作内容</th>
					<th class="w5p">工时</th>
					<th class="w5p">完成比例</th>
					<th class="w5p">状态</th>
					<th class="w5p">备注</th>
				</tr>
			</thead>
			<c:forEach var="item" items="${obj.items}">
				<tr>
					<td>${item.missionName}</td>
					<td><f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" /></td>
					<td><f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" /></td>
					<td><f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" /></td>
					<td>${item.detail}</td>
					<td>${item.hours}</td>
					<td>${item.percentage} %</td>
					<td>状态</td>
					<td>备注</td>
				</tr>

			</c:forEach>
		</table>
		<!-- /container -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>