<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/portal.js"></script>
<script type="text/javascript" src="<%=path%>/js/daily/form.js"></script>

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
			
			<div class="control-group">
				<label class="control-label" for="report_date">日期</label>
				<div class="controls">
					<input type="text" id="report_date" name="daily.createDate" value="${obj}" class="required datetime w-input" readonly="readonly"/>
				</div>
				<input type="hidden" id="daily_status" name="daily.status" value="1"/>
			</div>
			<div id="daily_item" class="div_with_divider" lang="daily_item_0">
				<div class="control-group">
					<label class="control-label" for="code">任务名称</label>
					<div class="controls">
						<input type="text" id="summary_0" name="daily.items[0].missionName" readonly="readonly" class="required w-input"> 
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
						<a id="btnDel_0" href="#" onclick="delDailyItem(0);" class="hid"><i class="icon-remove"></i></a>
					</div>
				</div>
				
			</div>
			<div class="control-group" id="function_box">
				<div class="controls">
					<a href="#" class="btn btn-warning" id="btnInsert">新增日报条目</a>
					
					<!-- <input type="button" class="btn btn-inverse" id="btnDelete" value="删除"></input> -->
					<input type="button" id="btn_save_draft" class="btn btn btn-info" value="暂存"></input>
					<input type="submit" id="btn_save" class="btn btn-success" value="提交"></input>
					<a href="<%=path%>/daily/search" class="btn btn-primary">返回列表</a>
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

</html>