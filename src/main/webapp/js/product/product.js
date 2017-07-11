window.console = window.console || {};
console.log || (console.log = opera.postError);
var zTreeObj;
	//根据结构查询人员
	function wiz(nodeID) {
		alert("查询部门ID为["+nodeID+"]的用户");
	}
	var setting = {
		async : {
			enable : true,
			url : "/project/product/tree",
			autoParam : [ "treeNodeID=parent_id","level" ],
			contentType : "application/x-www-form-urlencoded",
			dataType : 'json',
			type : "post"
		},
		check: {
			enable: false
		},
		view : {
			dblClickExpand: false
		}
	};
	function showMenu() {
		var parentInput = $("#parentModule");
		var offset = parentInput.offset();
		$("#menuContent").css({top:104+'px',left:769+'px'}).slideDown();
		console.log(offset.left+":"+offset.top);
		console.log($("#menuContent").css('left')+":"+$("#menuContent").css('top'));
		
	}
	function hideMenu() {
		$("#menuContent").fadeOut();
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeProduct"), setting);
		$.fn.zTree.init($("#treeParentModule"), setting);
		$("body").bind("mousedown", onBodyDown);
	});