package com.jit.project.service;

import java.util.List;

import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.bean.Project;
import com.jit.project.bean.Query;

public class PrjService extends NameEntityService<Project> implements IPrjService {

	/**
	 * 新建工程
	 * 
	 * @param p
	 */
	public void add(Project p) {
		Dao dao = this.dao();
		dao.insert(p);
	}

	/**
	 * 根据ID加载
	 * 
	 * @param id
	 * @return
	 */
	public Project fetch(long id) {
		return dao().fetch(Project.class, id);
	}

	/**
	 * 更新
	 * 
	 * @param p
	 */
	public void update(Project p) {
		this.dao().update(p);
	}

	/**
	 * 分页查询
	 * 
	 * @param dao
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public QueryResult query(Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(dao().count(Project.class,vo));
		List<Project> list = dao().query(Project.class, vo, pager);
		return new QueryResult(list, pager);
	}
}
