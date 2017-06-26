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

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

<link href="<%=path%>/zTree/zTreeStyle.css" rel="stylesheet">
<style type="text/css">
.tree-box {
	border: 1px solid #ddd;
	border-top: 0;
}

div#rMenu {
	position: absolute;
	visibility: hidden;
	top: 0;
	background-color: #f9f9f9;
	text-align: left;
	padding: 2px;
}

div#rMenu ul li {
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
}

ul,ol {
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery.ztree.exedit.min.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript">
	var zTreeObj;
	var rMenu;
	//根据结构查询人员
	function wiz(nodeID) {
		alert(nodeID);
	}
	var setting = {
		async : {
			enable : true,
			url : "/project/org/tree",
			autoParam : [ "orgID=parent_id" ],
			contentType : "application/x-www-form-urlencoded",
			dataType : 'json',
			type : "post"
		},
		check: {
			enable: true
		},
		view : {
			dblClickExpand: false
		},
		callback: {
			onRightClick: OnRightClick
		}
	};
	function OnRightClick(event, treeId, treeNode) {
		if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
			zTreeObj.cancelSelectedNode();
			showRMenu("root", event.clientX, event.clientY);
		} else if (treeNode && !treeNode.noR) {
			zTreeObj.selectNode(treeNode);
			showRMenu("node", event.clientX, event.clientY);
		}
	}

	function showRMenu(type, x, y) {
		$("#rMenu ul").show();
		rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

		$("body").bind("mousedown", onBodyMouseDown);
	}
	function hideRMenu() {
		if (rMenu) rMenu.css({"visibility": "hidden"});
		$("body").unbind("mousedown", onBodyMouseDown);
	}
	function onBodyMouseDown(event){
		if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
			rMenu.css({"visibility" : "hidden"});
		}
	}
	var addCount = 1;
	function addTreeNode() {
		hideRMenu();
		
		//TODO 异步提交,成功后刷新Tree
		var newNode = { treeNodeName:"增加" + (addCount++)};
		if (zTreeObj.getSelectedNodes()[0]) {
			newNode.checked = zTreeObj.getSelectedNodes()[0].checked;
			zTreeObj.addNodes(zTreeObj.getSelectedNodes()[0], newNode);
		} else {
			zTreeObj.addNodes(null, newNode);
		}
	}

	function resetTree() {
		hideRMenu();
		$.fn.zTree.init($("#treeDemo"), setting);
	}
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
		rMenu = $("#rMenu");
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
						<div>
							<a>增加子节点</a>
						</div>
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

	<div id="rMenu">
		<ul>
			<li id="m_add" onclick="addTreeNode();">增加节点</li>
			<li id="m_reset" onclick="resetTree();">恢复zTree</li>
		</ul>
	</div>
</body>
</html>