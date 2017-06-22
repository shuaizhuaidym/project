package com.jit.project.daily.service;

import org.nutz.service.NameEntityService;

import com.jit.project.daily.bean.Daily;

public class DailyServiceImpl extends NameEntityService<Daily> implements IDailyService {

	@Override
	public void saveWith(Daily daily) {
		this.dao().insertWith(daily, "items");
	}

}
