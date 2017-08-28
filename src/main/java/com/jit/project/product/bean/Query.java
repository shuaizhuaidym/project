package com.jit.project.product.bean;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {

	private static final long serialVersionUID = 5392117624243007186L;
	
	private Integer pageNumber = 1;
	private Integer pageSize = 15;
	
	String parentID;
	
	public Query() {
		super();
	}
	
	public Query(String parentID) {
		super();
		this.parentID = parentID;
	}
	
	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder bd = new StringBuilder("1=1 ");

		if (StringUtils.isNotEmpty(parentID)) {
			bd.append(" and parent_id!=").append(this.parentID);
		}
		return bd.toString();
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
	public String getParentID() {
		return parentID;
	}
	public void setParentID(String parentID) {
		this.parentID = parentID;
	}
}
