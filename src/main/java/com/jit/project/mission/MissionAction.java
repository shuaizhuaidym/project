package com.jit.project.mission;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.service.DailyItemServiceImpl;
import com.jit.project.dictionary.service.IDicService;

@InjectName("missionAction")
public class MissionAction {
	private String SUCCESS = "SUCCESS";

	private MissionServiceImpl missionService;
	private DailyItemServiceImpl dailyItemService;

	private IDicService dicService;

	/**
	 * 任务列表
	 * 
	 * @return
	 */
	@At("/mission/list")
	@Ok("jsp:views.jsp.mission.list")
	public QueryResult list(HttpServletRequest request) {
		QueryResult result = new QueryResult(new ArrayList<Mission>(), new Pager());
		request.setAttribute("query", new Query());
		return result;
	}

	/**
	 * 新增任务跳转
	 * 
	 * @return
	 */
	@At("/mission/form")
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
	public QueryResult queryPage(HttpServletRequest request,
			@Param("::query.") com.jit.project.mission.Query query) {
		if (query == null) {
			query = new com.jit.project.mission.Query();
		}
		QueryResult result = this.missionService.query(query);
		return result;
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
	 * 加载要分配的任务
	 * 
	 * @return
	 */
	@At("/mission/loadForAssignAsync")
	@Ok("jsp:views.mission.assign")
	public Mission loadForAssignAsync(@Param("mission_id") final String missionID) {
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
	@At("/mission/assign")
	@Ok("redirect:/mission/query")
	public Mission assign(@Param("::mission.") final Mission mission) {
		if (mission == null || mission.getMissionID() == null) {
			return null;
		}
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + mission.getMissionID();
				return sql;
			}
		};
		Mission msn = this.missionService.fetch(cnd);
		msn.setAssignTo(mission.getAssignTo());// TODO other fields
		msn.setTotalHours(mission.getTotalHours());
		msn.setComments(mission.getComments());
		this.missionService.dao().updateIgnoreNull(msn);
		return mission;
	}

	/**
	 * 编辑任务
	 * 
	 * @return
	 */
	@At("/mission/edit")
	@Ok("jsp:views.mission.edit")
	public Mission edit(@Param("mission_id") final String mission_id, HttpServletRequest request) {
		Map<String, String> types = this.dicService.service(IDicService.type_mission_type);
		Map<String, String> status = this.dicService.service(IDicService.type_mission_status);
		Map<String, String> classes = this.dicService.service(IDicService.type_mission_class);
		request.setAttribute("types", types);
		request.setAttribute("status", status);
		request.setAttribute("classes", classes);
		if (mission_id == null) {
			return null;
		}
		Condition cnd = new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + mission_id;
				return sql;
			}
		};
		Mission msn = this.missionService.fetch(cnd);
		return msn;
	}

	/**
	 * 更新任务
	 * 
	 * @return
	 */
	@At("/mission/update")
	@Ok("redirect:/mission/query")
	public Mission update(@Param("::mission.") final Mission mission) {
		if (mission == null || mission.getMissionID() == null) {
			return null;
		}
		this.missionService.dao().updateIgnoreNull(mission);
		return mission;
	}

	/**
	 * 查看任务执行历史(日报条目)
	 * 
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

	/**
	 * 日报引用关联任务
	 * 
	 * @return
	 */
	@At("/mission/refer")
	@Ok("jsp:views.mission.refer")
	public QueryResult refer(HttpServletRequest request, @Param("::query.") Query query) {
		if (query == null) {
			query = new com.jit.project.mission.Query();
		}
		QueryResult result = this.missionService.query(query);
		request.setAttribute("mission_index", request.getParameter("mission_index"));
		return result;
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

	public IDicService getDicService() {
		return dicService;
	}

	public void setDicService(IDicService dicService) {
		this.dicService = dicService;
	}

}
