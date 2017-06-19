<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="/WEB-INF/tags/select"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %> 
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>编辑产品信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<%=path%>/css/commom.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/kindediter/themes/default/default.css" />
<style type="text/css">
.w-input {
	width: 92%
}

textarea {
	display: block;
}
.table td,th{padding:2px 5px 8px 5px}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-dropdown.js"></script>

<script type="text/javascript" src="<%=path%>/js/jquery-validation-1.9.0/jquery.validate.js"></script>
<script charset="utf-8" src="<%=path %>/kindediter/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=path %>/kindediter/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {	
		editor = K.create('textarea[name="product.desc"]', {
			resizeType : 0,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="row-fluid">
		<div class="span8 offset2 bordered">
			<fieldset>
				<legend><span>编辑产品信息</span></legend>
			</fieldset>
			<form class="form-horizontal" action="<%=path%>/product/create" method="post">
				<input type="hidden" name="product.productID" value="${obj.productID}"/>
				<div class="control-group">
					<label class="control-label" for="productName">产品名称</label>
					<div class="controls">
						<input type="text" id="productName" name="product.productName" value="${obj.productName}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="code">产品代号</label>
					<div class="controls">
						<input type="text" id="code" name="product.code" value="${obj.code}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="devMgr">研发经理</label>
					<div class="controls">
						<input type="text" id="devMgr" name="product.devMgr" value="${obj.devMgr}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="productMgr">产品经理</label>
					<div class="controls">
						<input type="text" id="productMgr" name="product.productMgr" value="${obj.productMgr}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="testMgr">测试经理</label>
					<div class="controls">
						<input type="text" id="testMgr" name="product.testMgr" value="${obj.testMgr}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="releaseVersion">最新版本</label>
					<div class="controls">
						<input type="text" id="releaseVersion" name="product.releaseVersion" value="${obj.releaseVersion}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="releaseDate">发布时间</label>
					<div class="controls">
						<input type="text" id="releaseDate" name="product.releaseDate" value="<f:formatDate value="${obj.releaseDate}" pattern="yyyy-MM-dd" />">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="desc">产品描述</label>
					<div class="controls">
						<textarea rows="3" id="desc" name="product.desc"  class="w-input">${obj.desc}</textarea>
					</div>
				</div>
<!-- 				<div class="control-group">
					<div class="controls">
						<label class="checkbox">
							<input type="checkbox" checked="checked" id="available" name="dic.available">是否启用
						</label>
					</div>
				</div> -->
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">保存</button>
						<a href="<%=path %>/product/list" class="btn">返回列表</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>