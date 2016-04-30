package com.jit.project.web;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.service.IDicService;

/**
 * 字典数据管理
 * 
 * @author yanming_dai
 * @date 2016年4月26日
 */
@InjectName("dicAction")
public class DicAction {
	
	private IDicService dicService;
	/**
	 * 字典列表
	 * 
	 * @return
	 */
	@At("/dic/list")
	@Ok("jsp:views.dic.list")
	public String list() {
		return "LIST";
	}

	/**
	 * 新增字典
	 */
	public String form() {
		return "FORM";
	}

	/**
	 * 保存字典
	 * 
	 * @return
	 */
	public String create() {
		return "CREATE";
	}

	protected IDicService getDicService() {
		return dicService;
	}

	protected void setDicService(IDicService dicService) {
		this.dicService = dicService;
	}
}
