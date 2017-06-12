package com.jit.project.mission;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.nutz.dao.Condition;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.daily.DailyItem;
import com.jit.project.daily.DailyItemServiceImpl;
import com.jit.project.daily.DailyServiceImpl;

@InjectName("missionAction")
public class MissionAction {
	private String SUCCESS = "SUCCESS";

	private MissionServiceImpl missionService;
	private DailyItemServiceImpl dailyItemService;

	@At("/mission/query")
	@Ok("jsp:views.mission.list")
	public String index() {
		return "SUCCESS";
	}

	/**
	 * 新增任务跳转
	 * 
	 * @return
	 */
	@At("/mission/add")
	@Ok("jsp:views.mission.form")
	public String add() {
		return SUCCESS;
	}

	/**
	 * 新建任务
	 * 
	 * @param mission
	 * @return
	 */
	@At("/mission/create")
	@Ok("redirect:/mission/query")
	public String create(@Param("::mission.") Mission mission) {
		System.out.println(mission.toString());
		missionService.dao().insert(mission);
		return SUCCESS;
	}

	/**
	 * 查询所有任务JSP
	 * 
	 * @return
	 */
	@At("/mission/query")
	@Ok("jsp:views.mission.list")
	public QueryResult queryPage(@Param("pageNumber") Integer pageNumber,
			@Param("pageSize") Integer pageSize) {
		Dao dao = missionService.dao();

		Condition cnd = null;
		pageNumber = 1;
		pageSize = 20;
		Pager pager = dao.createPager(pageNumber, pageSize);

		pager.setRecordCount(dao.count(Mission.class, cnd));

		List<Mission> missions = this.missionService.query(cnd, pager);

		return new QueryResult(missions, pager);
	}

	/**
	 * 查询所有任务JSON
	 * 
	 * @return
	 */
	@At("/mission/query/json")
	@Ok("json:full")
	public List<Mission> queryJsonPage() {
		Condition cnd = null;
		Pager pgr = null;
		List<Mission> missions = new ArrayList<Mission>();
		this.missionService.query(cnd, pgr);
		// 结果将转换为JSON
		return missions;
	}

	/**
	 * 分配任务
	 * 
	 * @return
	 */
	@At("/mission/loadForAssignAsync")
	@Ok("json:full")
	public Mission assignAsync(@Param("mission_id") final String missionID) {
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + missionID;
				return sql;
			}
		};
		Mission mission = this.missionService.fetch(cnd);
		return mission;
	}

	/**
	 * 指派任务
	 * 
	 * @return
	 */
	@At("/mission/edit")
	@Ok("json:full")
	public Mission edit(@Param("mission_id") final String missionID) {
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + missionID;
				return sql;
			}
		};
		Mission mission = this.missionService.fetch(cnd);
		return mission;
	}

	/**
	 * 查看任务执行历史(日报条目)
	 * @return
	 */
	@At("/mission/history")
	@Ok("json:full")
	public List<DailyItem> history(@Param("mission_id") final String missionID) {
		List<DailyItem> history = new LinkedList<DailyItem>();
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + missionID;
				return sql;
			}
		};
		this.dailyItemService.fetch(cnd);
		return history;
	}

	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}

	public DailyItemServiceImpl getDailyItemService() {
		return dailyItemService;
	}

	public void setDailyItemService(DailyItemServiceImpl dailyItemService) {
		this.dailyItemService = dailyItemService;
	}

}
