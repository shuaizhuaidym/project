<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jit.project.project.bean.Project"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@ taglib prefix="dic" uri="/WEB-INF/tags/dic"%>
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

<script type="text/javascript" src="js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="js/Util.js"></script>

<script type="text/javascript" src="<%=path %>/js/project/form.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container-fluid">
		<form id="frm_project" action="update" method="post">
			<input type="hidden" name="project.prjID" value="${prj.prjID}" />
			<fieldset>
				<legend><span>更新项目</span></legend>
			</fieldset>

			<table class="table-frm">
				<tr>
					<th>项目名称</th>
					<td class="required"><input type="text" name="project.prjName" class="required form-control" value="${prj.prjName}"></td>
					<th>所属行业</th>
					<td>
						<dic:dic items="${dicts}" type="所属行业" name="project.industry" path="${prj.industry}" css="required"></dic:dic>
					</td>
				</tr>
				<tr>
					<th>项目类型</th>
					<td>
						<dic:dic items="${dicts}" type="任务类型" name="project.prjType" path="${prj.prjType}"></dic:dic>
					</td>
					<th>相关产品</th>
					<td>
						<ui:select name="project.productName" path="${prj.productName}" items="${products}" css="required"></ui:select>
					</td>
				</tr>
				<tr>
					<th>问题类型</th>
					<td>
						<dic:dic items="${dicts}" type="问题类型" name="project.issueType" path="${prj.issueType}" css="required"></dic:dic>
					</td>
					<th>产品版本</th>
					<td><input type="text" name="project.prudectVersion" value="${prj.prudectVersion}" class="required"></td>
				</tr>
				<tr>
					<th>反馈日期</th>
					<td class="required"><input type="text" name="project.submitDate" value="${prj.localSubmitDate}" class="required datetime"></td>
					<th>当前状态</th>
					<td>
						<dic:dic id="slt_state" items="${dicts}" type="项目状态" name="project.status" path="${prj.status}" css="required"></dic:dic>
					</td>
				</tr>
				<tr>
					<th>详细描述</th>
					<td colspan="3" class="required"><textarea name="project.describtion" class="required x-text" rows="8">${prj.describtion}</textarea></td>
				</tr>
				<tr>
					<th>报告人</th>
					<td>
						<input type="text" name="project.reporter" class="required" value="${prj.reporter}"/>
					</td>
					<th>联系方式</th>
					<td><input type="text" name="project.contact" value="${prj.contact}" class="form-control"></td>
				</tr>
				<tr>
					<th>负责人</th>
					<td>
						<ui:select name="project.engineer" path="${prj.engineer}" items="${mpEngineer}" css="required"></ui:select>
					</td>
					<th>结束日期</th>
					<td><input type="text" id="txt_fd" name="project.finishDate" value="${prj.localFinishDate}" class="datetime"></td>
				</tr>
				<tr>
					<th>处理过程</th>
					<td colspan="3">
						<textarea id="ta_proc" name="project.process" readonly="readonly" class="x-text" rows="10">${prj.process}</textarea>
						<a id="dateX" class="pointer">当前日期</a>
					</td>
				</tr>
				<tr>
					<th>改进措施</th>
					<td colspan="3"><input type="text" name="project.improvement" value="${prj.improvement}" class="x-text" /></td>
				</tr>
				<tr>
					<th>备注</th>
					<td colspan="3"><input type="text" name="project.comments" value="${prj.comments}" class="x-text" /></td>
				</tr>
				<tr>
					<th>人力成本(人*周)</th>
					<td colspan="3"><input type="text" id="txt_lc" name="project.laborCosts" value="${prj.laborCosts}" readonly="readonly" class="x-text number" /></td>
				</tr>
			</table>
			<div style="text-align: left; margin-right: 80px">
				<button type="submit" class="btn btn-primary btn-wide">提交</button>
				<button type="reset" class="btn" style="margin-left: 10px">重置</button>
			</div>
		</form>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<!-- /container -->
</body>

</html>