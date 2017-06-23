<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
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
<link href="<%=path%>/css/list.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="<%=path%>/zTree/zTreeStyle.css" rel="stylesheet">
<style type="text/css">
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

.table td,th {
	padding: 2px 5px 8px 5px
}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>
<script type="text/javascript">
	var zTreeModule;
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
	$(document).ready(function() {
		zTreeModule = $.fn.zTree.init($("#treeModule"), setting, zNodes);
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
						<span>产品列表 <a href="#orgModal" class="white-pointer" data-toggle="modal">[+]</a>
						</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<div class="tab-content">
						<div class="tab-pane tree-box active" id="cmodule">
							<ul id="treeModule" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span>产品模块<a href="<%=path%>/product/add" style="margin-left: 50px; color: white">+增加产品</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w4">序号</th>
								<th class="w12">产品名称</th>
								<th class="w8">产品编号</th>
								<th class="w6">研发经理</th>
								<th class="w6">产品经理</th>
								<th class="w6">测试经理</th>
								<th class="w6">最新版本</th>
								<th class="w6">发布时间</th>
								<th class="w6">操作</th>
							</tr>
						</thead>
						<c:forEach var="prd" items="${obj.list}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${prd.productName}</td>
								<td>${prd.code}</td>
								<td>${prd.devMgr}</td>
								<td>${prd.productMgr}</td>
								<td>${prd.testMgr}</td>
								<td>${prd.releaseVersion}</td>
								<td><f:formatDate value="${prd.releaseDate}" pattern="yyyy-MM-dd" /></td>
								<td><a href="<%=path%>/product/edit?product_id=${prd.productID}"><i class="icon-pencil" title="编辑"></i></a> <a
									href="#"><i class=" icon-remove" title="删除"></i></a></td>
							</tr>
						</c:forEach>
					</table>
					<form id="queryForm" action="<%=path%>/product/list">
						<pg:page id="queryForm" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
							totalCount="${obj.pager.recordCount}">
						</pg:page>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div><!-- end container-fluid -->
	
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
</body>
</html>