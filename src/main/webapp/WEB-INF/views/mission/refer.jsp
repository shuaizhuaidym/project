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

<link href="<%=path%>/css/list.css" rel="stylesheet">
<style type="text/css">
.pagination {
	margin: 0
}

.table th,.table td {
	padding: 5px
}
</style>
<script type="text/javascript">
	function confirm(box) {
		if(window.opener){//window style
			window.opener.refer('${mission_index}',{id : box.id, name : box.name});
			window.close();
		}else{//form style
			$("#summary_"+$("#share_counter").val()).val(box.name);
			$("#id_"+$("#share_counter").val()).val(box.id);
		}
	}

	function paging(formID) {
		$.ajax({
			cache : false,
			type : "POST",
			url : $("#"+formID).attr('action'),
			data : $('#'+formID).serialize(),
			async : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				//TODO
				if (formID == 'missionForm') {
					$("#modal-body").html(data);
				} else if(formID=='projectForm'){
					$("#project-box").html(data);
				}else{
					$("#bug-box").html(data);
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#mission" data-toggle="tab">任务</a></li>
			<li><a href="#project-box" data-toggle="tab">项目支持</a></li>
			<li><a href="#bug-box" data-toggle="tab">BUG</a></li>
		</ul>
		<div class="tab-content">
			<!-- 任务 -->
			<div class="tab-pane active" id="mission">
				<div class="inner-search-box">
					关键字<input/><button>搜索</button>
				</div>
				<form action="<%=path%>/mission/refer" id="missionForm">
					<input type="hidden" name="query.assignTo" value="${query.assignTo}">
					<table class="table table-bordered table-striped">
						<tr>
							<th class="w32px">序号</th>
							<th class="w32px">选择</th>
							<th class="w128px">编号</th>
							<th>任务名称</th>
						</tr>
						<c:forEach var="mission" items="${obj.list}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td><input type="checkbox" id="${mission.missionID}" name="${mission.missionName}" onclick="confirm(this)"
									data-dismiss="modal" /></td>
								<td>${mission.missionID}</td>
								<td>${mission.missionName}</td>
							</tr>
						</c:forEach>
					</table>
					<pg:page id="missionForm" async="true" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
						totalCount="${obj.pager.recordCount}">
					</pg:page>
				</form>
			</div>
			<!-- 项目 -->
			<div class="tab-pane" id="project-box">
				<div class="inner-search-box">
					关键字<input/><button>搜索</button>
				</div>
				<table class="table table-bordered table-striped">
					<tr>
						<th class="w32px">序号</th>
						<th class="w32px">选择</th>
						<th class="w128px">项目编号</th>
						<th>项目名称</th>
					</tr>
					<c:forEach var="project" items="${projects.list}" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>
								<input type="checkbox" id="${project.prjID}" name="${project.prjName}" onclick="confirm(this)"
								data-dismiss="modal" />
							</td>
							<td>${project.prjID}</td>
							<td>${project.prjName}</td>
						</tr>
					</c:forEach>
				</table>
				<form action="<%=path%>/project/refer" id="projectForm">
					<pg:page id="projectForm" async="true" pageNo="${projects.pager.pageNumber}" currentClass="active" pageSize="${projects.pager.pageSize}"
						totalCount="${projects.pager.recordCount}">
					</pg:page>
				</form>
			</div>
			<!-- BUG -->
			<div class="tab-pane" id="bug-box">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="w32px">序号</th>
						<th class="w32px">选择</th>
						<th class="w64px">BUG编号</th>
						<th>BUG摘要</th>
					</tr>
					<c:forEach var="bug" items="${bugs.list}" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td><input type="checkbox" id="${bug.bg_bug_id}" name="${bug.bg_summary}" onclick="confirm(this)" data-dismiss="modal" />
							</td>
							<td>${bug.bg_bug_id}</td>
							<td>${bug.bg_summary}</td>
						</tr>
					</c:forEach>
				</table>
				<form action="<%=path%>/bug/refer" id="bugForm">
					<pg:page id="bugForm" async="true" pageNo="${bugs.pager.pageNumber}" currentClass="active"
						pageSize="${bugs.pager.pageSize}" totalCount="${bugs.pager.recordCount}">
					</pg:page>
				</form>
			</div>
		</div>
		<!-- tab-content -->
	</div>
	<!-- container-fluid -->
</body>
</html>