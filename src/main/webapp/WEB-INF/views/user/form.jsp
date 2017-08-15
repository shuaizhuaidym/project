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

<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>

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
			<form id="frm_user" class="form-horizontal" action="<%=path%>/user/add" method="post">
				<div class="control-group">
					<label class="control-label" for="org">部门</label>
					<div class="controls">
						<%-- <ui:select name="user.name" path="${org.orgName}" items="${mDicType}"></ui:select> --%>
						<select id="org" name="user.orgID">
							<option value="${org.orgID}">${org.orgName}</option>
						</select>
						<input type="hidden" name="user.orgName" value="${org.orgName}"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="uname">账号</label>
					<div class="controls">
						<input type="text" id="uname" name="user.name" class="required"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="pwd">登录密码</label>
					<div class="controls">
						<input type="text" id="pwd" name="user.password" class="required"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="rname">真实姓名</label>
					<div class="controls">
						<input type="text" id="rname" name="user.realName" class="required"/>
					</div>
				</div>
				<!-- <div class="control-group">
					<label class="control-label" for="salt">salt</label>
					<div class="controls">
						<input type="text" id="salt" name="user.salt">
					</div>
				</div> -->
				<div class="control-group">
					<div class="controls">
						<label class="checkbox"> <input type="checkbox" id="available" name="user.locked">是否锁定
						</label>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">保存</button>
						<a href="<%=path%>/user/save" class="btn">返回列表</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
	<script type="text/javascript">
		$(function() {
			$( "#frm_user" ).validate( {
				highlight : function(element, errorClass, validClass) {
					$(element).css("border-color", "red");
				},
				unhighlight : function(element, errorClass, validClass) {
					$(element).css("border-color", "#ccc");
				}
			});
		});
	</script>
</html>