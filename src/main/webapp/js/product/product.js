window.console = window.console || {};
console.log || (console.log = opera.postError);
var ZtreeProduct;
//根据结构查询人员
	function wiz(nodeID,nodeName) {
		$("#parentModule").val(nodeName);
		$("#parentID").val(nodeID);
		hideMenu();
	}
	var setting = {
		async : {
			enable : true,
			url : "/project/product/tree",
			autoParam : ["treeNodeID=parent_id","level"],
			contentType : "application/x-www-form-urlencoded",
			dataType : 'json',
			type : "post"
		},
		check: {
			enable: false
		},
		view : {
			dblClickExpand: false
		},
		callback: {
			onAsyncSuccess : function(event, treeId, treeNode, msg) {
				var tree = $.fn.zTree.getZTreeObj(treeId);
				if (tree.getNodes().length > 0) {
					tree.expandNode(tree.getNodes()[0], true);
				}
			}
		}
	};
	function onAsyncSuccess(event, treeId, treeNode, msg){
		if(zTreeModule.getNodes().length>0){
			zTreeModule.expandNode(zTreeModule.getNodes()[0], true);
		}
	}
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
	function createModule(){
		$("#moduleForm").submit();
	}
	function delProduct(pid){
		if(window.confirm("是否要删除产品 ？")){
			window.location.href ="/project/product/delete?product_id=" + pid;
		}
	}
	$(document).ready(function() {
		ZtreeProduct = $.fn.zTree.init($("#treeProduct"), setting);
		$.fn.zTree.init($("#treeParentModule"), setting);
		$("body").bind("mousedown", onBodyDown);
	});