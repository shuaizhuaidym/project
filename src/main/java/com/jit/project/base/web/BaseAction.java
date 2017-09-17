package com.jit.project.base.web;

import java.util.HashMap;
import java.util.Map;

import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.lang.random.R;

import com.jit.project.dictionary.service.IDicService;
import com.jit.project.mail.EmailService;
/**
 * TODO 字典增加缓存，字典更新使用观察着模式
 * <p>Title:BaseAction</p>
 * <p>Description:</p>
 * @author daiyma
 * @date 2017年9月17日
 */
public abstract class BaseAction {

	/** 注入同名的一个ioc对象 */
	@Inject
	protected Dao dao;
	@Inject("emailService")
	protected EmailService emailService;
	@Inject("dicService")
	private IDicService dicService;
	//任务类别
	Map<String, String> classes = new HashMap<String, String>();
	//用户
	Map<String, String> users = new HashMap<String, String>();
	//产品
	Map<String, String> products = new HashMap<String, String>();
	//模块
	Map<String, String> modules = new HashMap<String, String>();
	
	protected byte[] emailKEY = R.sg(24).next().getBytes();

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
