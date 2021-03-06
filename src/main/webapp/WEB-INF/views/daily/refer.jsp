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
<link href="<%=path%>/css/commom.css" rel="stylesheet" />
<style type="text/css">
.pagination {
	margin: 0
}

.table th,.table td {
	padding: 5px
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>

<script type="text/javascript">
	function confirm(box) {
		if(window.opener){//window style
			window.opener.refer('${mission_index}',{id : box.id, name : box.name});
			window.close();
		}else{//form style
			$("#summary_"+$("#share_counter").val()).val(box.id + ":" + box.name);
			$("#id_"+$("#share_counter").val()).val(box.id);
		}
	}

	function paging() {
		$.ajax({
			cache : false,
			type : "POST",
			url : "<%=path%>/mission/refer",
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
		<ul class="nav nav-tabs">
			<li class="active"><a href="#mission" data-toggle="tab">任务</a></li>
			<li><a href="#prj-support" data-toggle="tab">项目支持</a></li>
			<li><a href="#bug-fix" data-toggle="tab">BUG</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="mission">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="w32px">序号</th>
						<th class="w32px">选择</th>
						<th>任务名称</th>
					</tr>
					<c:forEach var="mission" items="${obj.list}" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td><input type="checkbox" id="${mission.missionID}" name="${mission.missionName}" onclick="confirm(this)"
								data-dismiss="modal" /></td>
							<td>${mission.missionName}</td>
						</tr>
					</c:forEach>
				</table>
				<form action="<%=path%>/mission/refer" id="ajaxForm">
					<pg:page id="ajaxForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
						totalCount="${obj.pager.recordCount}">
					</pg:page>
				</form>
			</div>
			<div class="tab-pane" id="prj-support">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="w32px">序号</th>
						<th class="w32px">选择</th>
						<th>项目名称</th>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="bug-fix">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="w32px">序号</th>
						<th class="w32px">选择</th>
						<th class="w64px">BUG编号</th>
						<th>BUG名称</th>
					</tr>
				</table>
			</div>
		</div><!-- tab-content -->
	</div><!-- container-fluid -->
</body>
</html>