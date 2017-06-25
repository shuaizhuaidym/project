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
<style type="text/css">
.tree-box {
	border: 1px solid #ddd;
	border-top: 0;
}
</style>
<script type="text/javascript" src="<%=path %>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path %>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript">
	//根据结构查询人员
	function wiz(nodeID) {
		alert(nodeID);
	}
	var zTreeObj;
	// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	var setting = {
		async : {
			enable : true,
			url : "/project/org/tree",
			autoParam : [ "orgID=parent_id" ],
			contentType : "application/x-www-form-urlencoded",
			dataType : 'json',
			type : "post"
		}
	};

	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 tree-box">
				<!--Sidebar content-->
				<fieldset>
					<legend>
						<span>组织机构</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<div>
						<ul id="treeDemo" class="ztree"></ul>
						<div><a>增加子节点</a></div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span> 机构列表<a href="<%=path%>/user/form" style="margin-left: 50px; color: white">新增人员</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w32px">序号</th>
								<th class="w12">用户名[登录账号]</th>
								<th class="w8">真实姓名</th>
								<th class="w36">登录密码[星号展示]</th>
								<th class="w6">是否锁定</th>
							</tr>
						</thead>
						<tr>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sfd</td>
							<td>sdfg</td>
							<td>sdfg</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>