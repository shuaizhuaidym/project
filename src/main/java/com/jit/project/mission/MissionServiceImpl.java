package com.jit.project.mission;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
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
			private static final long serialVersionUID = -5219476242036743695L;

			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + id;
				return sql;
			}
		};
		return this.fetch(cnd);
	}
	
	/**
	 * 统计任务工时
	 * @param missionID
	 * @return
	 */
	public Integer countHourse(Integer missionID) {
		Sql sql = Sqls.create("SELECT SUM(hours) FROM t_daily_item WHERE mission_id=@missionID");
		sql.params().set("missionID", missionID);
//		sql.setCallback(Sqls.callback.integer());
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				if (rs.next()) {
					return rs.getInt(1);
				}
				return 0;
			}
		});
		this.dao().execute(sql);
		return sql.getInt();
	}
}