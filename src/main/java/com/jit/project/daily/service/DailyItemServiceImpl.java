package com.jit.project.daily.service;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;
import org.nutz.service.NameEntityService;

import com.jit.project.daily.bean.DailyItem;
import com.jit.project.mission.History;

public class DailyItemServiceImpl extends NameEntityService<DailyItem> implements IDailyItemService {

	public DailyItem fetch(final String id) {
		Condition cnd = new Condition() {
			private static final long serialVersionUID = -8126860701025947522L;

			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where item_id = " + id;
				return sql;
			}
		};
		DailyItem item = this.fetch(cnd);
		return item;
	}
	
	public List<History> queryByMissionID(String missionID){
		return dao().query(History.class, Cnd.where("mission_id", "=", missionID));
	}
}
