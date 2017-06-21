package com.jit.project.portal;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bug.service.BugServiceImpl;
import com.jit.project.mission.MissionServiceImpl;
import com.jit.project.mission.Query;

@InjectName("portalAction")
public class PortalAction {

	private String success = "SUCCESS";
	// 任务
	@Inject("missionService")
	MissionServiceImpl missionService;

	// bug
	@Inject("bugService")
	BugServiceImpl bugService;

	/**
	 * 我的首页
	 * 
	 * @return
	 */
	@At("/portal")
	@Ok("jsp:views.portal.portal")
	public String portal() {
		return success;
	}

	/**
	 * BUG
	 * 
	 * @return
	 */
	@At("/portal/bug")
	@Ok("jsp:views.portal.bugWidget")
	public QueryResult bug(@Param("::query.") com.jit.project.bug.bean.Query cnd) {
		if (cnd == null) {// TODO 根据当前用户，查询“我”的待办任务
			cnd = new com.jit.project.bug.bean.Query();
		}
		QueryResult bugs = this.bugService.query(cnd);
		return bugs;
	}

	/**
	 * 待办任务
	 * 
	 * @return
	 */
	@At("/portal/mission")
	@Ok("jsp:views.portal.missionWidget")
	public QueryResult mission(@Param("::query.") Query cnd) {
		if (cnd == null) {// TODO 根据当前用户，查询“我”的待办任务
			cnd = new Query();
		}
		QueryResult products = this.missionService.query(cnd);
		return products;
	}

	/**
	 * 任务列表和bug列表需要分开加载，异步处理
	 * 
	 * @return
	 */
	@At("/demo")
	@Ok("raw:json")
	public String demo(@Param("::query.") Query cnd) {
		// List<Defeat> defeats = new ArrayList<Defeat>();
		// TODO 根据当前用户，查询“我”的待办任务
		if (cnd == null) {
			cnd = new Query();
		}
		QueryResult products = this.missionService.query(cnd);
		String json = "[ {" + "\"name\" : \"Tiger Nixon\"," + "\"position\" : \"System Architect\","
				+ "\"salary\" : \"$3,120\"," + "\"start_date\" : \"2011/04/25\","
				+ "\"office\" : \"Edinburgh\"," + "\"extn\" : \"5421\"" + "}, {"
				+ "\"name\" : \"Garrett Winters\"," + "\"position\" : \"Director\","
				+ "\"salary\" : \"$5,300\"," + "\"start_date\" : \"2011/07/25\","
				+ "\"office\" : \"Edinburgh\"," + "\"extn\" : \"8422\"" + "}, {"
				+ "\"name\" : \"Tiger Nixon\"," + "\"position\" : \"System Architect\","
				+ "\"salary\" : \"$3,120\"," + "\"start_date\" : \"2011/04/25\","
				+ "\"office\" : \"Edinburgh\"," + "\"extn\" : \"5421\"" + "}, {"
				+ "\"name\" : \"Garrett Winters\"," + "\"position\" : \"Director\","
				+ "\"salary\" : \"$5,300\"," + "\"start_date\" : \"2011/07/25\","
				+ "\"office\" : \"Edinburgh\"," + "\"extn\" : \"8422\"" + "} ]";
		System.out.println(json);
		return json;
	}

	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}

	public BugServiceImpl getBugService() {
		return bugService;
	}

	public void setBugService(BugServiceImpl bugService) {
		this.bugService = bugService;
	}
}
