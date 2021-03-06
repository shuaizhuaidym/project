	var zTreeModule;
	var zTreeVersion;
	
	function wiz(nodeID,nodeName) {
		try{
			$("#module").val(nodeName);
			goPagequeryForm(1);
		}catch(e){
			$("#queryForm").submit();
		}
	}
	
	var setting = {
			async : {
				enable : true,
				url : "/project/product/tree",
				autoParam : [ "treeNodeID=parent_id" ],
				otherParam: ["view_type", "0"],
				contentType : "application/x-www-form-urlencoded",
				dataType : 'json',
				type : "post"
			},
			callback: {
				onAsyncSuccess : function (event, treeId, treeNode, msg){
					var tree = $.fn.zTree.getZTreeObj(treeId);
					if (tree.getNodes().length > 0) {
						tree.expandNode(tree.getNodes()[0], true);
					}
				}
			}
		};
	var versionSetting = {
			async : {
				enable : true,
				url : "/project/product/tree",
				autoParam : [ "treeNodeID=parent_id" ],
				otherParam: ["view_type", "1"],
				contentType : "application/x-www-form-urlencoded",
				dataType : 'json',
				type : "post"
			},
			callback: {
				onAsyncSuccess : function (event, treeId, treeNode, msg){
					var tree = $.fn.zTree.getZTreeObj(treeId);
					if (tree.getNodes().length > 0) {
						tree.expandNode(tree.getNodes()[0], true);
					}
				}
			}
		};
	
	$(document).ready(function() {
		zTreeModule = $.fn.zTree.init($("#treeModule"), setting);
		zTreeVersion = $.fn.zTree.init($("#treeVersion"), setting);
	});
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	/**
	 * 日期控件初始化
	 */
	$(function() {
		var datePks = $("#mission_query_form").find("input.datetime");
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

	});