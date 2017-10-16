<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>版本信息</title>

<link href="<%=path %>/css/commom.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">

.version_list tr td:nth-child(odd) {
	text-align: right;
	vertical-align:middle;
}

.version_list pre {
	background-color: transparent;
	border: none;
	margin: 0;
	padding: 8px 0 0 0;
}

.version_list .label {
	display: block;
	margin-bottom: 0;
}
</style>
<link rel="stylesheet" href="<%=path %>/kindediter/themes/default/default.css" />

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container version_list">
		<form>
			<fieldset>
				<legend>
					<span>发布历史</span>
				</legend>
			</fieldset>

			<table class="table table-bordered table-striped">
				<tr>
					<td class="version_title">版本</td>
					<td colspan="3">0.1.1GA</td>
				</tr>
				<tr>
					<td>发布日期</td>
					<td colspan="3">2017-10-16</td>
				</tr>
				<tr>
					<td>发布说明</td>
					<td colspan="3">
						<pre>1、修复【写日报页面】中【任务选择】弹出窗口翻页后查询信息丢失BUG
2、【写日报页面】中【任务选择】弹出窗口增加根据任务/项目名称查询功能</pre>
					</td>
				</tr>
			</table>
			
			<div style="text-align: left; margin-right: 80px">
				<a href="<%=path%>/" class="btn">返回首页</a>
			</div>
		</form>

	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>