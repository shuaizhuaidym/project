package com.jit.project.daily.service;

import java.util.List;

import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.bean.Query;

public class DailyServiceImpl extends NameEntityService<Daily> implements IDailyService {

	@Override
	public void saveWith(final Daily daily) {
		StringBuilder links = new StringBuilder();
		for (DailyItem i : daily.getItems()) {// /project/daily/item?item_id=
			links.append("<a ").append(i.getItemID()).append(">");
			links.append(i.getDetail());
			links.append("</a>").append("|");
		}
		daily.setItemLinks(links.toString());

		dao().insertWith(daily, "items");
		// TODO update mission's labor cost in transaction
//		Trans.exec(Connection.TRANSACTION_SERIALIZABLE, new Atom() {
//			public void run() {
//				dao().update(CCC);
//			}
//		});
	}

	@Override
	public QueryResult search(Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(this.dao().count(Daily.class, vo));
		List<Daily> list = dao().query(Daily.class, vo, pager);
		return new QueryResult(list, pager);
	}

	@Override
	public Daily fetch(final String id) {

		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where daily_id = " + id;
				return sql;
			}
		};
		Daily daily = this.fetch(cnd);
		return daily;
	}

	@Override
	public Daily fetchLinks(Daily daily, String manyReg) {
		return this.dao().fetchLinks(daily, manyReg);
	}
	//TODO
	public int udateLaborCost(List<DailyItem> items){
		return 0;
	}
}
