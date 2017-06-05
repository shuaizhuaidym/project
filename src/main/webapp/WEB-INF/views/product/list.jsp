<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%
	int pageNo = 2;
	int pageSize = 20;
	pageContext.setAttribute("pageNo", pageNo);
	pageContext.setAttribute("pageSize", pageSize);
	int totalCount = 1001;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>产品管理</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="zTree/zTreeStyle.css" rel="stylesheet">

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

.modal-body form input,select {
	width: 80%;
	height: 22px
}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>


<script type="text/javascript">
	var zTreeModule;
	var zTreeVersion;
	// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	var setting = {};
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<!--Sidebar content-->
				<fieldset>
					<legend>
						<span>产品模块 <a href="#orgModal" class="white-pointer" data-toggle="modal">[+]</a>
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
						<span>任务列表<a href="<%=path%>/mission/add" style="margin-left: 50px; color: white">+新建任务</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w4">序号</th>
								<th class="w12">任务名称</th>
								<th class="w8">任务类型</th>
								<th class="w36">任务摘要</th>
								<th class="w6">负责人</th>
								<th class="w6">下级任务</th>
								<th class="w6">当前状态</th>
								<th class="w6">操作</th>
							</tr>
						</thead>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>[2]</td>
							<td>sdfg</td>
							<td><a href="#assignModal" data-toggle="modal"><i class="icon-hand-right" title="指派"></i></a> <a href="#"><i
									class="icon-pencil" title="编辑"></i></a> <a href="#"><i class="icon-time" title="任务历史"></i></a></td>

						</tr>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>[0]</td>
							<td>sdfg</td>
							<td><a href="#assignModal" data-toggle="modal"><i class="icon-hand-right" title="指派"></i></a> <a href="#"><i
									class="icon-pencil" title="编辑"></i></a> <a href="#"><i class="icon-time" title="任务历史"></i></a></td>
						</tr>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>[1]</td>
							<td>进行中</td>
							<td><a href="#assignModal" data-toggle="modal"><i class="icon-hand-right" title="指派"></i></a> <a href="#"><i
									class="icon-pencil" title="编辑"></i></a> <a href="#"><i class="icon-time" title="任务历史"></i></a></td>
						</tr>
					</table>
					<pg:page pageNo="<%=pageNo%>" currentClass="active" pageSize="<%=pageSize%>" totalCount="<%=totalCount%>">
					</pg:page>
				</div>
			</div>
		</div>
	</div>
	<!-- modal dialog add product module -->
	<div id="orgModal" class="modal hide fade" tabindex="-1">
		<div class="modal-header form-title">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<span id="myModalLabel">新建模块</span>
		</div>
		<div class="modal-body">
			<form action="#">
				<table>
					<tr>
						<td>所属产品</td>
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
						<td colspan="3"><textarea rows="6" cols="128" style="width: 93%"></textarea></td>
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
			<form action="#">
				<table>
					<tr>
						<td>所属产品</td>
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
						<td colspan="3"><textarea rows="6" cols="128" style="width: 93%"></textarea></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">关闭</button>
			<button class="btn btn-primary">保存</button>
		</div>
	</div>
</body>
</html>