<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报表分析</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="<%=path%>/css/chart.css" rel="stylesheet" />

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>

<style type="text/css">
	.box{border: 1px solid #ddd}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#engineer" data-toggle="tab">按负责人统计</a></li>
			<li><a href="#category" data-toggle="tab">按问题分类统计</a></li>
			<li><a href="#product" data-toggle="tab">按行业统计</a></li>
			<li><a href="#range" data-toggle="tab">按时间段统计</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div id="condition">
				开始日期 <input type="text" name="startDate" />
				<span class="glyphicon glyphicon-search"></span>
				结束日期 <input type="text" name="endDate" /> 
				<span class="glyphicon glyphicon-search"></span>
				<button id="btnChart" class="btn btn-danger">统计</button>
			</div>
			
			<div class="tab-pane fade in active chart-box" id="engineer">
				<img id="imgChartEngineer" alt="imgChartEngineer" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="category">
				<img id="imgChartIssue_type" alt="issue_type_pie" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="product">
				<img id="imgChartIssue" alt="industry_pie" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="range">
				<img id="imgChartRange" alt="range_line" src=""/>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	})
	$("#btnChart").click(function(){
		var tab=$("#myTab").find("li.active a:first");
		var type=tab.html();
		if("按负责人统计"==type){
			$("#imgChartEngineer").attr("src","<%=path%>/engineer_bar");
		}else if("按问题分类统计"==type){
			$("#imgChartIssue_type").attr("src","<%=path%>/issue_type_pie");
		}else if("按行业统计"==type){
			$("#imgChartIssue").attr("src","<%=path%>/industry_pie");
		}else{
			$("#imgChartRange").attr("src","<%=path%>/range_line");
		}
	});
});
</script>
</html>