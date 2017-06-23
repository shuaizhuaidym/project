package com.jit.project.daily.service;

import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;
import org.nutz.service.NameEntityService;

import com.jit.project.daily.bean.DailyItem;

public class DailyItemServiceImpl extends NameEntityService<DailyItem> implements IDailyItemService {

	public DailyItem fetch(final String id) {
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where item_id = " + id;
				return sql;
			}
		};
		DailyItem item = this.fetch(cnd);
		return item;
	}
}
