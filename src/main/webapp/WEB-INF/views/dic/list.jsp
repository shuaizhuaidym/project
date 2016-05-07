<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=path %>/css/bootstrap-responsive.min.css" rel="stylesheet" />
<title>字典管理</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	字典管理<%=request.getContextPath() %>
</body>
</html>