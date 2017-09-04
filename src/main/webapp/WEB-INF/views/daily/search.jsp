<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%@taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>日报检索</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/css/list.css" rel="stylesheet" />
<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<style type="text/css">
.table td,th {
	padding: 2px 5px 8px;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
$(function() {
	var datePks=$("#queryForm").find("input.datetime");
	datePks.each(function(){
		$(this).datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			format:"yyyy-mm-dd"
		});
		//避免和浏览器的记忆下拉冲突
		$(this).attr("readonly","readonly");
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend>
				<span>日报列表
				<a href="<%=path%>/daily/form" class="white-pointer">+写日报</a>
				</span>
			</legend>
		</fieldset>
		<div class="table-responsive">
			<form id="queryForm" action="<%=path%>/daily/search" method="post">
				<table class="table table-bordered table-condensed">
					<tr>
						<th>人员名称</th>
						<th><ui:select name="query.ownerName" path="${query.ownerName}" items="${owners}"></ui:select></th>
						<th>发送日期起</th>
						<th><input type="text" name="query.createDate" value="${query.createDate}" class="datetime"/></th>
						<th>发送日期止</th>
						<th><input type="text" name="query.createDate2" value="${query.createDate}" class="datetime"/></th>
						<th style="text-align: center">
							<button id="btnQuery" class="btn btn-primary">查询</button>
						</th>
					</tr>
				</table>
			</form>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th class="w32px">序号</th>
						<th class="w64px">人员姓名</th>
						<th class="w72px">发送日期</th>
						<th class="w32px font10">预览</th>
						<th>日报（条目）内容</th>
					</tr>
				</thead>
				<c:forEach var="daily" items="${obj.list}" varStatus="index">
					<tr>
						<td>${index.count}</td>
						<td>${daily.ownerName}</td>
						<td><f:formatDate value="${daily.createDate}" pattern="yyyy-MM-dd" /></td>
						<td><a href="<%=path%>/daily/items?daily_id=${daily.dailyID}"><i class="icon-list" title="日报预览"></i></a></td>
						<td>${daily.itemLinks}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<pg:page id="queryForm" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
			totalCount="${obj.pager.recordCount}">
		</pg:page>


		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>
</html>