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
$(function() {
	var datePks = $("#frm_mission").find("input.datetime");
	datePks.each(function() {
		$(this).datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			format : "yyyy-mm-dd"
		});
	});
	$.fn.zTree.init($("#treeParentModule"), setting);
	$("body").bind("mousedown", onBodyDown);
});
$(function() {
	$("#frm_project").validate({
		errorPlacement : function(error, element) {
			//error.addClass( "ui red pointing label transition" );
			//error.insertAfter( element.parent() );
		},
		highlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "red");
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "#ccc");
		}
	});
});