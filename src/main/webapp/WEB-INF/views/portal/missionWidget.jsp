<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>

<form action="<%=path%>/portal/mission" id="missionForm">
	<input type="hidden" name="query.assignTo" value="${query.assignTo}"/>
	<table class="table table-striped angle">
		<tbody>
			<tr>
				<th>任务名称</th>
				<th>任务状态</th>
				<th>计划完成时间</th>
				<th>已投入人力(h)</th>
				<th>计划发布版本</th>
			</tr>
			<c:forEach var="mission" items="${obj.list}" varStatus="index">
				<tr>
					<td>${mission.missionName}</td>
					<td>${mission.status}</td>
					<td><f:formatDate value="${mission.planEnd}" pattern="yyyy-MM-dd" /></td>
					<td>${mission.totalHours}</td>
					<td>${mission.publishVersion}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<pg:page id="missionForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
</form>