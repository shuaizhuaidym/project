package com.jit.project.mission;

import org.nutz.dao.QueryResult;

public interface IMissionService {
	/**
	 * 分页查询
	 * @param vo 查询条件
	 * @return
	 */
	public QueryResult query(Query vo);
}
