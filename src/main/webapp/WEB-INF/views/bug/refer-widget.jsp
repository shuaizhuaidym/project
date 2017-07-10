<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>
<table class="table table-bordered table-striped">
	<tr>
		<th class="w32px">序号</th>
		<th class="w32px">选择</th>
		<th class="w64px">BUG编号</th>
		<th>BUG名称</th>
	</tr>
	<c:forEach var="bug" items="${obj.list}" varStatus="index">
		<tr>
			<td>${index.count}</td>
			<td>
				<input type="checkbox" id="${bug.bg_bug_id}" name="${bug.bg_summary}" onclick="confirm(this)" data-dismiss="modal" />
			</td>
			<td>${bug.bg_bug_id}</td>
			<td>${bug.bg_summary}</td>
		</tr>
	</c:forEach>
</table>
<form action="<%=path%>/bug/refer" id="bugForm">
	<pg:page id="bugForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
</form>