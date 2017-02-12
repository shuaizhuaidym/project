package com.jit.project.web;

import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.lang.random.R;

import com.jit.project.mail.EmailService;

public abstract class BaseAction {
	/** 注入同名的一个ioc对象 */
	@Inject
	protected Dao dao;
	@Inject
	protected EmailService emailService;

	protected byte[] emailKEY = R.sg(24).next().getBytes();

}
