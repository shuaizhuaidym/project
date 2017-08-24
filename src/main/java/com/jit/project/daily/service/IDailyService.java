package com.jit.project.daily.service;

import java.util.List;

import org.nutz.dao.QueryResult;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.bean.Query;

public interface IDailyService {

	/**
	 * 级联保存日报和条目
	 * 
	 * @param daily
	 */
	public void saveWith(Daily daily);

	/**
	 * 检索日报
	 * 
	 * @param vo
	 * @return
	 */
	public QueryResult search(Query vo);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Daily fetch(String id);
	
	/**
	 * 级联获取 Many 端集合
	 * @param id
	 * @return
	 */
	public Daily fetchLinks(Daily daily, String manyReg);
	
	/**
	 * 获取条目列表，展现日报详情
	 * @param dailyID
	 * @return
	 */
	public List<com.jit.project.daily.bean.VDailyItem> queryDailyDetail(String dailyID);
	
}
