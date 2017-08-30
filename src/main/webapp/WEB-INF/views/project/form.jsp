<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>新建项目</title>

<link href="<%=path %>/css/commom.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<style type="text/css">
	<!-- 表单外层容器，统一尺寸 字体等 -->
	.container_frm{width: 65%; margin: 0 auto}
</style>
<script type="text/javascript" src="<%=path %>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/project/form.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container container_frm">
		<form id="frm_project" action="<%=path %>/create" method="post">
			<fieldset>
				<legend><span>新建项目</span></legend>
			</fieldset>

			<table class="table table-bordered table-striped">
				<tr>
					<td><label class="control-label col-xs-2">项目名称</label></td>
					<td><input type="text" id="prj_name" name="project.prjName" class="required"></td>
					<td><label class="control-label col-xs-2">所属行业</label></td>
					<td>
						<ui:select name="project.industry" path="${prj.industry}" items="${mpIndustry}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">项目类型</label></td>
					<td>
						<ui:select name="project.prjType" path="${obj.type}" items="${prjTypes}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">相关产品</label></td>
					<td>
						<ui:select name="mission.productName" path="${project.productName}" items="${products}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">产品模块</label></td>
					<td>
						<ui:select name="project.issueType" path="${prj.issueType}" items="${mpIssueType}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" id="prj_version" name="project.prudectVersion" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">反馈日期</label></td>
					<td><input type="text" id="submitDate" name="project.submitDate" class="required datetime"></td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td>
						<ui:select name="project.status" path="${prj.status}" items="${mpStatus}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">详细描述</label></td>
					<td colspan="3"><textarea id="prj_desc" name="project.describtion" class="x-text required" rows="3"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">报告人</label></td>
					<td>
						<input type="text" name="project.reporter" class="required"/>
					</td>
					<td><label class="control-label col-xs-2">联系方式</label></td>
					<td><input type="text" name="project.contact" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">负责人</label></td>
					<td>
						<ui:select name="project.engineer" path="${prj.engineer}" items="${mpEngineer}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">结束日期</label></td>
					<td><input type="text" name="project.finishDate" class="datetime"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">处理过程</label></td>
					<td colspan="3"><textarea name="project.process" class="x-text" rows="8"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">改进措施</label></td>
					<td colspan="3"><input type="text" id="prj_impr" name="project.improvement" class="x-text" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" id="prj_comm" name="project.comments" class="x-text" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">人力成本(人*周)</label></td>
					<td colspan="3"><input type="text" name="project.laborCosts" class="x-text number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary">提交</button>
				<button type="reset" class="btn" style="margin-left: 10px">重置</button>
			</div>
		</form>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<!-- /container -->
</body>

</html>