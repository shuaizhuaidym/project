package com.jit.project.product.bean;

import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {

	private Integer pageNumber = 1;
	private Integer pageSize = 10;
	@Override
	public String toSql(Entity<?> entity) {
		// TODO Auto-generated method stub
		return "1=1";
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
