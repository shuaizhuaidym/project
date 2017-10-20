<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>

<form action="<%=path%>/portal/project" id="projectForm">
	<input type="hidden" name="query.engineer" value="${query.engineer}"/>
	<table class="table table-striped angle">
		<tbody>
			<tr>
				<th class="w128px">项目名称</th>
				<th>问题描述</th>
				<th class="w108px">状态</th>
				<th class="w64px">反馈时间</th>
			</tr>
			<c:forEach var="project" items="${obj.list}" varStatus="index">
				<tr>
					<td>${project.prjName}</td>
					<td>
						${fn:substring(project.describtion, 0, 108)}
						<c:if test="${fn:length(project.describtion)>108}">...</c:if>
					</td>
					<td>${project.status}</td>
					<td><f:formatDate value="${project.submitDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<pg:page id="projectForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
</form>