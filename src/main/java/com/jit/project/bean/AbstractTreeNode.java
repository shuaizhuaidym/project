package com.jit.project.bean;

/**
 * 处理树状结构，所有需要转换为JSON在界面展现为tree的实体扩展该类
 * <p>Title:AbstractTreeNode</p>
 * <p>Description:</p>
 * @author daiyma
 * @date 2017年6月25日
 */
public abstract class AbstractTreeNode {
	String treeNodeID;
	
	String treeNodeName;
	
	String click;
	
	boolean isParent =true;

	public abstract String getTreeNodeID();

	public abstract String getTreeNodeName();
	
	public abstract String getClick();
	
	public abstract boolean isParent();
}
