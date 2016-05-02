<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="brand">项目管理系统</a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li class="active"><a href="${path}/project/">首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">项目管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Another action</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
					<li><a href="#about">报表分析</a></li>
					<li><a href="<%=path %>/dic/list">字典设置</a></li>
					<li><a href="#about">更多</a></li>
				</ul>
				<form class="navbar-form pull-right">
					<input class="span2" type="text" placeholder="Email"> <input class="span2" type="password" placeholder="Password">
					<button type="submit" class="btn btn-success">登录</button>
				</form>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>