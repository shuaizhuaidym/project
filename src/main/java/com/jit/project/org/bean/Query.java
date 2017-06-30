package com.jit.project.org.bean;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {

	private Integer pageNumber = 1;

	private Integer pageSize = 15;

	private String orgID;

	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder buf = new StringBuilder("1=1");
		if (StringUtils.isNoneEmpty(orgID)) {
			buf.append(" and org_id=").append(orgID);
		}
		return buf.toString();
	}

	public String getOrgID() {
		return orgID;
	}

	public void setOrgID(String orgID) {
		this.orgID = orgID;
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
