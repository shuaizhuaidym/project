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
		<form id="frm_mission" action="create" method="post">
			<fieldset>
				<legend>
					<span>新建任务</span>
				</legend>
			</fieldset>

			<table class="table table-bordered table-striped">
				<tr>
					<td><label class="control-label col-xs-2">任务名称</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.mName" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务内容</label></td>
					<td colspan="3"><textarea id="mission_desc" name="mission.content"
							style="width: 92%; height: 200px; visibility: hidden;"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="mission.prudectVersion" class="required"></td>
					<td><label class="control-label col-xs-2">任务类型</label></td>
					<td><select name="mission.type">
						<option>科研项目</option>
						<option>售前技术支持</option>
						<option>售后技术支持</option>
						<option>持续改进</option>
						<option>售后需求开发</option>
						<option>售前需求开发</option>
						<option>售前定制开发</option>
						<option>售后定制开发</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属模块</label></td>
					<td><select name="mission.module"></select></td>
					<td><label class="control-label col-xs-2">任务类别</label></td>
					<td><select name="mission.class" class="required">
							<option>新功能</option>
							<option>缺陷修复</option>
							<option>产品改进</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">指派给</label></td>
					<td><select name="mission.assignedTo"></select></td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td>
						<select name="mission.status" class="required">
							<option>未启动</option>
							<option>进行中_需求分析中</option>
							<option>进行中_设计中</option>
							
							<option>进行中_开发中</option>
							<option>进行中_测试中</option>
							<option>延期进行中</option>
							<option>完成</option>
							<option>暂停</option>
							<option>等待反馈</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">进展说明</label></td>
					<td colspan="3"><textarea name="project.process" class="w-input" rows="8"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" id="prj_comm" name="project.comments" class="w-input" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">完成百分比</label></td>
					<td ><input type="text" id="prj_name" name="project.prjName" class="required">%</td>
					<td><label class="control-label col-xs-2">已投入人力(小时)</label></td>
					<td><input type="text" name="project.laborCosts" class="number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary">提交</button>
				<button type="reset" class="btn" style="margin-left: 10px">重置</button>
			</div>
		</form>

	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>