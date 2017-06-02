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
					<td colspan="3"><input type="text" id="mission_name" name="mission.missionName" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务内容</label></td>
					<td colspan="3"><textarea id="mission_desc" name="mission.content"
							style="width: 92%; height: 200px; visibility: hidden;"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productVersion" class="required"></td>
					<td><label class="control-label col-xs-2">任务类型</label></td>
					<td><select name="mission.type">
							<option value="1">科研项目</option>
							<option value="2">售前技术支持</option>
							<option value="3">售后技术支持</option>
							<option value="4">持续改进</option>
							<option value="5">售后需求开发</option>
							<option value="6">售前需求开发</option>
							<option value="7">售前定制开发</option>
							<option value="8">售后定制开发</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属模块</label></td>
					<td>
						<select name="mission.module">
							<option value="1">客户端/UI</option>
						</select>
					</td>
					<td><label class="control-label col-xs-2">任务类别</label></td>
					<td>
						<select name="mission.taskClass" class="required">
								<option value="8">新功能</option>
								<option value="8">缺陷修复</option>
								<option value="8">产品改进</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">指派给</label></td>
					<td>
						<select name="mission.assignedTo">
							<option value="8">张三萌</option>
						</select>
				</td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td><select name="mission.status" class="required">
							<option value="1">未启动</option>
							<option value="2">进行中_需求分析中</option>
							<option value="3">进行中_设计中</option>

							<option value="4">进行中_开发中</option>
							<option value="5">进行中_测试中</option>
							<option value="6">延期进行中</option>
							<option value="7">完成</option>
							<option value="8">暂停</option>
							<option value="9">等待反馈</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">进展说明</label></td>
					<td colspan="3"><textarea name="project.progress" class="w-input" rows="8"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" id="prj_comm" name="project.comments" class="w-input" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">完成百分比</label></td>
					<td><input type="text" id="prj_name" name="project.prjName" class="required">%</td>
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