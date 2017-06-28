<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>增加用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="row-fluid">
		<div class="span8 offset2 bordered">
			<fieldset>
				<legend>
					<span>增加用户</span>
				</legend>
			</fieldset>
			<form class="form-horizontal" action="<%=path%>/user/save" method="post">
				<div class="control-group">
					<label class="control-label" for="dicType">部门</label>
					<div class="controls">
						<%-- <ui:select name="user.name" path="${org.orgName}" items="${mDicType}"></ui:select> --%>
						<select name="user.name">
							<option value="${org.orgID}">${org.orgName}</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dicName">登录密码</label>
					<div class="controls">
						<input type="text" id="dicName" name="dic.dicName">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dicName">账号</label>
					<div class="controls">
						<input type="text" id="dicName" name="dic.dicName">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dicCode">真实姓名</label>
					<div class="controls">
						<input type="text" id="dicCode" name="dic.dicCode">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="displayNumber">salt</label>
					<div class="controls">
						<input type="text" id="displayNumber" name="dic.displayNumber">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="checkbox"> <input type="checkbox" checked="checked" id="available" name="dic.available">是否锁定
						</label>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">保存</button>
						<a href="<%=path%>/dic/list" class="btn">返回列表</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>