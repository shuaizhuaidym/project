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

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<style type="text/css">
.div_with_divider {
	border-bottom: 1px #ddd dashed;
	border-top: 1px #ddd dashed;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/portal.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="container" style="width: 65%; margin: 0 auto; border: 1px #ddd solid">
		<form id="frm_daily" action="create" method="post" class="form-horizontal">
			<fieldset>
				<legend>
					<span>写日报<a href="#" class="white-pointer" href="javascript:" id="btnInsert">[增加日志条目]</a></span>
				</legend>
			</fieldset>
			<div class="control-group">
				<label class="control-label" for="productName">发送给</label>
				<div class="controls">
					<input type="text"<input class="w-input" />
					<a>选择</a>
				</div>
			</div>
			<div id="daily_item" class="div_with_divider">
				<div class="control-group">
					<label class="control-label" for="code">关联任务</label>
					<div class="controls">
						<input type="text" id="summary1" name="missionSummary" class="w-input"> 
						<a data-toggle="modal" href="<%=path%>/mission/refer" data-target="#missionModal">选择</a>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="devMgr">工作时间（小时）</label>
					<div class="controls">
						<input type="text" id="devMgr" name="product.devMgr" class="w-input">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="productMgr">完成比例</label>
					<div class="controls">
						<input type="text" id="productMgr" name="product.productMgr" class="w-input">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="desc">工作内容</label>
					<div class="controls">
						<textarea rows="3" id="desc" name="product.desc" class="w-input"></textarea>
					</div>
				</div>
			</div>
			<div class="control-group" id="function_box">
				<div class="controls">
					<button type="submit" class="btn btn-primary">保存</button>
					<a href="<%=path%>/product/list" class="btn">返回列表</a>
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
			<span id="myModalLabel">我的日报${today}</span>
		</div>
		<div class="modal-body">
			<!-- 加载远端 -->
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">关闭</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#frm_project").validate({
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