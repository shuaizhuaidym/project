	var zTreeObj;
	var rMenu;
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
	var addCount = 1;
	function addTreeNode() {
		hideRMenu();
		//TODO Model+异步提交,成功后刷新Tree
		var cur=zTreeObj.getSelectedNodes()[0];
		var newNode = { treeNodeName:"增加" + (addCount++)};
		if (zTreeObj.getSelectedNodes()[0]) {
			newNode.checked = zTreeObj.getSelectedNodes()[0].checked;
			zTreeObj.addNodes(cur, newNode);
		} else {
			zTreeObj.addNodes(null, newNode);
		}
		window.location.href="/project/user/form?orgID="+cur.orgID;
	}

	//按钮事件
	function addDirectly(orgID){
		window.location.href="/project/user/form?orgID="+orgID;
	}
	
	function resetTree() {
		hideRMenu();
		$.fn.zTree.init($("#treeProduct"), setting);
	}
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeProduct"), setting);
		rMenu = $("#rMenu");
	});