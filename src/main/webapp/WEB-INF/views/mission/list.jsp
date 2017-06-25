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

<title>任务管理</title>

<base href="<%=path%>" />

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/list.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path%>/zTree/zTreeStyle.css" rel="stylesheet">

<style type="text/css">


.top0 {
	margin-bottom: 0px;
}

.table td,th{padding:2px 5px 8px 5px}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>


<script type="text/javascript">
	function wiz(nodeID) {
		alert(nodeID);
	}
	var setting = {
			async : {
				enable : true,
				url : "/project/product/tree",
				autoParam : [ "treeNodeID=parent_id" ],
				otherParam: ["view_type", "0"],
				contentType : "application/x-www-form-urlencoded",
				dataType : 'json',
				type : "post"
			}
		};
	var zTreeModule;
	var zTreeVersion;
	
	$(document).ready(function() {
		zTreeModule = $.fn.zTree.init($("#treeModule"), setting);
		zTreeVersion = $.fn.zTree.init($("#treeVersion"), setting);
	});
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
</script>

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
						<span>产品导航 </a>
						</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<ul id="myTab" class="nav nav-tabs top0">
						<li class="active"><a href="#cmodule" data-toggle="tab">模块视图</a></li>
						<li><a href="#cversion" data-toggle="tab">版本视图</a></li>
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
						<span>
							任务列表<a href="<%=path%>/mission/form" style="margin-left: 50px; color: white">新建任务</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w32px">序号</th>
								<th>任务名称</th>
								<th class="w96px">任务类型</th>
								<th>任务摘要</th>
								<th class="w48px">负责人</th>
								<th class="w128px">状态</th>
								<th class="w72px">操作</th>
							</tr>
						</thead>
						<c:forEach var="mission" items="${obj.list}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${mission.missionName}</td>
								<td>${mission.type}</td>
								<td>${mission.summary}</td>
								<td>${mission.assignTo}</td>
								<td>${mission.status}</td>
								<td>
									<a href="<%=path %>/mission/loadForAssignAsync?mission_id=${mission.missionID}" data-toggle="modal" data-target="#assignModal"><i class="icon-hand-right" title="指派"></i></a>
									<a href="<%=path %>/mission/edit?mission_id=${mission.missionID}"><i class="icon-pencil" title="编辑"></i></a>
									<a href="<%=path %>/mission/history?mission_id=${mission.missionID}"><i class="icon-time" title="任务历史"></i></a></td>

							</tr>
						</c:forEach>
					</table>
					<form id="queryForm" action="<%=path%>/mission/query">
						<pg:page id="queryForm" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
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
		function assign(){
			$("#assignForm").submit();
		}
	</script>
	
</body>
</html>