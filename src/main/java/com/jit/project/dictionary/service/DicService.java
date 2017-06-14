package com.jit.project.dictionary.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.dictionary.bean.Dictionary;
import com.jit.project.dictionary.bean.Query;

public class DicService extends NameEntityService<Dictionary> implements
		com.jit.project.dictionary.service.IDicService {
	
	private static Map<String, Map<String, String>> cache = new HashMap<String, Map<String, String>>();

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
		pager.setRecordCount(dao().count(Dictionary.class, dic));

		return new QueryResult(list, pager);
	}

	/**
	 * 根据ID查询
	 */
	public Dictionary get(Integer id) {
		return this.dao().fetch(Dictionary.class, id);
	}
	
	/**
	 * @see com.jit.project.dictionary.service.IDicService
	 */
	@Override
	public Map<String, String> service(String type) {
		Map<String, String> dics = cache.get(type);
		if (dics == null || dics.isEmpty()) {
			dics = new LinkedHashMap<String, String>();
			QueryResult result = this.query(new Query(type));
			for (Dictionary dic : result.getList(Dictionary.class)) {
				dics.put(dic.getDicName(), dic.getDicName());
			}
			cache.put(type, dics);
		}
		return dics;
	}
}