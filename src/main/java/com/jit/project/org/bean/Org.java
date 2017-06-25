package com.jit.project.org.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

import com.jit.project.bean.AbstractTreeNode;

@Table("t_org")
public class Org extends AbstractTreeNode{

	@Id
	@Column("org_id")
	private Integer orgID;
	
	@Name
	@Column("org_name")
	private String orgName;
	
	@Column("alias")
	private String alias;
	
	@Column("parent_id")
	private Integer parentID;
	
	@Column("path")
	private String path;
	
	@Column("introduction")
	private String introduction;
	
	public Integer getOrgID() {
		return orgID;
	}

	public void setOrgID(Integer orgID) {
		this.orgID = orgID;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getParentID() {
		return parentID;
	}

	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	@Override
	public boolean isParent() {
		return true;
	}

	@Override
	public String getClick() {
		return "wiz(" + orgID + ");";
	}

	@Override
	public String getTreeNodeID() {
		return orgID + "";
	}

	@Override
	public String getTreeNodeName() {
		return orgName;
	}
}
