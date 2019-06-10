<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@ taglib prefix="dic" uri="/WEB-INF/tags/dic"%>
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

	<div class="container-fluid">
		<form id="frm_project" action="<%=path %>/create" method="post" class="form">
			<fieldset>
				<legend><span>新建项目</span></legend>
			</fieldset>

			<table class="table-frm">
				<tr>
					<th>项目名称</th>
					<td><input type="text" id="prj_name" name="project.prjName" class="required"></td>
					<th>所属行业</th>
					<td>
						<dic:dic items="${dicts}" type="所属行业" name="project.industry" css="required"></dic:dic>
					</td>
				</tr>
				<tr>
					<th>项目类型</th>
					<td>
						<dic:dic items="${dicts}" type="任务类型" name="project.prjType" ></dic:dic>
					</td>
					<th>相关产品</th>
					<td>
						<ui:select name="project.productName" path="${prj.productName}" items="${products}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<th>问题类型</th>
					<td>
						<dic:dic items="${dicts}" type="问题类型" name="project.issueType" css="required"></dic:dic>
					</td>
					<th>产品版本</th>
					<td><input type="text" id="prj_version" name="project.prudectVersion" class="required"></td>
				</tr>
				<tr>
					<th>反馈日期</th>
					<td><input type="text" id="submitDate" name="project.submitDate" class="required datetime"></td>
					<th>当前状态</th>
					<td>
						<dic:dic id="slt_state" items="${dicts}" type="项目状态" name="project.status" css="required"></dic:dic>
					</td>
				</tr>
				<tr>
					<th>详细描述</th>
					<td colspan="3"><textarea id="prj_desc" name="project.describtion" class="x-text required" rows="3"></textarea></td>
				</tr>
				<tr>
					<th>报告人</th>
					<td>
						<input type="text" name="project.reporter" class="required"/>
					</td>
					<th>联系方式</th>
					<td><input type="text" name="project.contact" class="required"></td>
				</tr>
				<tr>
					<th>负责人</th>
					<td>
						<ui:select name="project.engineer" path="${prj.engineer}" items="${mpEngineer}" css="required"></ui:select>
					</td>
					<th>结束日期</th>
					<td><input type="text" name="project.finishDate" class="datetime"></td>
				</tr>
				<tr>
					<th>处理过程</th>
					<td colspan="3"><textarea name="project.process" class="x-text" rows="8"></textarea></td>
				</tr>
				<tr>
					<th>改进措施</th>
					<td colspan="3"><input type="text" id="prj_impr" name="project.improvement" class="x-text" /></td>
				</tr>
				<tr>
					<th>备注</th>
					<td colspan="3"><input type="text" id="prj_comm" name="project.comments" class="x-text" /></td>
				</tr>
				<tr>
					<th>人力成本(人*周)</th>
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