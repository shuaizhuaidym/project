<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%@page import="org.nutz.dao.pager.Pager"%>
<%@page import="org.nutz.dao.QueryResult"%>
<%@page import="com.jit.project.bean.Query"%>
<%@page isELIgnored="false"%>

<%
	Query query = (Query) request.getAttribute("query");
%>
<%
	QueryResult rst = (QueryResult) request.getAttribute("result");
%>
<%
	Pager pager = rst.getPager();
%>
<%
	int pageNo = pager.getPageNumber();
	int pageSize = pager.getPageSize();
	int totalCount = pager.getRecordCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>项目列表</title>

<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="css/list.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sub_date").datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend>
				项目列表<a href="form" style="margin-left: 50px">&gt;&gt;新建项目</a>
			</legend>
		</fieldset>
		<form id="queryForm" action="query" method="post">
			<div class="table-responsive">
				<table class="table table-striped">
					<tr>
						<td>项目名称|</td>
						<td class="w12"><input type="text" name="query.prjName" class="qt" value="<%=query.getPrjName()%>" /></td>
						<td>当前状态|</td>
						<td class="w24 ibox"><span> <input type="checkbox" name="query.status" value="未开始" />未开始 <input
								type="checkbox" name="query.status" value="进行中" />进行中 <input type="checkbox" name="query.status" value="暂停" />暂停 <input
								type="checkbox" name="query.status" value="已完成" />已完成
						</span></td>
						<td>负责人|</td>
						<td class="w12"><select name="query.engineer" class="wp80">
								<option></option>
								<option>李闯</option>
								<option>李林峰</option>
								<option>李开爽</option>
								<option>王艳</option>
						</select></td>
						<td class="w15">提交日期|</td>
						<td><input type="text" id="sub_date" name="query.submitDate" class="wp98" /></td>
						<td style="width: 15%; text-align: center">
							<button type="submit" value="查询" class="btn btn-success">查询</button>
							<button type="submit" value="查询" class="btn btn-success">导出EXCEL</button>
						</td>
					</tr>
				</table>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="w4">序号</th>
							<th>项目名称</th>
							<th>问题类型</th>
							<th class="w36">详细描述</th>
							<th class="w8">提交日期</th>
							<th class="w6">负责人</th>
							<th class="w6">当前状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prj" items="<%=rst.getList()%>" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${prj.prjName}</td>
								<td>${prj.issueType}</td>
								<td><a href="/project/edit?prjid=${prj.prjID}">${prj.describtion}</a></td>
								<td>${prj.localSubmitDate}</td>
								<td>${prj.engineer}</td>
								<td>${prj.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<pg:page pageNo="<%=pageNo%>" currentClass="active" pageSize="<%=pageSize%>" totalCount="<%=totalCount%>">
			</pg:page>
		</form>

	</div>

	<!-- /container -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>