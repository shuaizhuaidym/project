<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>请选择关联任务</title>

<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/list.css" rel="stylesheet">
<link href="<%=path%>/css/commom.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>

<script type="text/javascript">
	function confirm(box) {
		if(window.opener){//window style
			window.opener.refer('${mission_index}',{id : box.id, name : box.name});
			window.close();
		}else{//form style
			$("#summary_"+$("#share_counter").val()).val(box.id + ":" + box.name);
		}
	}

	function paging() {
		$.ajax({
			cache : false,
			type : "POST",
			url : "<%=path %>/mission/refer",
			data : $('#ajaxForm').serialize(),
			async : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				$("#modal-body").html(data);
			}
		});
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="w32px">序号</th>
					<th class="w32px">选择</th>
					<th style="width: 128px">任务名称</th>
					<th>任务摘要</th>
				</tr>
				<c:forEach var="mission" items="${obj.list}" varStatus="index">
					<tr>
						<td>${index.count}</td>
						<td><input type="checkbox" id="${mission.missionID}" name="${mission.missionName}" onclick="confirm(this)" data-dismiss="modal"/></td>
						<td>${mission.missionName}</td>
						<td>${mission.summary}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<form action="<%=path %>/mission/refer" id="ajaxForm">
			<pg:page id="ajaxForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
				totalCount="${obj.pager.recordCount}">
			</pg:page>
		</form>
	</div>
</body>
</html>