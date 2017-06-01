package com.jit.project.mission;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@InjectName("missionAction")
public class MissionAction {
	private String SUCCESS="SUCCESS";

	private IMissionService missionService;

	@At("/mission/add")
	@Ok("jsp:views.mission.form")
	public String add() {
		return SUCCESS;
	}

	public String save(@Param("::mission.") Mission mission){
		System.out.println(mission.toString());
		return SUCCESS;
	}
	public IMissionService getMissionService() {
		return missionService;
	}

	public void setMissionService(IMissionService missionService) {
		this.missionService = missionService;
	}
}
