<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%response.sendRedirect("query"); %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>IPC项目管理平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project">
<meta name="author" content="yanming_dai">

<script type="text/javascript" src="js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-dropdown.js"></script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/commom.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 20px;
	padding-bottom: 40px;
}

/* Custom container */
.container-narrow {
	margin: 0 auto;
	max-width: 700px;
	padding-top:40px
}
</style>
<link href="Template%20%C2%B7%20Bootstrap_files/bootstrap-responsive.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

<style class="firebugResetStyles" type="text/css" charset="utf-8">/* See license.txt for terms of usage */

/** reset styling **/
.firebugResetStyles {
	z-index: 2147483646 !important;
	top: 0 !important;
	left: 0 !important;
	display: block !important;
	border: 0 none !important;
	margin: 0 !important;
	padding: 0 !important;
	outline: 0 !important;
	min-width: 0 !important;
	max-width: none !important;
	min-height: 0 !important;
	max-height: none !important;
	position: fixed !important;
	transform: rotate(0deg) !important;
	transform-origin: 50% 50% !important;
	border-radius: 0 !important;
	box-shadow: none !important;
	background: transparent none !important;
	pointer-events: none !important;
	white-space: normal !important;
}

style.firebugResetStyles {
	display: none !important;
}

.firebugBlockBackgroundColor {
	background-color: transparent !important;
}

.firebugResetStyles:before,.firebugResetStyles:after {
	content: "" !important;
}

/**actual styling to be modified by firebug theme**/
.firebugCanvas {
	display: none !important;
}

.firebugLayoutBox {
	width: auto !important;
	position: static !important;
}

.firebugLayoutBoxOffset {
	opacity: 0.8 !important;
	position: fixed !important;
}

.firebugLayoutLine {
	opacity: 0.4 !important;
	background-color: #000000 !important;
}

.firebugLayoutLineLeft,.firebugLayoutLineRight {
	width: 1px !important;
	height: 100% !important;
}

.firebugLayoutLineTop,.firebugLayoutLineBottom {
	width: 100% !important;
	height: 1px !important;
}

.firebugLayoutBoxParent {
	border-top: 0 none !important;
	border-right: 1px dashed #E00 !important;
	border-bottom: 1px dashed #E00 !important;
	border-left: 0 none !important;
	position: fixed !important;
	width: auto !important;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-narrow">
		<div class="hero-unit">
			<p>
			<h4>日常通知</h4>
			Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo,
				tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			</p>
		</div>

		<div class="row-fluid marketing">
			<div class="span3">
				<p><a href="svn://172.16.5.251" target="_blank"><img alt="" src="img/svn.png"/></a></p>
				<p><a href="https://124.207.169.68/" target="_blank"><img alt="" src="img/gw.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
			</div>

			<div class="span3">
				<p><a href="http://172.16.5.30:8080/qcbin/start_a.htm" target="_blank"><img alt="" src="img/qc.png"/></a></p>
				<p><a href="#"><img alt="" src="img/bug.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
			</div>
			<div class="span3">
				<p><a href="http://172.16.13.168/redmine/" target="_blank"><img alt="" src="img/redmine.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
			</div>

			<div class="span3">
				<p><a href="http://172.16.5.252:9180/hudson/view/Phoenix/" target="_blank"><img alt="" src="img/jenkins.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
				<p><a href="#"><img alt="" src="img/blank.png"/></a></p>
			</div>			
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

</body>
</html>