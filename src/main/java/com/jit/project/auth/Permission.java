package com.jit.project.auth;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;

public class Permission {
	@Id
	@Column(value = "id")
	protected int id;
	@Name
	@Column(value = "name")
	protected String name;
	@Column(value = "alias")
	protected String alias;
	@Column(value = "description")
	protected String description;

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
