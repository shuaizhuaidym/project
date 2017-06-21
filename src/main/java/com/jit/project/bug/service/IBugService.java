package com.jit.project.bug.service;

import org.nutz.dao.QueryResult;

import com.jit.project.bug.bean.Query;

public interface IBugService {
	public QueryResult query(Query vo);
}
