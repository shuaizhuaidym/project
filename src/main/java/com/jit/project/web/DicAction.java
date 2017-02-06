package com.jit.project.web;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.ViewModel;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bean.Dictionary;
import com.jit.project.bean.dic.Query;
import com.jit.project.service.IDicService;

/**
 * 字典数据管理
 * 
 * @author yanming_dai
 * @date 2016年4月26日
 */
@InjectName("dicAction")
public class DicAction {

	private static Map<String, String> dicType = new LinkedHashMap<String, String>();
	
	@Inject("dicService")
	private IDicService dicService;

	static{
		dicType.put("", "");
		dicType.put("负责人", "负责人");
		dicType.put("问题类型", "问题类型");
		dicType.put("所属行业", "所属行业");
		dicType.put("当前状态", "当前状态");
	}
	
	/**
	 * 字典列表
	 * 
	 * @return
	 */
	@At("/dic/list")
	@Ok("re:jsp:views.dic.list")
	public String list(@Param("..") Query query, ViewModel model,//ViewModel is valid only when return OK("re:
			HttpServletRequest request) {
		
		QueryResult dicts = this.dicService.query(query);
		model.setv("mDicType", dicType);
		model.setv("query", query);
		model.setv("dicts", dicts);
		
		return "jsp:views.dic.list";
	}

	/**
	 * 新增字典
	 * TODO validate form
	 */
	@At("/dic/form")
	@Ok("jsp:views.dic.form")
	public String form(ViewModel model, HttpServletRequest request) {
		model.put("dicType", dicType);
		Dictionary dic = new Dictionary();
		dic.setAvailable(true);
		request.setAttribute("mDicType", dicType);
		return "FORM";
	}

	/**
	 * 保存字典
	 * 
	 * @return
	 */
	@At("/dic/create")
	@Ok("redirect:/dic/list")
	public String create(@Param("::dic.") Dictionary dic) {
		dicService.save(dic);
		return "CREATE";
	}

	/**
	 * 查询并显示字典列表
	 * 
	 * @param query
	 * @param model
	 * @param request
	 * @return
	 */
	@At("/dic/query")
	@Ok("re:jsp:views.dic.list")
	public String query(@Param("::query.") Query query, ViewModel model,
			HttpServletRequest request) {
		
		QueryResult dicts = this.dicService.query(query);
		model.setv("mDicType", dicType);
		model.setv("query", query);
		model.setv("dicts", dicts);
		
		return "jsp:views.dic.list";
	}
	
	/**
	 * 编辑字典 
	 * @param dicID
	 * @param model
	 * @return
	 */
	@At("/dic/edit")
	@Ok("re:jsp:views.dic.edit")
	public String edit(@Param("dic_id") Integer dicID, ViewModel model) {
		Dictionary dict = this.dicService.get(dicID);
		model.setv("dict", dict);
		model.setv("mDicType", dicType);
		return "jsp:views.dic.edit";
	}
	
	/**
	 * 编辑字典 
	 * @param dicID
	 * @param model
	 * @return
	 */
	@At("/dic/update")
	@Ok("redirect:/dic/list")
	public String update(@Param("::dic.") Dictionary dict) {
		this.dicService.update(dict);
		return "redirect:views.dic.list";
	}

	protected IDicService getDicService() {
		return dicService;
	}

	protected void setDicService(IDicService dicService) {
		this.dicService = dicService;
	}

	public static Map<String, String> getDicType() {
		return dicType;
	}
}
