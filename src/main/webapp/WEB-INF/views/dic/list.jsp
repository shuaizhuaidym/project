<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%@taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@page import="org.nutz.dao.pager.Pager"%>
<%@page import="org.nutz.dao.QueryResult"%>
<%@page import="com.jit.project.bean.Query"%>
<%@page import="org.nutz.mvc.ViewModel"%>
<%@page import="com.jit.project.dictionary.bean.Dictionary"%>
<%@page import="java.util.List"%>

<%
	ViewModel model = (ViewModel) request.getAttribute("obj");
	QueryResult rst = (QueryResult)model.get("dicts");
	List<Dictionary> dicts = rst.getList(Dictionary.class);
	request.setAttribute("dicts", dicts);
	Pager pager = rst.getPager();
%>
<%
	int pageNo = pager.getPageNumber();
	int pageSize = pager.getPageSize();
	pageContext.setAttribute("pageNo", pageNo);
	pageContext.setAttribute("pageSize", pageSize);
	int totalCount = pager.getRecordCount();
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

<link href="<%=path%>/css/list.css" rel="stylesheet" />
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
<title>字典管理</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend><span>字典列表</span></legend>
		</fieldset>
		<form id="queryForm" action="<%=path%>/dic/query" method="post">
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-condensed">
					<tr>
						<td>字典名称</td>
						<td><input type="text" name="query.dicName" value="${obj.query.dicName}"/></td>
						<td>字典类型</td>
						<td><ui:select name="query.dicType" path="${obj.query.dicType}" items="${obj.mDicType}"></ui:select></td>

						<td style="text-align: center">
							<button type="btn btn-success" id="btnQuery" value="查询" class="btn btn-primary">查询</button>
						</td>
						<td style="text-align: center">
							<button type="button" id="btnCreate" onclick="toForm();" value="增加字典" class="btn">增加字典</button>
						</td>
					</tr>
				</table>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="w4">序号</th>
							<th class="w12">字典名称</th>
							<th class="w8">字典类型</th>
							<th class="w36">详细描述</th>
							<th class="w6">当前状态</th>
						</tr>
					</thead>
					<c:forEach var="dic" items="${dicts}" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td><a href="<%=path%>/dic/edit?dic_id=${dic.dicID}">${dic.dicName}</a></td>
							<td>${dic.dicType}</td>
							<td>${dic.comments}</td>
							<td>${dic.state}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<%-- TODO pager --%>
			<pg:page pageNo="<%=pageNo%>" currentClass="active" pageSize="<%=pageSize%>" totalCount="<%=totalCount%>">
			</pg:page>
		</form>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function toForm(){
			window.location.href="<%=path%>/dic/form";
		}
	</script>
</body>
</html>