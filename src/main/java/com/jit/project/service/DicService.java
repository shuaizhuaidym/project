package com.jit.project.service;

import java.util.List;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.bean.Dictionary;
import com.jit.project.bean.dic.Query;

public class DicService extends NameEntityService<Dictionary> implements IDicService {

	/**
	 * 新增字典
	 */
	public void save(Dictionary dic) {
		this.dao().insert(dic);
	}

	/**
	 * 更新字典
	 */
	public void update(Dictionary dic) {
		this.dao().update(dic);
	}

	/**
	 * 分页查询
	 * 
	 * @param Query
	 * @return
	 */
	public QueryResult query(Query dic) {
		Pager pager = this.dao().createPager(dic.getPageNumber(), dic.getPageSize());
		
		List<Dictionary> list = dao().query(Dictionary.class, dic, pager);
		pager.setRecordCount(dao().count(Dictionary.class,dic));
		
		return new QueryResult(list, pager);
	}
	
	/**
	 * 根据ID查询
	 */
	public Dictionary get(Integer id) {
		return this.dao().fetch(Dictionary.class, id);
	}
}