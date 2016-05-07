<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jit.project.bean.Project"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新项目进展</title>
<link rel="icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/commom.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-dropdown.js"></script>

<script type="text/javascript" src="js/jquery-validation-1.9.0/jquery.validate.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container" style="width: 65%; margin: 0 auto">
		<form id="frm_project" action="update" method="post">
			<input type="hidden" name="project.prjID" value="${prj.prjID}" />
			<fieldset>
				<legend>更新项目进展</legend>
			</fieldset>

			<table class="table table-striped table-bordered">
				<tr>
					<td><label class="control-label col-xs-2">项目名称</label></td>
					<td><input type="text" name="project.prjName" class="form-control" value="${prj.prjName}" readonly="readonly"></td>
					<td><label class="control-label col-xs-2">所属行业</label></td>
					<td><select name="project.industry" class="required">
							<option>军工</option>
							<option>能源</option>
							<option>政府</option>
							<option>公安</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">问题类型</label></td>
					<td><select id="disabledSelect" name="project.issueType"  class="required">
							<option>网关服务器</option>
							<option>客户端</option>
							<option>旁路Agent</option>
							<option>旁路报文</option>
							<option>移动中间件</option>
					</select></td>
					<td><label class="control-label col-xs-2">产品版本</label></td>
					<td><input type="text" name="project.prudectVersion" value="${prj.prudectVersion}" class="number"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">提交日期</label></td>
					<td><input type="text" name="project.submitDate" value="${prj.localSubmitDate}" class="required datetime" readonly="readonly"></td>
					<td><label class="control-label col-xs-2">当前状态</label></td>
					<td><select name="project.status" class="required">
							<option>未开始</option>
							<option>进行中</option>
							<option>暂停</option>
							<option>完成</option>
					</select></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">详细描述</label></td>
					<td colspan="3"><textarea name="project.describtion" class="required x-text" rows="5">${prj.describtion}</textarea></td>
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
					<td><select name="project.engineer" class="form-control">
							<option>李闯</option>
							<option>李颜红</option>
							<option>李开富</option>
							<option>王艳</option>
					</select></td>
					<td><label class="control-label col-xs-2">联系方式</label></td>
					<td><input type="text" name="project.engineerTel" value="${prj.engineerTel}" class="form-control"></td>
				</tr>
				<tr>
					<td><label class="control-label col-xs-2">处理过程</label></td>
					<td colspan="3"><textarea name="project.process" class="x-text" rows="5">${prj.process}</textarea></td>
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
					<td colspan="3"><input type="text" name="project.laborCosts" value="${prj.laborCosts}" class="x-text number" /></td>
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
<script type="text/javascript">
$(function() {
	$( "#frm_project" ).validate( {
			errorPlacement : function(error, element) {
				//error.addClass( "ui red pointing label transition" );
				//error.insertAfter( element.parent() );
			},
			highlight : function(element, errorClass, validClass) {
				$(element).css("border-color", "red");
			},
			unhighlight : function(element, errorClass, validClass) {
				$(element).css("border-color", "#ccc");
			}
		});
	});
</script>
</html>