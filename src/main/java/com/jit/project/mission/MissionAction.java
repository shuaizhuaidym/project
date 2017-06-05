package com.jit.project.mission;

import java.util.ArrayList;
import java.util.List;

import org.nutz.dao.Condition;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@InjectName("missionAction")
public class MissionAction {
	private String SUCCESS = "SUCCESS";

	private MissionServiceImpl missionService;

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
	 * 指派任务
	 * @return
	 */
	public String assign(@Param("::mission.") Mission mission){
		return SUCCESS;
	}
	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}
}
