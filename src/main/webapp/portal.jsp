<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>我的首页</title>

<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 20px;
	padding-bottom: 40px;
}

.angle {
	border-radius: 0px;
	border: 1px #ddd solid;
}
/* Custom container */
.container-narrow {
	width: 85%;
	margin: 0 auto;
	padding-top: 40px
}

.panel-heading {
	height: 25px;
	line-height: 18px;
	background-color: #f1f1f1;
	border: 1px #ddd solid;
	border-bottom: 0;
	font-weight: 700;
	padding: 8px 60px 0px 6px;
	color: #333;
}

.table-defeat {
	border-top: 1px solid #ddd;
	word-wrap: break-word;
	word-break: break-all;
}

.table-defeat td {
	border-top: none;
	overflow: hidden;
}

.table-defeat tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th {
	background: #blue;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-narrow">
		<div class="hero-unit">
			<p>
			<h4>IPC黑板</h4>
			<p>
				Apache部署文档目录：http://172.16.5.251/svn/phoenix/src/modules_test/tools/apache搭建/Apache安装说明.txt <br />
				网关定制化开发路：http://172.16.5.251/svn/phoenix/定制化开发
			</p>
		</div>

		<div class="row-fluid marketing">
			<div class="span3">
				<div class="panel-heading">
					<span class="panel-title">我的缺陷</span><a href="#">[+]</a>
				</div>
				<table class="table angle table-defeat">
					<tr>
						<td style="width: 32px">编号</td>
						<td>缺陷描述</td>
					</tr>
					<tr>
						<td>2881</td>
						<td>任务描述XXX</td>
					</tr>
					<tr>
						<td>128</td>
						<td>Apache部署文档目录：http://172.16.5.oenix</td>
					</tr>
					<tr>
						<td>3692</td>
						<td>任务描hkjhjhjkh述</td>
					</tr>
				</table>
			</div>

			<div class="span9">
				<div class="panel-heading">
					<span class="panel-title">我的任务&nbsp;<a href="#">[写日报]</a></span>
				</div>
				<table class="table table-striped angle">
					<tbody>
						<tr>
							<td>任务名称</td>
							<td>任务类型</td>
							<td>任务描述</td>
						</tr>
						<tr>
							<td>财政服务端开发</td>
							<td>【功能开发】</td>
							<td>财政部支持SM2算法客户端+代理模块|静默安装包开发测试上线</td>
						</tr>
						<tr>
							<td>任务名称</td>
							<td>【功能开发】</td>
							<td>缺陷描述</td>
						</tr>
						<tr>
							<td>黑龙江省厅【项目支持】</td>
							<td>【功能开发】</td>
							<td>黑龙江省公安厅项目从I网关升级到E网关升级包制作，代码研发</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
</body>
</html>