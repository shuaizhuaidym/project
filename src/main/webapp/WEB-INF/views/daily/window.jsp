<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/commom.css" rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>

</head>
<body>
	<div class="row-fluid">
		<form id="frm_daily" class="form-horizontal" action="<%=path%>/dic/create" method="post">
			<div id="daily_item" class="div_with_divider">
				<div class="control-group">
					<label class="narrow-label">关联任务</label>
					<div class="lcontrols">
						<input type="text" id="summary_0" name="daily.items[0].missionSummary" class="w-input"/>
						<input type="hidden" id="id_0" name="daily.items[0].missionID" class="w-input"/>
						<a href="javascript:refMission(0)">[选择]</a>
					</div>
				</div>
				<div class="control-group">
					<label class="narrow-label">工时</label>
					<div class="lcontrols">
						<input id="hours_0" name="daily.items[0].hours" class="w-input" />
					</div>
				</div>
				<div class="control-group">
					<label class="narrow-label">完成比例</label>
					<div class="lcontrols">
						<input id="percentage_0" name="daily.items[0].percentage" class="w-input" />
					</div>
				</div>
				<div class="control-group">
					<label class="narrow-label">工作内容</label>
					<div class="lcontrols">
						<textarea rows="3" cols="256" id="detail_0" name="daily.items[0].detail" class="w-input"></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>