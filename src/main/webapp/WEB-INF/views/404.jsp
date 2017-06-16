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
<title>出错了</title>
<script type="text/javascript">
	function goback() {
		window.location.href = document.referrer;
	}
</script>
</head>
<body>
	<div style="padding-top:10%;margin:0 auto;text-align:center">
		<img src="<%=path%>/img/404.png" usemap="#phly" style="border:0"/>

		<map name="phly">
			<area id="links" coords="390,333,526,366" alt="返回上一页" title="返回上一页" href="javascript:goback();" />
			<area id="links" coords="536,333,622,366" alt="返回首页" title="返回首页" href="<%=path%>/" />
		</map>
	</div>
</body>
</html>