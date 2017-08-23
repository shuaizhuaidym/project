<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>我的日报${obj}</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet"/>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<style type="text/css">
.div_with_divider {
	border-bottom: 1px #ddd dashed;
	border-top: 1px #ddd dashed;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate-1.17.0.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-tab.js"></script>
<script type="text/javascript" src="<%=path%>/js/portal.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container" style="width: 65%; margin: 0 auto; border: 1px #ddd solid">
		<input type="hidden" id="share_counter" value="0"/>
		<form id="frm_daily" action="<%=path%>/daily/save" method="post" class="form-horizontal">
			<fieldset>
				<legend>
					<span>写日报</span>
				</legend>
			</fieldset>
			<div id="daily_item" class="div_with_divider">
				<div class="control-group">
					<label class="control-label" for="code">任务名称</label>
					<div class="controls">
						<input type="text" id="summary_0" name="daily.items[0].missionName" class="required w-input"> 
						<input type="hidden" id="id_0" name="daily.items[0].missionID" class="w-input"/>
						<a data-toggle="modal" href="<%=path%>/mission/refer?mission_index=0" onclick="trig(0);" data-target="#missionModal">[选择]</a>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="devMgr">工时（小时）</label>
					<div class="controls">
						<input type="text" id="devMgr" name="daily.items[0].hours" class="required number w-input">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="productMgr">完成比例%</label>
					<div class="controls">
						<input type="text" id="productMgr" name="daily.items[0].percentage" class="required number w-input"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="desc">工作内容</label>
					<div class="controls">
						<textarea rows="3" id="desc" name="daily.items[0].detail" class="required w-input"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="desc">疑难问题</label>
					<div class="controls">
						<input type="text" id="productMgr" name="daily.items[0].problerm" class="w-input"/>
					</div>
				</div>
				
			</div>
			<div class="control-group" id="function_box">
				<div class="controls">
					<a href="#" class="btn btn-warning" id="btnInsert">新增日报条目</a>
					
					<input type="button" class="btn btn-inverse" id="btnDelete" value="删除"></input>
					<input type="submit" id="btn_save" class="btn btn-success" value="保存"></input>
					
					<a href="<%=path%>/product/list" class="btn btn-primary">返回列表</a>
				</div>
			</div>
		</form>

	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<!-- modal dialog assign task -->
	<div id="missionModal" class="modal hide fade" tabindex="-1">
		<div class="modal-header form-title">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<span id="myModalLabel">我的任务/项目/bug${today}</span>
		</div>
		<div id="modal-body" class="modal-body">
			<!-- 加载远端 -->
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">关闭</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#btn_save").click(function() {
			var hours = $("[name$='.hours']");
			var total8 = parseInt(0);
			hours.each(function(i, e) {
				total8 = total8 + parseInt(e.value);
			});
			if (8 != total8) {
				alert("总工作时间不等于8小时，请修改后再提交。");
				return false
			}
		});
		$("#frm_daily").validate({
			errorPlacement : function(error, element) {
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