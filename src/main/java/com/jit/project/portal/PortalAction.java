package com.jit.project.portal;

import java.util.ArrayList;
import java.util.List;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.defeat.Defeat;
import com.jit.project.mission.MissionServiceImpl;
import com.jit.project.mission.Query;
import com.jit.project.product.service.ProductService;

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
	@Ok("jsp:/portal")
	public QueryResult portal(@Param("::query.") Query cnd) {
//		List<Defeat> defeats = new ArrayList<Defeat>();
		//TODO 根据当前用户，查询“我”的待办任务
		if (cnd == null) {
			cnd = new Query();
		}
		QueryResult products = this.missionService.query(cnd);

		return products;
	}

	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}
}
