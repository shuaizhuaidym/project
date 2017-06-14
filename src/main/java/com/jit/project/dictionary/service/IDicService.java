package com.jit.project.dictionary.service;

import java.util.Map;

import org.nutz.dao.QueryResult;

import com.jit.project.dictionary.bean.Dictionary;
import com.jit.project.dictionary.bean.Query;

/**
 * 字典管理类
 * 
 * @author daiyma
 * 
 */
public interface IDicService {

	public void save(Dictionary dic);

	public void update(Dictionary dic);

	public QueryResult query(Query dic);

	public Dictionary get(Integer id);

	/**
	 * 获取指定类型字典
	 * 
	 * @param type
	 * @return
	 */
	public Map<String, String> service(String type);
	
	public static String type_mission_type="任务类型";
	public static String type_mission_status="任务状态";
	public static String type_mission_class="任务类别";
}
