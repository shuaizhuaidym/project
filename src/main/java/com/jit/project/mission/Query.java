package com.jit.project.mission;

import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {
	private Integer pageNumber;

	private Integer pageSize;

	@Override
	public String toSql(Entity<?> entity) {
		// TODO Auto-generated method stub
		return null;
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
