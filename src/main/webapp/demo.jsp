<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bootstrap tables</title>

<link href="http://issues.wenzhixin.net.cn/bootstrap-table/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.css" rel="stylesheet" />

<script src="http://issues.wenzhixin.net.cn/bootstrap-table/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/locale/bootstrap-table-zh-CN.min.js"></script>

<script type="text/javascript">

	$('#example').bootstrapTable({
	    url: "<%=path%>/demo", 
	    dataType: "json",
	    pagination: true, //分页
	    singleSelect: false,
	    data-locale:"zh-US" , //表格汉化
	    search: true, //显示搜索框
	    sidePagination: "server", //服务端处理分页
        columns: [
                  {
                    title: '活动名称',
                      field: 'name',
                      align: 'center',
                      valign: 'middle'
                  }, 
                  {
                      title: '状态',
                      field: 'status',
                      align: 'center',
                      valign: 'middle',
                  }, 
                  {
                      title: '参与人数',
                      field: 'participationCounts',
                      align: 'center'
                  },
                  {
                      title: '总人数',
                      field: 'totalCounts',
                      align: 'center'
                  },
                  {
                      title: '开始时间',
                      field: 'startTime',
                      align: 'center',
                  },
                  {
                      title: '操作',
                      field: 'id',
                      align: 'center',
                      formatter:function(value,row,index){  
	                   var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
	                   var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
                       return e+d;  
                    } 
                  }
              ]
      });
	</script>
</head>
<body>

	<table id="example">
		<thead>
			<tr>
				<th>jj</th>
				<th>jj</th>
				<th>jj</th>
				<th>jj</th>
			</tr>
		</thead>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>

</body>
</html>