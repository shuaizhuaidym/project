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
					<li class="dropdown" id="menu_project">
						<a data-target="menu_project" href="menu_project" class="dropdown-toggle" data-toggle="dropdown">项目管理 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path%>/form">项目新建</a></li>
							<li class="divider"></li>
							<li><a href="<%=path%>/query">项目检索</a></li>
						</ul>
					</li>
					<li><a href="<%=path %>/mission/query">任务管理</a></li>
					<li class="dropdown" id="menu_product">
						<a data-target="menu_product" href="menu_product" class="dropdown-toggle" data-toggle="dropdown">产品管理<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path %>/product/list?query.parentID=-1">产品维护</a></li>
							<li class="divider"></li>
							<li><a href="<%=path %>/product/version">版本维护</a></li>
						</ul>
					</li>
					<li><a href="<%=path %>/daily/search">日报检索</a></li>
					
					<li class="dropdown" id="menu_statistics">
						<a data-target="menu_project" href="menu_statistics" class="dropdown-toggle" data-toggle="dropdown">统计分析<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path %>/labor_count_index">报表统计</a></li>
							<li class="divider"></li>
							<li><a href="<%=path %>/chart">图表分析</a></li>
						</ul>
					</li>
					<li class="dropdown" id="menu_system">
						<a data-target="menu_system" href="#" class="dropdown-toggle" data-toggle="dropdown">系统维护<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=path %>/org/list">机构设置</a></li>
							<li class="divider"></li>
							<li><a href="<%=path %>/dic/list">字典设置</a></li>
							<li class="divider"></li>
							<li><a href="<%=path %>/dic/list">角色设置</a></li>
							<li class="divider"></li>
							<li><a href="<%=path %>/dic/list">权限设置</a></li>
						</ul>
					</li>
				</ul>
				<form class="navbar-form pull-right" action="<%=path%>/user/authenticate" method="post">
					<a href="<%=path%>/user/logout" class="btn btn-inverse">注销</a>
				</form>
			</div>
			<!--/.nav-collapse -->
		<!-- </div> -->
	</div>
</div>