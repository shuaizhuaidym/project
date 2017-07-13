<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path %>" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=path%>/kindediter/themes/default/default.css" />
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script charset="utf-8" src="<%=path%>/kindediter/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=path%>/kindediter/lang/zh_CN.js"></script>

</head>
<body>
	<form id="assignForm" action="<%=path %>/mission/assign" method="post">
		<input type="hidden" name="mission.missionID" value="${obj.missionID}"/>
		<table>
			<tr>
				<th class="w64px">任务名称</th>
				<td><input disabled="disabled" value="${obj.missionName}" /></td>
				<th>所属产品</th>
				<td><input disabled="disabled" value="${obj.productName}" /></td>
			</tr>
			<tr>
				<th>迭代版本</th>
				<td><input disabled="disabled" value="${obj.productVersion}" /></td>
				<th>所属项目</th>
				<td><input disabled="disabled" value="${obj.projectName}" /></td>
			</tr>
			<tr>
				<th>任务类型</th>
				<td><input disabled="disabled" value="${obj.type}" /></td>
				<th>截止日期</th>
				<td><input readonly="readonly" value="${obj.formatDeadline}" /></td>
			</tr>
			<tr>
				<th>指派给</th>
				<td>
					<ui:select name="mission.assignTo" path="${obj.assignTo}" items="${users}" css="required"></ui:select>
				</td>
				<th>预计人天</th>
				<td><input name="mission.totalHours" value="100" /></td>
			</tr>
			<tr>
				<th>任务内容</th>
				<td colspan="3"><textarea id="assignContent" rows="8" cols="128" style="width: 93%; height: 108px">${obj.content}</textarea></td>
			</tr>
			<tr>
				<th>备注信息</th>
				<td colspan="3"><textarea id="assignComments" name="mission.comments" rows="3" cols="128" style="width: 93%">${obj.comments}</textarea></td>
			</tr>
		</table>
	</form>
	<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[id="assignContent"]', {
			resizeType : 0,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
	});
</script>
</body>
</html>