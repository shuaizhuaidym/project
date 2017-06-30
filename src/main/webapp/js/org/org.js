	var zTreeObj;
	var rMenu;
	//根据结构查询人员
	function wiz(nodeID) {
		alert("查询部门ID为["+nodeID+"]的用户");
	}
	var setting = {
		async : {
			enable : true,
			url : "/project/org/tree",
			autoParam : [ "orgID=parent_id" ],
			contentType : "application/x-www-form-urlencoded",
			dataType : 'json',
			type : "post"
		},
		check: {
			enable: true
		},
		view : {
			dblClickExpand: false
		},
		callback: {
			onRightClick: OnRightClick
		}
	};
	function OnRightClick(event, treeId, treeNode) {
		if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
			zTreeObj.cancelSelectedNode();
			showRMenu("root", event.clientX, event.clientY);
		} else if (treeNode && !treeNode.noR) {
			zTreeObj.selectNode(treeNode);
			showRMenu("node", event.clientX, event.clientY);
		}
	}

	function showRMenu(type, x, y) {
		$("#rMenu ul").show();
		rMenu.css({"top":y+10 +"px", "left":x-15 +"px", "visibility":"visible"});

		$("body").bind("mousedown", onBodyMouseDown);
	}
	function hideRMenu() {
		if (rMenu) rMenu.css({"visibility": "hidden"});
		$("body").unbind("mousedown", onBodyMouseDown);
	}
	function onBodyMouseDown(event){
		if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
			rMenu.css({"visibility" : "hidden"});
		}
	}
	var addCount = 1;
	function addTreeNode() {
		hideRMenu();
		//TODO 异步提交,成功后刷新Tree
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
		$.fn.zTree.init($("#treeDemo"), setting);
	}
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting);
		rMenu = $("#rMenu");
	});