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
.w-input {
	width: 92%
}

textarea {
	display: block;
}
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
	<div class="container" style="width: 65%; margin: 0 auto">
		<form id="frm_mission" action="create" method="post">
			<fieldset>
				<legend>
					<span>新建任务</span>
				</legend>
			</fieldset>

			<table class="table table-bordered table-striped">
				<tr>
					<td><label class="control-label col-xs-2">任务名称</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.missionName" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务摘要</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.summary" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务内容</label></td>
					<td colspan="3"><textarea id="mission_desc" name="mission.content"
							style="width: 92%; height: 100px;"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属产品</label></td>
					<td>
						<ui:select name="mission.productName" path="${mission.productName}" items="${products}"></ui:select>
					<td><label class="control-label col-xs-2">任务类型</label></td>
					<td>
						<ui:select name="mission.type" path="${obj.type}" items="${types}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属模块</label></td>
					<td>
						<ui:select name="mission.module" path="${mission.module}" items="${modules}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">任务类别</label></td>
					<td>
						<ui:select name="mission.taskClass" path="${obj.taskClass}" items="${classes}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productVersion" class="required"></td>
					
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td>
						<ui:select name="mission.status" path="${obj.status}" items="${status}"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">上级任务</label></td>
					<td><input type="text" id="mission_name" name="mission.parentID"></td>
					<td><label class="control-label col-xs-2">截止日期</label></td>
					<td><input type="text" id="mission_name" name="mission.deadline" class="datetime"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">指派给</label></td>
					<td>
						<ui:select name="mission.assignTo" path="${obj.assignTo}" items="${users}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">产品子类</label></td>
					<td><input type="text" id="mission_name" name="mission.productSubType"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">基线版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productBaseVersion"></td>
					<td><label class="control-label col-xs-2">负责团队</label></td>
					<td><input type="text" id="mission_name" name="mission.teamID"></td>
				</tr>
				<!-- publish version,industry -->
				<tr>
					<td><label class="control-label col-xs-2">实际发布版本</label></td>
					<td><input type="text" id="p_version" name="mission.publishVersion"></td>
					<td><label class="control-label col-xs-2">发起行业</label></td>
					<td>
						<ui:select name="mission.industryName" path="${prj.industryName}" items="${industry}" css="required"></ui:select>
						<input type="hidden" id="industryID" name="industryID"/>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">计划开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planStart" class="datetime"></td>
					<td><label class="control-label col-xs-2">开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.startDate" class="datetime"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">计划结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planEnd" class="datetime"></td>
					<td><label class="control-label col-xs-2">结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.endDate" class="datetime"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">进展说明</label></td>
					<td colspan="3"><textarea name="mission.progressDetail" class="w-input" rows="8"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" id="prj_comm" name="mission.comments" class="w-input" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">完成百分比</label></td>
					<td><input type="text" id="prj_name" name="mission.progress" class="required number">%</td>
					<td><label class="control-label col-xs-2">已投入人力(小时)</label></td>
					<td><input type="text" name="mission.totalHours" class="number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary">提交</button>
				<a href="<%=path%>/mission/query" class="btn" style="margin-left: 10px">返回列表</a>
			</div>
		</form>

	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>