<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请选择关联任务</title>

<script type="text/javascript">
	function confirm(){
		window.opener.refer("child");
		window.close();
	}
</script>
</head>
<body>
<input type="button" value="refer" onclick="confirm();"/>
</body>
</html>