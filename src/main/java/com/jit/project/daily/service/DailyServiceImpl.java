package com.jit.project.daily.service;

import java.util.ArrayList;
import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.service.IdNameEntityService;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.bean.Query;
import com.jit.project.daily.bean.VDailyItem;

public class DailyServiceImpl extends IdNameEntityService<Daily> implements IDailyService {

	@Override
	public void saveWith(final Daily daily) {
		StringBuilder links = new StringBuilder();
		for (DailyItem i : daily.getItems()) {
			links.append(i.getDetail());
			links.append("<br/>");
		}
		daily.setItemLinks(links.toString());
		dao().insertWith(daily, "items");

		// TODO update mission's and project's labor cost in transaction and
		/**
		 * TODO 写日报时候更新OR统计时候联合查询？？？ TODO 完成比例需要更新，写日报时回显，知道昨天的进度是多少
		 * 每个日报有多个条目即对应多个任务，每个任务都要更新，更新流程： update t_mission where mission=@mid
		 * set hours= select sum(hours) from t_daily_item where mission_id=@mid
		 */
		// List<DailyItem> dailys = new ArrayList<DailyItem>();
		//
		// Trans.exec(Connection.TRANSACTION_SERIALIZABLE, new Atom() {
		// public void run() {
		// dao().updateWithVersion(arg0, arg1);
		// }
		// });
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

	/**
	 * 显示日报详情
	 * 
	 * @param dailyID
	 * @return
	 */
	public List<com.jit.project.daily.bean.VDailyItem> queryDailyDetail(String dailyID) {
		List<com.jit.project.daily.bean.VDailyItem> items = this.dao().query(VDailyItem.class,
				Cnd.where("daily_id", "=", dailyID));

		return items;
	}

	@Override
	public Daily fetchLinks(Daily daily, String manyReg) {
		return this.dao().fetchLinks(daily, manyReg);
	}

	/**
	 * 查找任务对应的日报，更新人力成本和处理过程
	 */
	@SuppressWarnings("unused")
	protected void findItemByMisson(Integer missionID) {
		List<DailyItem> items = this.dao().query(DailyItem.class, Cnd.where("missionID", "=", missionID));
	}

	// TODO
	public int udateLaborCost(List<DailyItem> items) {
		return 0;
	}
	/**
	 * 更新日报
	 */
	@Override
	public void upateWith(Daily daily) {
		// 修改的item和新增的要区分开，否则新增的会导致insertWith操作，而新建一个Daily
		List<DailyItem> modified = new ArrayList<DailyItem>();
		List<DailyItem> created = new ArrayList<DailyItem>();
		StringBuilder links = new StringBuilder();
		int counter = 0;
		for (DailyItem i : daily.getItems()) {
			if (i.getDailyID() <= 0) {// 新建的条目
				i.setDailyID(daily.getDailyID());
				created.add(i);
			} else {
				modified.add(i);
			}
			links.append("【").append(++counter).append("】");
			links.append(i.getDetail());
		}
		daily.setItemLinks(links.toString());
		//更新日报和条目
		daily.setItems(modified);
		this.dao().updateWith(daily, "items");
		//新增条目
		daily.setItems(created);
		this.dao().insertLinks(daily, "items");
	}
	
	/**
	 * 查询某人名下 指定状态的日报
	 * @return
	 */
	public List<Daily> getStagedDaily(String ownerName,Integer status){
		Query query = new Query(ownerName, status);
		List<Daily> staged = this.dao().query(Daily.class, query);
		return staged;
	}
}
