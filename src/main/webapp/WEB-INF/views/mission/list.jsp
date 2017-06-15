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
.white-pointer {
	cursor: pointer;
	color: white;
}

.form-title {
	color: #333;
	font-size: 21px;
	background: #f1f1f1;
}

.top0 {
	margin-bottom: 0px;
}

.tree-box {
	border: 1px solid #ddd;
	border-top: 0
}
.table td,th{padding:2px 5px 8px 5px}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>


<script type="text/javascript">
	function zTreeOnClick(event, treeId, treeNode) {
		alert(treeNode.tId + ", " + treeNode.name);
	};
	var setting = {
		callback : {
			onClick : zTreeOnClick
		}
	};
	var zTreeModule;
	var zTreeVersion;
	// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	// var setting = {};
	// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
	var zNodes = [ {
		name : "身份认证网关[phoenix]",
		open : true,
		children : [ {
			name : "客户端",
			children : [ {
				name : "proxy"
			}, {
				name : "hook"
			} ]
		}, {
			name : "服务器",
			children : [ {
				name : "GW"
			}, {
				name : "Core1"
			} ]
		} ]
	}, {
		name : "磐石终端",
		open : true,
		children : [ {
			name : "test2_1"
		}, {
			name : "test2_2"
		} ]
	} ];
	var zNodesv = [ {
		name : "身份认证网关[phoenix]",
		open : true,
		children : [ {
			name : "3.0.33.6",
			children : [ {
				name : "功能开发"
			}, {
				name : "缺陷"
			}, {
				name : "持续改进"
			} ]
		}, {
			name : "3.0.34.1",
			children : [ {
				name : "功能开发"
			}, {
				name : "缺陷"
			}, {
				name : "持续改进"
			} ]
		} ]
	}, {
		name : "磐石终端",
		open : true,
		children : [ {
			name : "2.0.16"
		}, {
			name : "2.0.20"
		} ]
	} ];
	$(document).ready(function() {
		zTreeModule = $.fn.zTree.init($("#treeModule"), setting, zNodes);
		zTreeVersion = $.fn.zTree.init($("#treeVersion"), setting, zNodesv);
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
						<span>产品模块 <a href="#productModal" class="white-pointer" data-toggle="modal">[+]</a>
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
						<span>任务列表<a href="<%=path%>/mission/form" style="margin-left: 50px; color: white">+新建任务</a>
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
								<th class="w64px">任务类型</th>
								<th>任务摘要</th>
								<th class="w64px">负责人</th>
								<th class="w64px">状态</th>
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
						<pg:page pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
							totalCount="${obj.pager.recordCount}">
						</pg:page>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- modal dialog add product module -->
	<div id="productModal" class="modal hide fade" tabindex="-1">
		<div class="modal-header form-title">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<span id="myModalLabel">新建模块</span>
		</div>
		<div class="modal-body">
			<form action="#">
				<table>
					<tr>
						<td>模块名称</td>
						<td><input value="身份认证网关" /></td>
						<td>上级模块</td>
						<td><input /></td>
					</tr>
					<tr>
						<td>产品发布版本</td>
						<td><input /></td>
						<td>产品迭代版本</td>
						<td><select></select></td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="3"><textarea rows="3" cols="128" style="width: 93%"></textarea></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">关闭</button>
			<button class="btn btn-primary">保存</button>
		</div>
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