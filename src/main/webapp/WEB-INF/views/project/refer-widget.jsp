<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>
<form action="<%=path%>/project/refer" id="projectForm">
	<div class="inner-search-box">
		<strong>关键字</strong><input id="query_prjName" name="query.prjName" value="${query.prjName}" />
		<button type="button" onclick="inner_search(this);" class="btn btn-success">搜索</button>
	</div>
	<table class="table table-bordered table-striped">
		<tr>
			<th class="w32px">序号</th>
			<th class="w32px">选择</th>
			<th class="w128px">项目编号</th>
			<th>项目名称</th>
		</tr>
		<c:forEach var="project" items="${obj.list}" varStatus="index">
			<tr>
				<td>${index.count}</td>
				<td><input type="checkbox" id="${project.prjID}" name="${project.prjName}" onclick="confirm(this)" data-dismiss="modal" />
				</td>
				<td>${project.prjID}</td>
				<td>${project.prjName}</td>
			</tr>
		</c:forEach>
	</table>
	<pg:page id="projectForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
</form>
