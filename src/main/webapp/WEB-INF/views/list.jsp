<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="/WEB-INF/tags"%>
<%@taglib prefix="ui" uri="/WEB-INF/tags/select"%>

<%@page import="org.nutz.dao.pager.Pager"%>
<%@page import="org.nutz.dao.QueryResult"%>
<%@page import="com.jit.project.bean.Query"%>
<%String path = request.getContextPath(); %>
<%
	Query query = (Query) request.getAttribute("query");
	QueryResult rst = (QueryResult) request.getAttribute("result");
	Pager pager = rst.getPager();
%>
<%
	int pageNo = pager.getPageNumber();
	int pageSize = pager.getPageSize();
	pageContext.setAttribute("pageNo", pageNo);
	pageContext.setAttribute("pageSize", pageSize);
	int totalCount = pager.getRecordCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>项目列表</title>

<link href="<%=path %>/css/list.css" rel="stylesheet" />
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path %>/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-multiselect.css" rel="stylesheet" />

<style type="text/css">.compress{overflow: hidden}</style>

<script type="text/javascript" src="<%=path %>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap-dropdown.js"></script>

<script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
	$(function() {
		var datePks=$("#queryForm").find("input.datetime");
		datePks.each(function(){
			$(this).datetimepicker({
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				format:"yyyy-mm-dd"
			});
		});
		$("#btnExport").click(function(){
			$("#queryForm").attr("action","<%=path%>/prj_export");
			$("#queryForm").submit();
		});
		$("#btnQuery").click(function(){
			$("#queryForm").attr("action","<%=path%>/query");
			$("#queryForm").submit();
		});
		
		var old="<%=query.getStatus()%>";
		setBtnText(old);
		$("label.checkbox > input").click(function(e) {
			e.stopPropagation();//实现多选
			var chkd="";
			var cbx = $("input[type=checkbox]");
			cbx.each(function() {
				if(this.checked)
					chkd += this.value+",";
			});
			setBtnText(chkd);
		});
		$("label.checkbox > input").each(function() {
			if (old.indexOf(this.value) >= 0) {
				this.checked = "checked";
			}
		});
	});
	function setBtnText(txt){
		if(txt && txt!="null"){
			$("span.multiselect-selected-text").html(txt.length>10?txt.substring(0,9)+"...":txt);//represent
		}else{
			$("span.multiselect-selected-text").html("当前状态");//represent
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<fieldset>
			<legend>
				<span>
					项目列表<a href="<%=path%>/form" style="margin-left: 50px;color:white">+新建项目</a>
				</span>
			</legend>
		</fieldset>
			<form id="queryForm" action="<%=path%>/query" method="post">
			<div class="table-responsive">
				<table class="table table-bordered table-striped">
					<tr>
						<td>项目名称</td>
						<td class="w12"><input type="text" name="query.prjName" class="qt" value="<%=query.getPrjName()%>" /></td>
						<td class="w12">状态</td>
						<td>
							<div class="btn-group wp98">
								<button id="btnm" class="wp100 dropdown-toggle btn btn-default compress" data-toggle="dropdown" type="button" title="None selected"
									aria-expanded="true">
									<span class="multiselect-selected-text">当前状态</span> <b class="caret"></b>
								</button>

								<ul id="ctn" class="multiselect-container dropdown-menu wp100">
									<li><a> <label class="checkbox"> <input type="checkbox" name="query.status" value="未开始">
												未开始
										</label>
									</a></li>
									<li><a> <label class="checkbox"> <input type="checkbox" name="query.status" value="进行中">
												进行中
										</label>
									</a></li>
									<li><a> <label class="checkbox"> <input type="checkbox" name="query.status" value="暂停">
												暂停
										</label>
									</a></li>
									<li><a> <label class="checkbox"> <input type="checkbox" name="query.status" value="已完成">
												已完成
										</label>
									</a></li>
									<li><a> <label class="checkbox"> <input type="checkbox" name="query.status" value="等待反馈">
												等待反馈
										</label>
									</a></li>
								</ul>
							</div>
						</td>
						<td>负责人</td>
						<td class="w12">
							<ui:select name="query.engineer" path="${query.engineer}" items="${mpEngineer}" style="width:98%"></ui:select>
						</td>
						<td>报告人</td>
						<td class="w12">
							<input type="text" name="query.reporter" value="${query.reporter}" style="width:98%"/>
						</td>
						<td style="text-align: center" rowspan="2">
							<button type="button" id="btnQuery" value="查询" class="btn btn-primary" style="width:98%;margin-bottom:16px">查询</button><br/>
							<button type="button" id="btnExport" name="_export" value="true" class="btn btn-success" style="width:98%">导出EXCEL</button>
						</td>
					</tr>
					<tr>
						<td>反馈日期(起)</td><td>
						<input type="text" id="sub_date1" name="query.submitDate1" class="datetime wp98" /></td>
						<td>反馈日期(止)</td>
						<td><input type="text" id="sub_date2" name="query.submitDate2" class="datetime wp98" /></td>
						<td>更新日期(起)</td>
						<td><input type="text" id="resp_date1" name="query.lastRespDate1" class="datetime wp98" /></td>
						<td>更新日期(止)</td>
						<td><input type="text" id="resp_date2" name="query.lastRespDate2" class="datetime wp98" /></td>
					</tr>
				</table>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="w4">序号</th>
							<th class="w12">项目名称</th>
							<th class="w8">问题类型</th>
							<th class="w36">详细描述</th>
							<th class="w8">反馈日期</th>
							<th class="w8"> 更新日期</th>
							<th class="w6">负责人</th>
							<th class="w6">当前状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prj" items="<%=rst.getList()%>" varStatus="index">
							<tr><!--  style="background-color:${prj.color}" -->
								<td>${(pageNo-1)*pageSize + index.count}</td>
								<td><a href="/project/edit?prjid=${prj.prjID}">${prj.prjName}</a></td>
								<td>${prj.issueType}</td>
								<td>${prj.shortDesc}</td>
								<td>${prj.localSubmitDate}</td>
								<td>${prj.localLastResponse}</td>
								<td>${prj.engineer}</td>
								<td>${prj.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<pg:page pageNo="<%=pageNo%>" currentClass="active" pageSize="<%=pageSize%>" totalCount="<%=totalCount%>">
			</pg:page>
			</form>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<!-- /container -->

</body>
</html>