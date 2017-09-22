<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>任务管理</title>

<base href="<%=path%>" />

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/list.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path%>/zTree/zTreeStyle.css" rel="stylesheet">

<style type="text/css">
#search_box input[type="text"],#search_box select {
	width: 125px;
}

.top0 {
	margin-bottom: 0px;
}

.table td,th {
	padding: 5px 5px 5px 5px
}
.td_oper{text-align:center}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>
<script type="text/javascript" src="<%=path%>/js/mission/list.js"></script>

<link rel="stylesheet" href="<%=path%>/kindediter/themes/default/default.css" />
<script charset="utf-8" src="<%=path%>/kindediter/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=path%>/kindediter/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[id="assignContent"]', {
			resizeType : 0,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<!--Sidebar content-->
				<fieldset>
					<legend>
						<span>产品导航</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<ul id="myTab" class="nav nav-tabs top0">
						<li class="active"><a href="#cmodule" data-toggle="tab">模块视图</a></li>
						<!-- <li><a href="#cversion" data-toggle="tab">版本视图</a></li> -->
					</ul>

					<div class="tab-content">
						<div class="tab-pane tree-box active" id="cmodule">
							<ul id="treeModule" class="ztree"></ul>
						</div>
						<div class="tab-pane tree-box" id="cversion">
							<ul id="treeVersion" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span> 任务列表<a href="<%=path%>/mission/form" style="margin-left: 50px; color: white">+新建任务</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<form id="mission_query_form" action="<%=path%>/mission/query" method="post">
						<table id="search_box" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>任务名称</th>
									<td><input type="text" name="query.missionName" value="${query.missionName}" /></td>
									<th>创建时间</th>
									<td><input type="text" name="query.createTime" class="datetime" /></td>
									<th>负责人</th>
									<td>
										<ui:select name="query.assignTo" path="${query.assignTo}" items="${users}"></ui:select>
									<th>计划发布版本</th>
									<td><input type="text" name="query.devVersion" value="${query.devVersion}" /></td>
									<th>任务状态</th>
									<td><ui:select name="query.status" path="${query.status}" items="${status}"></ui:select></td>
									<td style="text-align: center"><input type="submit" value="查&nbsp;询" class="btn btn-primary" /></td>
								</tr>
							</thead>
						</table>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th class="w32px">序号</th>
									<th>任务名称</th>
									<th class="w96px">任务类型</th>
									<th class="w48px">负责人</th>
									<th class="w48px">版本</th>
									<th class="w128px">状态</th>
									<th class="w96px">操作</th>
								</tr>
							</thead>
							<c:forEach var="mission" items="${obj.list}" varStatus="index">
								<tr>
									<td>${index.count}</td>
									<td><a href="<%=path %>/mission/edit?mission_id=${mission.missionID}"> ${mission.missionName} </a></td>
									<td>${mission.type}</td>
									<td>${mission.assignTo}</td>
									<td>${mission.publishVersion}</td>
									<td>${mission.status}</td>
									<td class="td_oper">
										<a href="<%=path %>/mission/loadForAssignAsync?mission_id=${mission.missionID}" data-toggle="modal"
										data-target="#assignModal"><i class="icon-hand-right" title="指派"></i></a> &nbsp;
										<a href="<%=path %>/mission/history?mission_id=${mission.missionID}"><i class="icon-time" title="任务历史"></i></a>
										<a href="javascript:confirme(${mission.missionID});"><i class="icon-remove" title="删除"></i></a>
									</td>
								</tr>
							</c:forEach>
						</table>
						<input type="hidden" id="module" name="query.module" />
						<pg:page id="mission_query_form" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
							totalCount="${obj.pager.recordCount}">
						</pg:page>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<!-- modal dialog assign task -->
	<div id="assignModal" class="modal hide fade" tabindex="-1">
		<div class="modal-header form-title">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<span id="myModalLabel">任务指派</span>
		</div>
		<div class="modal-body">
			<!-- 加载远端 -->
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">关闭</button>
			<button class="btn btn-primary" onclick="assign();">保存</button>
		</div>
	</div>
	<script type="text/javascript">
		function assign() {
			$("#assignForm").submit();
		}
		
		function confirme(mid){
			if(window.confirm("请再次确认要删除任务！")){
				window.location.href="<%=path %>/mission/remove?mission_id="+mid;
			}
		}
	</script>

</body>
</html>