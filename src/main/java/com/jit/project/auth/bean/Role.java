package com.jit.project.auth.bean;

import java.util.List;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

import com.jit.project.bean.BasePojo;

@Table("t_role")
public class Role extends BasePojo {
	@Id
	protected long id;
	@Name
	protected String name;
	@Column("alias")
	protected String alias;
	@Column("description")
	@ColDefine(type = ColType.VARCHAR, width = 500)
	private String description;
	@ManyMany(from = "role_id", relation = "t_role_permission", target = Permission.class, to = "permission_id")
	protected List<Permission> permissions;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
}
