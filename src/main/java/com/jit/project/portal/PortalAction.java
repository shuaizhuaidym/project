package com.jit.project.portal;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.mission.MissionServiceImpl;
import com.jit.project.mission.Query;

@InjectName("portalAction")
public class PortalAction {
	@Inject("missionService")
	MissionServiceImpl missionService;

	/**
	 * 任务列表和bug列表需要分开加载，异步处理
	 * 
	 * @return
	 */
	@At("/portal")
	@Ok("jsp:views.portal")
	public QueryResult portal(@Param("::query.") Query cnd) {
		// List<Defeat> defeats = new ArrayList<Defeat>();
		// TODO 根据当前用户，查询“我”的待办任务
		if (cnd == null) {
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
		String json="[ {"+
			"\"name\" : \"Tiger Nixon\","+
			"\"position\" : \"System Architect\","+
			"\"salary\" : \"$3,120\","+
			"\"start_date\" : \"2011/04/25\","+
			"\"office\" : \"Edinburgh\","+
			"\"extn\" : \"5421\""+
		"}, {"+
			"\"name\" : \"Garrett Winters\","+
			"\"position\" : \"Director\","+
			"\"salary\" : \"$5,300\","+
			"\"start_date\" : \"2011/07/25\","+
			"\"office\" : \"Edinburgh\","+
			"\"extn\" : \"8422\""+
		"}, {"+
			"\"name\" : \"Tiger Nixon\","+
			"\"position\" : \"System Architect\","+
			"\"salary\" : \"$3,120\","+
			"\"start_date\" : \"2011/04/25\","+
			"\"office\" : \"Edinburgh\","+
			"\"extn\" : \"5421\""+
		"}, {"+
			"\"name\" : \"Garrett Winters\","+
			"\"position\" : \"Director\","+
			"\"salary\" : \"$5,300\","+
			"\"start_date\" : \"2011/07/25\","+
			"\"office\" : \"Edinburgh\","+
			"\"extn\" : \"8422\""+
		"} ]";
		System.out.println(json);
		return json;
	}

	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}
}
