<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%@page import="java.util.Date"%>
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
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-narrow">
		<div class="panel-heading">
			<span class="panel-title">常用地址<a data-toggle="collapse" data-target="notice" title="展开"><i class="icon-flag" title="展开"></i></a></span>
		</div>
		<div id="notice" class="hero-unit collapse in">
				Apache部署文档目录：http://172.16.5.251/svn/phoenix/src/modules_test/tools/apache搭建/Apache安装说明.txt <br />
				网关定制化开发路：http://172.16.5.251/svn/phoenix/定制化开发
		</div>

		<div class="row-fluid marketing">
			<div class="span3">
				<div class="panel-heading">
					<span class="panel-title">我的缺陷<a href="<%=path%>/defeat/claim" title="认领缺陷"><i class="icon-flag" title="写日报"></i></a></span>
				</div>
				<div id="bugForm-box">
					<!-- BUG列表 -->
				</div>
			</div>

			<div class="span9">
				<div class="panel-heading">
					<span class="panel-title">我的任务&nbsp; <a data-toggle="modal" href="<%=path%>/daily/window" data-target="#dailyModal">
							<i class=" icon-list-alt" title="写日报"></i>
					</a> <a href="<%=path%>/daily/form"> <i class=" icon-list-alt" title="写日报"></i></a>
					</span>
				</div>
				<div id="missionForm-box">
					<!-- 任务列表 -->
				</div>
			</div>

		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<div id="dailyModal" class="modal hide fade" tabindex="-1">
		<div class="modal-header form-title">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<span id="myModalLabel">我的日报<f:formatDate value="<%=today%>" pattern="yyyy-MM-dd" /></span>
		</div>
		<div class="modal-body">
			<!-- 加载远端日报页面 -->
		</div>
		<div class="modal-footer">
			<button id="btnAppend" class="btn btn-warning">新增条目</button>
			<button id="btnSave"data-dismiss="modal" aria-hidden="true" class="btn btn-primary">保存</button>
			<button id="btnDelete" class="btn btn-danger">删除</button>
		</div>
	</div>
</body>
</html>