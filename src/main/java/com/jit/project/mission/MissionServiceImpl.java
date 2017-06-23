package com.jit.project.mission;

import java.util.List;

import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

public class MissionServiceImpl extends NameEntityService<Mission> implements IMissionService {

	public QueryResult query(Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(this.dao().count(Mission.class, vo));
		List<Mission> list = dao().query(Mission.class, vo, pager);
		return new QueryResult(list, pager);
	}

	public Mission fetch(final String id) {
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + id;
				return sql;
			}
		};
		return this.fetch(cnd);
	}
}