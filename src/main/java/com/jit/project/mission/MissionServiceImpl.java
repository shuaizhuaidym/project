package com.jit.project.mission;

import java.util.List;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

public class MissionServiceImpl extends NameEntityService<Mission> implements IMissionService {

	public QueryResult query(Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(this.dao().count(Mission.class, vo));
		List<Mission> list = dao().query(Mission.class, vo, pager);
		return new QueryResult(list, pager);
	}
}