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
		</ul>
		<div id="myTabContent" class="tab-content">
			<div id="condition" style="margin:0 auto;text-align:center;border-bottom:2px #ddd solid;padding-bbotom:3px">
				开始日期 <input type="text" name="startDate" />
				<span class="glyphicon glyphicon-search"></span> 
				结束日期 <input type="text" name="endDate" /> 
				<span class="glyphicon glyphicon-search"></span>
				<button class="btn btn-danger">统计</button>
			</div>
			
			<div class="tab-pane fade in active" id="engineer">
				<p>负责人统计图</p>
				<hr />
				饼图|柱状图|曲线图
			</div>
			<div class="tab-pane fade" id="category">
				<p>分类统计图</p>
				<hr />
				饼图|柱状图|曲线图
			</div>
			<div class="tab-pane fade" id="product">
				<p>分类统计图</p>
				<hr />
				饼图|柱状图|曲线图
			</div>			
		</div>
	</div>


</body>
<script type="text/javascript">
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	})
</script>
</html>