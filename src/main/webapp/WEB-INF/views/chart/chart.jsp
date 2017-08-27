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
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/embed/chart.js"></script>

<style type="text/css">
	.box{border: 1px solid #ddd}
</style>
<script type="text/javascript">
var context="<%=path%>";
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a title="engineer" href="#engineer" data-toggle="tab">按负责人统计</a></li>
			<li><a title="issue_type" href="#issueType" data-toggle="tab">按问题分类统计</a></li>
			<li><a title="industry" href="#industry" data-toggle="tab">按行业统计</a></li>
			<li><a title="range" href="#range" data-toggle="tab">按时间段(按月分组)统计</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div id="condition">
				开始日期 <input id="dt_begin" type="text" name="begin" class="datetime"/>
				<span class="glyphicon glyphicon-search"></span>
				结束日期 <input id="dt_end" type="text" name="end" class="datetime"/> 
				<span class="glyphicon glyphicon-search"></span>
				<button id="btnChart" class="btn btn-danger">统计</button>
			</div>
			
			<div class="tab-pane fade in active chart-box" id="engineer">
				<img id="imgengineer" alt="imgChartEngineer" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="issueType">
				<img id="imgissue_type" alt="issue_type_pie" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="industry">
				<img id="imgindustry" alt="industry_pie" src=""/>
			</div>
			<div class="tab-pane fade chart-box" id="range">
				<img id="imgrange" alt="range_line" src=""/>
			</div>
		</div>
	</div>


</body>
</html>