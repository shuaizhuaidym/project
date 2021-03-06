//选择模块节点
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
$(function(){
	$.fn.zTree.init($("#treeParentModule"), setting);
	$("body").bind("mousedown", onBodyDown);
});