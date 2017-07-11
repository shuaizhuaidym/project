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

.modal-body form input{
	width: 80%;
	height: 22px
}
.modal-body form select {width: 80%;}
.table td,th {
	padding: 2px 5px 8px 5px
}

ul.ztree {
	overflow-x: auto;
	overflow-y: auto;
	min-height:129px
}

.outstand {
	color: #333;
	margin: 0;
	background: #f1f1f1 none repeat scroll 0 0;
	border: 1px solid #ddd;
	width: 215px;
	overflow-x: auto;
	overflow-y: scroll;
	filter: alpha(opacity = 80);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.8;
	opacity: 0.8;
}
.suffix-btn{
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
	margin-left:-5px;
	padding: 4px 4px;
}
#combo-tree input{ width:73%}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/product/product.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<!--Sidebar content-->
				<fieldset>
					<legend>
						<span>产品列表 <a href="<%=path%>/product/add" class="white-pointer">[+]</a>
						</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<!-- 组织机构树 -->
					<div class="tab-content">
						<div class="tab-pane tree-box active" id="cmodule">
							<ul id="treeProduct" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<span>产品模块<a href="#productModal" data-toggle="modal" style="margin-left: 50px; color: white">+增加模块</a>
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
									href="<%=path%>/product/delete?product_id=${prd.productID}"><i class=" icon-remove" title="删除"></i></a></td>
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
	</div>
	<!-- end container-fluid -->

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
						<th>所属产品</th>
						<td><input value="身份认证网关" /></td>
						<th>上级模块</th>
						<td>
							<div id="combo-tree" class="dropdown">
								<input type="text" id="parentModule" name="product.parentID" />
								<a id="parentModuleBtn" onclick="showMenu();" href="#" class='btn suffix-btn'><b class="caret"></b></a>
								<ul id="treeParentModule" class="ztree outstand dropdown-menu"></ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>产品发布版本</th>
						<td><input /></td>
						<th>产品迭代版本</th>
						<td><select>
							<option>sssssssss</option>
						</select></td>
					</tr>
					<tr>
						<th>备注</th>
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