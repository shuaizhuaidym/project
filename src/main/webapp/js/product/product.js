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
		$('#combo-tree').addClass('open');
	}
	function hideMenu() {
		$('#combo-tree').removeClass('open');
	}
	function onBodyDown(event) {
		if (!(event.target.id == "combo-tree" || event.target.id == "combo-tree" || $(event.target).parents("#combo-tree").length>0)) {
			hideMenu();
		}
	}
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeProduct"), setting);
		$.fn.zTree.init($("#treeParentModule"), setting);
		$("body").bind("mousedown", onBodyDown);
	});