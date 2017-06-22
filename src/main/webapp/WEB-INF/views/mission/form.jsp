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
<script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

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
					<td><label class="control-label col-xs-2">任务摘要</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.summary" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">任务内容</label></td>
					<td colspan="3"><textarea id="mission_desc" name="mission.content"
							style="width: 92%; height: 100px; visibility: hidden;"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属项目</label></td>
					<td colspan="3"><input type="text" id="mission_name" name="mission.projectName" class="required w-input"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属产品</label></td>
					<td><input type="text" id="mission_name" name="mission.productID" class="required"></td>
					<td><label class="control-label col-xs-2">任务类型</label></td>
					<td><select name="mission.type">
							<option value="科研项目">科研项目</option>
							<option value="售前技术支持">售前技术支持</option>
							<option value="售后技术支持">售后技术支持</option>
							<option value="持续改进">持续改进</option>
							<option value="售后需求开发">售后需求开发</option>
							<option value="售前需求开发">售前需求开发</option>
							<option value="售前定制开发">售前定制开发</option>
							<option value="售后定制开发">售后定制开发</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">所属模块</label></td>
					<td><select name="mission.module">
							<option value="1">客户端/UI</option>
					</select></td>
					<td><label class="control-label col-xs-2">任务类别</label></td>
					<td><select name="mission.taskClass" class="required">
							<option value="8">新功能</option>
							<option value="8">缺陷修复</option>
							<option value="8">产品改进</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productVersion" class="required"></td>
					
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
					<td><label class="control-label col-xs-2">上级任务</label></td>
					<td><input type="text" id="mission_name" name="mission.parentID" class="required"></td>
					<td><label class="control-label col-xs-2">截止日期</label></td>
					<td><input type="text" id="mission_name" name="mission.deadline" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">指派给</label></td>
					<td><select name="mission.assignTo">
							<option value="张三">张三</option>
							<option value="李四">李四</option>
					</select></td>
					<td><label class="control-label col-xs-2">产品子类</label></td>
					<td><input type="text" id="mission_name" name="mission.productSubType" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">基线版本</label></td>
					<td><input type="text" id="prj_version" name="mission.productBaseVersion" class="required"></td>
					<td><label class="control-label col-xs-2">负责团队</label></td>
					<td><input type="text" id="mission_name" name="mission.teamID" class="required"></td>
				</tr>
				
				<tr>
					<td><label class="control-label col-xs-2">计划开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planStart" class="required"></td>
					<td><label class="control-label col-xs-2">开始时间</label></td>
					<td><input type="text" id="mission_name" name="mission.startDate" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">计划结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.planEnd" class="required"></td>
					<td><label class="control-label col-xs-2">结束时间</label></td>
					<td><input type="text" id="mission_name" name="mission.endDate" class="required"></td>
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
					<td><input type="text" id="prj_name" name="mission.progress" class="required">%</td>
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