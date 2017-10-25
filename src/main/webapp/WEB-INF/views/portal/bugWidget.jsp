<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>

<form action="<%=path%>/portal/bug" id="bugForm">
	<input type="hidden" name="query.responsible" value="${query.responsible}"/>
	<table class="table angle table-striped">
		<tr>
			<th style="width: 32px">编号</th>
			<th>缺陷描述</th>
			<th>状态</th>
			<th>测试时间</th>
		</tr>
		<c:forEach var="bug" items="${obj.list}">
			<tr>
				<td>${bug.bg_bug_id}</td>
				<td>${bug.bg_summary}</td>
				<td>${bug.bg_status}</td>
				<td><f:formatDate value="${bug.bg_detection_date}" pattern="yyyy-MM-dd" /></td>
				
			</tr>
		</c:forEach>
	</table>
	<pg:page id="bugForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
</form>