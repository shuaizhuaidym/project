package com.jit.project.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 
 * <p>
 * Title:Org
 * </p>
 * <p>
 * Description:简单组织机构实体
 * </p>
 * 
 * @author daiyma
 * @date 2016年6月9日
 */
@Table("t_organization")
public class Organization {
	@Id
	@Column("org_id")
	private int orgID;
	
	@Column("org_name")
	private String orgName;
	
	@Column("desc")
	private String desc;
	
	@Column("parent_id")
	private int parentID;// 上级
	
	@Column("status")
	private int status;// 状态，0：正常/1：停用

	public int getOrgID() {
		return orgID;
	}

	public void setOrgID(int id) {
		this.orgID = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getParentID() {
		return parentID;
	}

	public void setParentID(int parentID) {
		this.parentID = parentID;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
