<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
	Date today = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>我的首页</title>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path%>/css/portal.css" rel="stylesheet" />
<link href="<%=path%>/css/list.css" rel="stylesheet" />

<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-collapse.js"></script>

<script type="text/javascript" src="<%=path%>/js/portal.js"></script>
<script type="text/javascript">
	$(function(){
		var browser=navigator.appName;
		if(browser.indexOf("Microsoft", 0)>=0){
			
		}
	});
	function paging(fid) {
		$.ajax({
			cache : false,
			type : "POST",
			url : $('#' + fid).attr('action'),
			data : $('#' + fid).serialize(),
			async : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				$("#" + fid + "-box").html(data);
			}
		});
	}
</script>
</head>
<body style="font-family: 宋体,Helvetica,Arial,sans-serif;">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-narrow">
		<div class="panel-heading">
			<span class="panel-title">常用地址<a data-toggle="collapse" href="#notice"><i class="icon-flag"></i></a></span>
		</div>
		<div id="notice" class="hero-unit collapse">
				Apache部署文档目录：http://172.16.5.251/svn/phoenix/src/modules_test/tools/apache搭建/Apache安装说明.txt <br />
				网关定制化开发路：http://172.16.5.251/svn/phoenix/定制化开发
		</div>

		<div class="row-fluid marketing">
			<div class="span3">
				<div class="panel-heading">
					<span class="panel-title">我的缺陷</span>
				</div>
				<div id="bugForm-box">
					<!-- BUG列表 -->
				</div>
			</div>

			<div class="span9">
				<div class="panel-heading">
					<span class="panel-title">我的任务&nbsp; 
					<a href="<%=path%>/daily/form"> <i class="icon-calendar" title="写日报"></i>写日报</a>
					</span>
				</div>
				<div id="missionForm-box">
					<!-- 任务列表 -->
				</div>
				<div class="panel-heading">
					<span class="panel-title">我的项目</span>
				</div>
				<div id="projectForm-box">
					<!-- 项目列表 -->
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>
</html>