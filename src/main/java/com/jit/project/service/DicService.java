package com.jit.project.service;

import org.nutz.dao.Dao;

public class DicService implements IDicService {
	private Dao dao;

	protected Dao getDao() {
		return dao;
	}

	protected void setDao(Dao dao) {
		this.dao = dao;
	}
}