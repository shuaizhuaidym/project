package com.jit.project.dictionary.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

/**
 * 字典实体 只做维护、展现，不用做外键关联
 * 
 * @author yanming_dai
 * @date 2016年4月26日
 */
@Table("t_dictionary")
public class Dictionary {
	@Id
	@Column("dic_id")
	private Integer dicID;
	// 字典类型
	@Name
	@Column("dic_type")
	private String dicType;
	// 字典名称
	@Column("dic_name")
	private String dicName;
	//用途说明
	@Column("comments")
	private String comments;
	// 是否可用（逻辑删除）
	@Column("available")
	private boolean available;

	public Integer getDicID() {
		return dicID;
	}

	public String getState() {
		return available ? "启用" : "停用";
	}

	public void setDicID(Integer dicID) {
		this.dicID = dicID;
	}

	public String getDicType() {
		return dicType;
	}

	public void setDicType(String dicType) {
		this.dicType = dicType;
	}

	public String getDicName() {
		return dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}
	enum DicTyps{
		EGINEER,STATUS,INDUSTRY
	}
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
