package com.jit.project.daily.service;

import java.util.ArrayList;
import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;
import org.nutz.trans.Atom;
import org.nutz.trans.Trans;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.bean.Query;
import com.mysql.jdbc.Connection;

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

		// TODO update mission's and project's labor cost in transaction and process update time
		/**
		 * TODO 写日报时候更新OR统计时候联合查询？？？
		 * 每个日报有多个条目即对应多个任务，每个任务都要更新，更新流程：
		 * update t_mission where mission=@mid 
		 * set hours= select sum(hours) from t_daily_item where mission_id=@mid 
		 */
//		List<DailyItem> dailys = new ArrayList<DailyItem>();
//		
//		Trans.exec(Connection.TRANSACTION_SERIALIZABLE, new Atom() {
//			public void run() {
//				dao().insertWith(daily, "items");
//				dao().updateWithVersion(arg0, arg1);
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
			private static final long serialVersionUID = -117976807473099750L;

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
	
	/**
	 * 查找任务对应的日报，更新人力成本和处理过程
	 */
	protected void findItemByMisson(Integer missionID){
		List<DailyItem> items = this.dao().query(DailyItem.class, Cnd.where("missionID", "=", missionID));
	}
	
	//TODO
	public int udateLaborCost(List<DailyItem> items){
		return 0;
	}
}
