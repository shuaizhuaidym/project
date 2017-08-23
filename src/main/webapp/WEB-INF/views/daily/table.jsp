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

<title>${me}[<f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" />]
</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container" style="padding: 0 0 20px">
		<fieldset>
			<legend>
				<span>日报预览</span>
			</legend>
		</fieldset>

		<table class="table table-bordered table-striped">
			<c:forEach var="item" items="${obj.items}">
				<tr>
					<th><label class="control-label col-xs-2">任务内容</label></th>
					<td colspan="3"><input type="text" value="${item.missionSummary}" class="w-input"></td>
				</tr>
				<tr>
					<th><label class="control-label col-xs-2">开始时间</label></th>
					<td colspan="3"><input type="text" value="<f:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd" />"
						class="w-input"></td>
				</tr>
				<tr>
					<th><label class="control-label col-xs-2">工作时间</label></th>
					<td colspan="3"><input type="text" value="${item.hours}" class="w-input"></td>
				</tr>
				<tr>
					<th><label class="control-label col-xs-2">完成比例%</label></th>
					<td colspan="3"><input type="text" value="${item.percentage}" class="w-input"></td>
				</tr>
				<tr>
					<th><label class="control-label col-xs-2">工作内容</label></th>
					<td colspan="3"><textarea style="width: 92%; height: 100px;">${item.detail}</textarea></td>
				</tr>
			</c:forEach>
		</table>

		<!-- /container -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>