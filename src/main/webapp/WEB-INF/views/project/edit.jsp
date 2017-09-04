<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jit.project.project.bean.Project"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新项目进展</title>
<link rel="icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/commom.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<style type="text/css">
	<!-- 表单外层容器，统一尺寸 字体等 -->
	.container_frm{width: 65%; margin: 0 auto}
</style>

<script type="text/javascript" src="js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="js/Util.js"></script>

<script type="text/javascript" src="<%=path %>/js/project/form.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container container_frm">
		<form id="frm_project" action="update" method="post">
			<input type="hidden" name="project.prjID" value="${prj.prjID}" />
			<fieldset>
				<legend><span>更新项目</span></legend>
			</fieldset>

			<table class="table table-striped table-bordered">
				<tr>
					<td><label class="control-label col-xs-2">项目名称</label></td>
					<td><input type="text" name="project.prjName" class="required form-control" value="${prj.prjName}"></td>
					<td><label class="control-label col-xs-2">所属行业</label></td>
					<td>
						<ui:select name="project.industry" path="${prj.industry}" items="${mpIndustry}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">项目类型</label></td>
					<td>
						<ui:select name="project.prjType" path="${prj.prjType}" items="${prjTypes}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">相关产品</label></td>
					<td>
						<ui:select name="mission.productName" path="${prj.productName}" items="${products}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">问题类型</label></td>
					<td>
						<ui:select name="project.issueType" path="${prj.issueType}" items="${mpIssueType}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" name="project.prudectVersion" value="${prj.prudectVersion}" class="required"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">反馈日期</label></td>
					<td><input type="text" name="project.submitDate" value="${prj.localSubmitDate}" class="required datetime"></td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td>
						<ui:select id="slt_state" name="project.status" path="${prj.status}" items="${mpStatus}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">详细描述</label></td>
					<td colspan="3"><textarea name="project.describtion" class="required x-text" rows="8">${prj.describtion}</textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">报告人</label></td>
					<td>
						<input type="text" name="project.reporter" class="required" value="${prj.reporter}"/>
					</td>
					<td><label class="control-label col-xs-2">联系方式</label></td>
					<td><input type="text" name="project.contact" value="${prj.contact}" class="form-control"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">负责人</label></td>
					<td>
						<ui:select name="project.engineer" path="${prj.engineer}" items="${mpEngineer}" css="required"></ui:select>
					</td>
					<td><label class="control-label col-xs-2">结束日期</label></td>
					<td><input type="text" id="txt_fd" name="project.finishDate" value="${prj.localFinishDate}" class="datetime"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">处理过程</label></td>
					<td colspan="3">
						<textarea id="ta_proc" name="project.process" class="x-text" rows="10">${prj.process}</textarea>
						<a id="dateX" class="pointer">当前日期</a>
					</td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">改进措施</label></td>
					<td colspan="3"><input type="text" name="project.improvement" value="${prj.improvement}" class="x-text" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">备注</label></td>
					<td colspan="3"><input type="text" name="project.comments" value="${prj.comments}" class="x-text" /></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">人力成本(人*周)</label></td>
					<td colspan="3"><input type="text" id="txt_lc" name="project.laborCosts" value="${prj.laborCosts}" class="x-text number" /></td>
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