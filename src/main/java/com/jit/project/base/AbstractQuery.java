package com.jit.project.base;

/**
 * 基础查询条件
 * 
 * @author yanming_dai
 * @date 2017年6月23日
 */
public abstract class AbstractQuery {
	private int pageNumber = 1;

	private int pageSize = 10;

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
