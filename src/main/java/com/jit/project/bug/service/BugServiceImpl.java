package com.jit.project.bug.service;

import java.util.List;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.bug.bean.Bug;
import com.jit.project.bug.bean.Query;

public class BugServiceImpl extends NameEntityService<Bug> implements IBugService {
	
	public QueryResult query(Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(this.dao().count(Bug.class, vo));
		List<Bug> list = dao().query(Bug.class, vo, pager);
		return new QueryResult(list, pager);
	}
}
