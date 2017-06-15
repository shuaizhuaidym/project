<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出错了</title>
</head>
<body>
	<div style="padding-top:10%;margin:0 auto;text-align:center">
		<img src="<%=path%>/img/404.png" usemap="#phly" />

		<map name="phly">
			<area id="links" coords="390,333,526,366" alt="返回上一页" title="返回上一页" href="<%=path%>/back" />
			<area id="links" coords="536,333,622,366" alt="返回首页" title="返回首页" href="<%=path%>/" />
		</map>
	</div>
</body>
</html>