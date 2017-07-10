package com.jit.project.base.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.lang.random.R;

import com.jit.project.dictionary.service.IDicService;
import com.jit.project.mail.EmailService;

public abstract class BaseAction {

	/** 注入同名的一个ioc对象 */
	@Inject
	protected Dao dao;
	@Inject
	protected EmailService emailService;
	
	private IDicService dicService;
	
	Map<String, String> types = new HashMap<String, String>();
	Map<String, String> status = new HashMap<String, String>();
	Map<String, String> classes = new HashMap<String, String>();
	Map<String, String> users = new HashMap<String, String>();
	
	protected byte[] emailKEY = R.sg(24).next().getBytes();
	
	protected void prepareDic(HttpServletRequest request) {
		if (types.isEmpty()) {
			types = this.dicService.service(IDicService.type_mission_type);
			status = this.dicService.service(IDicService.type_mission_status);
			classes = this.dicService.service(IDicService.type_mission_class);
		}
		request.setAttribute("users", users);
		request.setAttribute("types", types);
		request.setAttribute("status", status);
		request.setAttribute("classes", classes);
	}

	public Map<String, String> getTypes() {
		return types;
	}

	public void setTypes(Map<String, String> types) {
		this.types = types;
	}

	public Map<String, String> getStatus() {
		return status;
	}

	public void setStatus(Map<String, String> status) {
		this.status = status;
	}

	public Map<String, String> getClasses() {
		return classes;
	}

	public void setClasses(Map<String, String> classes) {
		this.classes = classes;
	}

	public Map<String, String> getUsers() {
		return users;
	}

	public void setUsers(Map<String, String> users) {
		this.users = users;
	}

}
