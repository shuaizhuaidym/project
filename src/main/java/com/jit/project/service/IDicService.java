package com.jit.project.service;

import org.nutz.dao.QueryResult;

import com.jit.project.bean.Dictionary;
import com.jit.project.bean.dic.Query;

/**
 * 字典管理类
 * @author daiyma
 *
 */
public interface IDicService {
	
	public void save(Dictionary dic);
	
	public void update(Dictionary dic);

	public QueryResult query(Query dic);
	
	public Dictionary get(Integer id);
}
