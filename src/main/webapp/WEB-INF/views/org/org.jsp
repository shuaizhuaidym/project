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

<title>机构管理</title>

<link href="<%=path %>/css/commom.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="<%=path %>/zTree/zTreeStyle.css" rel="stylesheet">

<script type="text/javascript" src="<%=path %>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path %>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript">
	var zTreeObj;
	// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	var setting = {};
	// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
	var zNodes = [ {
		name : "test1",
		open : true,
		children : [ {
			name : "test1_1"
		}, {
			name : "test1_2"
		} ]
	}, {
		name : "test2",
		open : true,
		children : [ {
			name : "test2_1"
		}, {
			name : "test2_2"
		} ]
	} ];
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
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
						<span>组织机构</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<div>
						<ul id="treeDemo" class="ztree"></ul>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span> 机构列表<a href="<%=path%>/form" style="margin-left: 50px; color: white">+新建机构</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w4">序号</th>
								<th class="w12">项目名称</th>
								<th class="w8">问题类型</th>
								<th class="w36">详细描述</th>
								<th class="w8">反馈日期</th>
								<th class="w8">更新日期</th>
								<th class="w6">负责人</th>
								<th class="w6">当前状态</th>
							</tr>
						</thead>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfdg</td>
							<td>sdfg</td>
							<td>sdfg</td>
							<td>sfd</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>