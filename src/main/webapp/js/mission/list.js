	var zTreeModule;
	var zTreeVersion;
	
	function wiz(nodeID) {
		//TODO 查询本节点相关的任务
		alert(nodeID);
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

	$(document).ready(function() {
		zTreeModule = $.fn.zTree.init($("#treeModule"), setting);
		zTreeVersion = $.fn.zTree.init($("#treeVersion"), setting);
	});
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});