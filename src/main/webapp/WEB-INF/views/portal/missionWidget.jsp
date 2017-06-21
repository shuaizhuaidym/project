<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>

<form action="<%=path%>/portal" id="ajaxForm">
	<table class="table table-striped angle">
		<tbody>
			<tr>
				<th>任务名称</th>
				<th>任务类型</th>
				<th>截止日期</th>
				<th>任务描述</th>
			</tr>
			<c:forEach var="mission" items="${obj.list}" varStatus="index">
				<tr>
					<td>${mission.missionName}</td>
					<td>${mission.taskClass}</td>
					<td><f:formatDate value="${mission.deadline}" pattern="yyyy-MM-dd" /></td>
					<td>${mission.summary}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<pg:page pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
		totalCount="${obj.pager.recordCount}">
	</pg:page>
	<script type="text/javascript">
	function paging() {
		$.ajax({
			cache : true,
			type : "POST",
			url : "/project/portal/mission",
				data : $('#ajaxForm').serialize(),
				async : false,
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					$("#mission-box").html(data);
				}
			});
		}
	</script>
</form>