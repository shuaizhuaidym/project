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

<title>新建任务</title>

<link href="<%=path %>/css/commom.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="<%=path %>/zTree/zTreeStyle.css" rel="stylesheet">
<style type="text/css">

</style>
<link rel="stylesheet" href="<%=path %>/kindediter/themes/default/default.css" />

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>

<script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

<script charset="utf-8" src="<%=path %>/kindediter/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=path %>/kindediter/lang/zh_CN.js"></script>

<script charset="utf-8" src="<%=path %>/js/mission/form.js"></script>

<script>
	/* var editor;
	KindEditor.ready(function(K) {	
		editor = K.create('textarea[name="mission.content"]', {
			resizeType : 0,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	}); */
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<form id="frm_mission" action="create" method="post">
			<fieldset>
				<legend>
					<span>新建任务</span>
				</legend>
			</fieldset>

			<table class="table-frm">
				<tr>
					<th>任务名称</th>
					<td colspan="3" class="required"><input type="text" id="mission_name" name="mission.missionName" class="required w-input"></td>
				</tr>
				<tr>
					<th>任务摘要</th>
					<td colspan="3"><input type="text" id="mission_name" name="mission.summary" class="required w-input"></td>
				</tr>
				<tr>
					<th>任务内容</th>
					<td colspan="3" class="required"><textarea id="mission_desc" name="mission.content" class="x-text"></textarea></td>
				</tr>
				<tr>
					<th>所属产品</th>
					<td>
						<ui:select name="mission.productName" path="${mission.productName}" items="${products}"></ui:select>
					<th>任务类型</th>
					<td>
						<ui:select name="mission.type" path="${obj.type}" items="${types}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<th>所属模块</th>
					<td>
						<ui:select name="mission.module" path="${mission.module}" items="${modules}" css="required"></ui:select>
					</td>
<%-- 					<th>任务类别</th>
					<td>
						<ui:select name="mission.taskClass" path="${obj.taskClass}" items="${classes}" css="required"></ui:select>
					</td> --%>
					<th>当前状态</th>
					<td>
						<ui:select name="mission.status" path="${obj.status}" items="${status}" css="required"></ui:select>
					</td>
				</tr>
<%-- 				<tr>
					<th>产品版本</th>
					<td><input type="text" id="prj_version" name="mission.productVersion" class="required"></td>
					
					<th>当前状态</th>
					<td>
						<ui:select name="mission.status" path="${obj.status}" items="${status}"></ui:select>
					</td>
				</tr> --%>
				<!-- <tr>
					<th>上级任务</th>
					<td><input type="text" id="mission_name" name="mission.parentID"></td>
					<th>截止日期</th>
					<td><input type="text" id="mission_name" name="mission.deadline" class="datetime"></td>
				</tr> -->
				<tr>
					<th>指派给</th>
					<td>
						<ui:select name="mission.assignTo" path="${obj.assignTo}" items="${users}" css="required"></ui:select>
					</td>
					<!-- <th>产品子类</th>
					<td><input type="text" id="mission_name" name="mission.productSubType"></td> -->
					<th>任务类别</th>
					<td>
						<ui:select name="mission.taskClass" path="${obj.taskClass}" items="${classes}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<th>基线版本</th>
					<td><input type="text" id="prj_version" name="mission.productBaseVersion" class="required"></td>
					<th>负责团队</th>
					<td><input type="text" id="mission_name" name="mission.teamID"></td>
				</tr>
				<!-- publish version,industry -->
				<tr>
					<th>计划发布版本</th>
					<td><input type="text" id="p_version" name="mission.publishVersion" class="required"></td>
					<th>发起行业</th>
					<td>
						<ui:select name="mission.industryName" path="${prj.industryName}" items="${industry}" css="required"></ui:select>
						<input type="hidden" id="industryID" name="industryID"/>
					</td>
				</tr>
				<tr>
					<th>计划开始时间</th>
					<td><input type="text" id="mission_name" name="mission.planStart" class="datetime required"></td>
					<th>开始时间</th>
					<td><input type="text" id="mission_name" name="mission.startDate" class="datetime"></td>
				</tr>
				<tr>
					<th>计划结束时间</th>
					<td><input type="text" id="mission_name" name="mission.planEnd" class="datetime required"></td>
					<th>结束时间</th>
					<td><input type="text" id="mission_name" name="mission.endDate" class="datetime"></td>
				</tr>
				<!-- <tr>
					<th>进展说明</th>
					<td colspan="3"><textarea name="mission.progressDetail" class="w-input" rows="8"></textarea></td>
				</tr> -->
				<tr>
					<th>备注</th>
					<td colspan="3"><input type="text" id="prj_comm" name="mission.comments" class="w-input" /></td>
				</tr>
				<tr>
					<th>完成百分比</th>
					<td><input type="text" id="prj_name" name="mission.progress" class="number">%</td>
					<th>已投入人力(小时)</th>
					<td><input type="text" name="mission.totalHours" class="number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary btn-wide btn-wide">提交</button>
				<a href="<%=path%>/mission/query" class="btn" style="margin-left: 10px">返回列表</a>
			</div>
		</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<!-- /container -->
	
</body>
</html>