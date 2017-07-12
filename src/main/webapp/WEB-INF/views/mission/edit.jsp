<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>编辑任务</title>

<link href="<%=path %>/css/commom.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<link href="<%=path %>/zTree/zTreeStyle.css" rel="stylesheet">
<style type="text/css">
textarea {
	display: block;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate.js"></script>

<link rel="stylesheet" href="<%=path %>/kindediter/themes/default/default.css" />
<script charset="utf-8" src="<%=path %>/kindediter/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=path %>/kindediter/lang/zh_CN.js"></script>
<script>
	var editor;
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
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container" style="width: 65%; margin: 0 auto">
		<form id="frm_mission" action="update" method="post">
			<input type="hidden" name="mission.missionID" value="${obj.missionID}"/>
			<fieldset>
				<legend>
					<span>编辑任务</span>
				</legend>
			</fieldset>

			<table class="table table-bordered table-striped">
				<tr>
					<td><label class="control-label col-xs-2">任务名称</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.missionName" value="${obj.missionName}" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务摘要</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.summary" value="${obj.summary}" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务内容</label></td>
					<td colspan="3"><textarea id="mission_desc" name="mission.content"
							style="width: 92%; height: 100px;">${obj.summary}</textarea></td>
				</tr>
				
				<!-- <tr>
					<td><label class="control-label col-xs-2">相关项目</label></td>
					<td>
						<select>
							<option value="山东财政">山东财政</option>
							<option value="山西社保">山西社保</option>
							<option value="沧州公安">沧州公安</option>
						</select>
					</td>
					<td><label class="control-label col-xs-2">相关BUG</label></td>
					<td><input type="text" id="mission_name" name="mission.projectName" class="required"></td>
				</tr> -->
				
				<tr>
					<td><label class="control-label col-xs-2">所属产品</label></td>
					<td>
						<ui:select name="mission.productName" path="${mission.productName}" items="${products}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">任务类型</label></td>
					<td>
						<ui:select name="mission.type" path="${obj.type}" items="${types}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属模块</label></td>
					<td>
						<ui:select name="mission.module" path="${mission.module}" items="${products}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">任务类别</label></td>
					<td>
						<ui:select name="mission.taskClass" path="${obj.taskClass}" items="${classes}" css="required"></ui:select>
					</td>
				</tr>
				<tr><td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productVersion" value="${obj.productVersion}" class="required"></td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td>
						<ui:select name="mission.status" path="${obj.status}" items="${status}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">上级任务</label></td>
					<td><input type="text" id="mission_name" name="mission.parentID" value="${obj.parentID}" class="required"></td>
					<td><label class="control-label col-xs-2">截止日期</label></td>
					<td><input type="text" id="mission_name" name="mission.deadline" 
					value="<f:formatDate value="${obj.deadline}" pattern="yyyy-MM-dd" />" class="required"></td>
				</tr>
				<tr>
				<td><label class="control-label col-xs-2">指派给</label></td>
					<td>
						<ui:select name="mission.assignTo" path="${obj.assignTo}" items="${users}" css="required"></ui:select>
					</td>
					
					<td><label class="control-label col-xs-2">产品子类</label></td>
					<td><input type="text" id="mission_name" name="mission.productSubType" value="${obj.productSubType}" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">基线版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productBaseVersion" value="${obj.productBaseVersion}" class="required"></td>
					<td><label class="control-label col-xs-2">负责团队</label></td>
					<td><input type="text" id="mission_name" name="mission.teamID" value="${obj.teamID}" class="required"></td>
				</tr>
				
				<tr>
					<td><label class="control-label col-xs-2">计划开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planStart" 
					value="<f:formatDate value="${obj.planStart}" pattern="yyyy-MM-dd" />" class="required"></td>
					<td><label class="control-label col-xs-2">开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.startDate" 
					value="<f:formatDate value="${obj.startDate}" pattern="yyyy-MM-dd" />" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">计划结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planEnd" 
					value="<f:formatDate value="${obj.planEnd}" pattern="yyyy-MM-dd" />" class="required"></td>
					<td><label class="control-label col-xs-2">结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.endDate" 
					value="<f:formatDate value="${obj.endDate}" pattern="yyyy-MM-dd" />" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">进展说明</label></td>
					<td colspan="3"><textarea name="mission.progressDetail" class="w-input" rows="8">${obj.progressDetail}</textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" id="prj_comm" name="mission.comments" value="${obj.comments}" class="w-input" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">完成百分比</label></td>
					<td><input type="text" id="prj_name" name="mission.progress" value="${obj.progress}" class="required">%</td>
					<td><label class="control-label col-xs-2">已投入人力(小时)</label></td>
					<td><input type="text" name="mission.totalHours" value="${obj.totalHours}" class="number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary">提交</button>
				<a class="btn" href="<%=path %>/mission/query" style="margin-left: 10px">返回列表</a>
			</div>
		</form>

	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>