<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<!-- <div class="container"> -->
			<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="brand">项目管理系统</a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li class="active"><a href="${path}/project/portal">首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">项目管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path%>/form">项目新建</a></li>
							<li class="divider"></li>
							<li><a href="<%=path%>/query">项目检索</a></li>
						</ul>
					</li>
					<li><a href="<%=path %>/mission/query">任务管理</a></li>
					<li><a href="<%=path %>/product/list">产品维护</a></li>
					<li><a href="<%=path %>/daily/search">日报检索</a></li>
					<li><a href="<%=path %>/chart">图表分析</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">系统维护<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path %>/org/list">机构设置</a></li>
							<li><a href="<%=path %>/dic/list">字典设置</a></li>
							<li><a href="<%=path %>/dic/list">角色设置</a></li>
							<li><a href="<%=path %>/dic/list">权限设置</a></li>
						</ul>
					</li>
				</ul>
				<form class="navbar-form pull-right" action="<%=path%>/user/authenticate" method="post">
					<input type="text" name="account" class="span2" placeholder="Account"/>
					<input type="password" name="password" class="span2" placeholder="Password"/>
					<button type="submit" class="btn btn-success">登录</button>
					<a href="<%=path%>/user/logout">注销</a>
				</form>
			</div>
			<!--/.nav-collapse -->
		<!-- </div> -->
	</div>
</div>