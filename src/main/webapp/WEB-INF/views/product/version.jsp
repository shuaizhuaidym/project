<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>产品版本维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/zTree/zTreeStyle.css" rel="stylesheet">

<style type="text/css">
.form-horizontal .control-label {
	float: left;
	padding-top: 5px;
	text-align: right;
	width: 60px;
}

.form-horizontal .controls {
	margin-left: 8px;
	float:left
}

.form-horizontal input{width:64px}
</style>

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

<script type="text/javascript" src="<%=path%>/zTree/jquery-ztree-core-min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/product/version.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<!--Sidebar content-->
				<fieldset>
					<legend>
						<span>产品 版本<a href="<%=path%>/product/add" class="white-pointer">[+]</a>
						</span>
					</legend>
				</fieldset>
				<div class="table-responsive">
					<!-- 组织机构树 -->
					<div class="tree-box" id="tree-box">
						<ul id="treeProduct" class="ztree"></ul>
					</div>
				</div>
			</div>
			<div class="span10 bordered">
				<fieldset>
					<legend>
						<span>产品版本维护</span>
					</legend>
				</fieldset>
				<form class="form-horizontal" action="<%=path%>/dic/update" method="post">
					<input type="hidden" id="dic.dicID" name="dic.dicID" value="" />
					<div class="control-group">
						<label class="small-label control-label" for="dicName">版本号</label>
						<div class="controls">
							<input type="text" id="dicName" name="dic.dicName" value="">
						</div>
						<label class="control-label small-label " for="dicCode">别名</label>
						<div class="controls">
							<input type="text" id="dicCode" name="dic.dicCode" value="">
						</div>
						<label class="control-label" for="displayNumber">路径</label>
						<div class="controls">
							<input type="text" id="displayNumber" name="dic.displayNumber" value="" style="width:132px">
						</div>
						<div class="controls">
							<label class="checkbox"> <input type="checkbox" id="available" name="dic.available"> 启用</label>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">保存</button>
							<button type="reset" class="btn">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>