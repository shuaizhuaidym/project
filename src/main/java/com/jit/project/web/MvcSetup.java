package com.jit.project.web;

import org.nutz.dao.Dao;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.jit.project.bean.Project;

public class MvcSetup implements Setup {

	public void init(NutConfig config) {
		System.out.println("nutz MvcSetup start!!");
		Dao dao = config.getIoc().get(Dao.class, "dao");
		if (!dao.exists(Project.class)) {
			dao.create(Project.class, false);
		}
	}

	public void destroy(NutConfig config) {
		System.out.println("nutz MvcSetup stop!!");
	}
}
