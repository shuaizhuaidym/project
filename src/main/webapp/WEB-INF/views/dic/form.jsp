<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>增加字典</title>
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
		<div class="span8 offset2">
			<fieldset>
				<legend><span>增加字典</span></legend>
			</fieldset>
			<form class="form-horizontal" action="<%=path%>/dic/create" method="post">
				<div class="control-group">
					<label class="control-label" for="dicName">字典名称</label>
					<div class="controls">
						<input type="text" id="dicName" name="dic.dicName">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dicType">字典类型</label>
					<div class="controls">
						<ui:select name="dic.dicType" path="${dic.dicType}" items="${mDicType}"></ui:select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dic.comments">用途说明</label>
					<div class="controls">
						<textarea rows="3" cols="256" name="dic.comments"></textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" id="available" name="dic.available">是否启用
						</label>
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