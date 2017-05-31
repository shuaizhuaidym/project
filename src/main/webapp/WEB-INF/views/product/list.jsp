<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>产品管理</title>

<link href="css/commom.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="zTree/zTreeStyle.css" rel="stylesheet">

<style type="text/css">
.white-pointer {
	cursor: pointer;
	color: white;
}

.form-title {
	color: #333;
	font-size: 21px;
	background: rgb(7, 103, 200)
		linear-gradient(to bottom, #086ed5, #055db5) repeat scroll 0 0;
}
.assign:before{content:'\e261';font-family: NewZenIcon;}
</style>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<script type="text/javascript" src="js/bootstrap-tab.js"></script>

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
		zTreeModule = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		zTreeVersion = $.fn.zTree.init($("#tVersion"), setting, zNodesv);
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
						<span>产品管理 <a href="#myModal" class="white-pointer" data-toggle="modal">[+]</a>
						</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#cmodule" data-toggle="tab">模块视图</a></li>
						<li><a href="#cversion" data-toggle="tab">版本视图</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="cmodule">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
						<div class="tab-pane" id="cversion" style="border: 1px blue solid">
							<ul id="tVersion" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span>任务列表<a href="<%=path%>/form" style="margin-left: 50px; color: white">+新建任务</a>
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
								<th class="w8">问题类型</th>
								<th class="w36">详细描述</th>
								<th class="w6">负责人</th>
								<th class="w6">下级任务</th>
								<th class="w6">当前状态</th>
								<th class="w6">编辑/查看历史</th>
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
							<td><a href="#">编辑/查看历史</a></td>
							
						</tr>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>[0]</td>
							<td>sdfg</td>
							<td><a href="#">编辑/查看历史</a></td>
						</tr>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>[1]</td>
							<td><i class="assign"></i></td>
							<td><a href="#">编辑/查看历史</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- modal dialog -->
	<div id="myModal" class="modal hide fade" tabindex="-1">
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
						<td colspan="3"><textarea rows="6" cols="128" style="width: 88%"></textarea></td>
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