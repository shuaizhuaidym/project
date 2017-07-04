<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>机构管理</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/list.css" rel="stylesheet">
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
	background-color: #dfdfdf;
	text-align: left;
	padding: 2px;
	border-radius: 5px;
	background-color: rgba(0, 0, 0, 0.5);
}

div#rMenu ul li {
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	color: #fff
}

ul,ol {
	margin: 5px;
	padding: 0;
}

.divider {
	border-top: 1px white solid;
	background-color: white;
	margin: 1px
}

.arrow {
	margin-top: -10px;
	margin-left: -10px;
	border-color: transparent;
	border-bottom-color: #888;
	border-top-width: 0;
	border-width: 10px;
	border-style: solid;
	display: block;
	position: absolute;
	height: 0;
	width: 0;
	left: 20%;
	top: -10px;
	content: "";
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/org/org.js"></script>
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
							<a>[新增部门]</a><a>[新增用户]</a>
						</div>
					</div>
				</div>
			</div>
			<div class="span10">
				<fieldset>
					<legend>
						<!-- 检查是否选择了部门 -->
						<span> 机构列表<a href="javascript:addDirectly(4);" style="margin-left: 50px; color: white">新增用户</a>
						</span>
					</legend>
				</fieldset>
				<!--Body content-->
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w32px">序号</th>
								<th class="w32px">登录账号</th>
								<th class="w72px">真实姓名</th>
								<th>登录密码[已加密]</th>
								<th class="w108px">部门</th>
								<th class="w64px">是否锁定</th>
							</tr>
						</thead>
						<c:forEach varStatus="index" var="user" items="${obj.list}">
							<tr>
								<td>${index.count}</td>
								<td>${user.name}</td>
								<td>${user.realName}</td>
								<td>${user.password}</td>
								<td>${user.orgName}</td>
								<td>${user.status}</td>
							</tr>
						</c:forEach>
					</table>
					<form id="queryForm" action="<%=path%>/org/list">
						<pg:page id="queryForm" pageNo="${obj.pager.pageNumber}" currentClass="active" pageSize="${obj.pager.pageSize}"
							totalCount="${obj.pager.recordCount}">
						</pg:page>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="rMenu">
		<div class="arrow"></div>
		<ul>
			<li id="m_add" onclick="addTreeNode();">新增用户</li>
			<li class="divider"></li>
			<li id="m_add" onclick="addTreeNode();">新增部门</li>
			<li class="divider"></li>
			<li id="m_reset" onclick="resetTree();">刷新</li>
		</ul>
	</div>
</body>
</html>