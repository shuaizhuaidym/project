<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>人力统计</title>

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<style type="text/css">
.wild10 {
	margin-bottom: 10px
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#items" data-toggle="tab">任务明细列表</a></li>
			<li><a href="#pre_sale" data-toggle="tab">售前统计</a></li>
			<li><a href="#post_sale" data-toggle="tab">售后统计</a></li>
			<li><a href="#improve" data-toggle="tab">持续改进统计</a></li>
			<li><a href="#product" data-toggle="tab">行业统计</a></li>
		</ul>
		<div class="row-fluid wild10">
			<b>开始日期</b><input type="text" style="height: 30px" /> <b>结束日期</b><input type="text" style="height: 30px" />
			<input type="hidden" id="group_type" name="group_type"/>
			<button class="btn btn-primary">统计</button>
		</div>
		<div class="tab-content">
			<div class="tab-pane active" id="items">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w4">序号</th>
								<th class="w12">项目名称</th>
								<th class="w8">行业</th>
								<th class="w8">工作类型</th>
								<th class="w8">项目经理</th>
								<th class="w36">工作内容</th>
								<th class="w6">负责人</th>
								<th class="w6">当前状态</th>
								<th class="w8">开始日期</th>
								<th class="w8">结束日期</th>
								<th class="w8">人力投入</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="msn" items="${obj}" varStatus="index">
								<tr>
									<td>${(pageNo-1)*pageSize + index.count}</td>
									<td>${msn.mission }</td>
									<td>${msn.industry}</td>
									<td>${msn.type}</td>
									<td>${msn.manager}</td>
									<td>${msn.content}</td>
									<td>${msn.engineer}</td>
									<td>${msn.state}</td>

									<td>${msn.startDate}</td>
									<td>${msn.endDate}</td>
									<td>${msn.investment}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="tab-pane" id="pre_sale">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p">序号</th>
								<th class="w50p">任务类型</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>售前开发和技术支持</td>
								<td>5</td>
								<td>21人天</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="post_sale">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p">序号</th>
								<th class="w50p">任务类型</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>售后开发和技术支持</td>
								<td>5</td>
								<td>21人天</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="improve">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p">序号</th>
								<th class="w50p">任务类型</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>持续改进</td>
								<td>3</td>
								<td>10人天</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane" id="product">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="w5p"">序号</th>
								<th class="w50p">行业</th>
								<th>任务数量</th>
								<th>人力投入</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>军工</td>
								<td>3</td>
								<td>20人天</td>
							</tr>
							<tr>
								<td>2</td>
								<td>财政</td>
								<td>3</td>
								<td>21人天</td>
							</tr>
							<tr>
								<td>3</td>
								<td>公安</td>
								<td>1</td>
								<td>2人天</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>