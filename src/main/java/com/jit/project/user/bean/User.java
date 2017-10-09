package com.jit.project.user.bean;

import java.util.List;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

import com.jit.project.auth.bean.Permission;
import com.jit.project.auth.bean.Role;
import com.jit.project.bean.BasePojo;

@Table("t_user")
public class User extends BasePojo {

	@Id
	@Column(value="user_id")
	protected int id;
	
	@Name
	@Column
	protected String name;
	
	@Column("passwd")
	@ColDefine(width = 128)
	protected String password;
	
	@Column("real_name")
	protected String realName;
	
	@Column
	protected String salt;
	
	@Column
	private boolean locked;
	
	public String getStatus() {
		return this.locked ? "是" : "否";
	}
	
	@Column("org_id")
	private String orgID;
	
	@Column("org_name")
	private String orgName;
	/**
	 * 组别：研发_C|研发_Java|测试
	 */
	@Column("_group")
	private String _group;
	
	@ManyMany(from = "user_id", relation = "t_user_role", target = Role.class, to = "role_id")
	protected List<Role> roles;
	
	@ManyMany(from = "user_id", relation = "t_user_permission", target = Permission.class, to = "permission_id")
	protected List<Permission> permissions;
	
	@One(target = UserProfile.class, field = "id", key = "userId")
	protected UserProfile profile;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	public UserProfile getProfile() {
		return profile;
	}

	public void setProfile(UserProfile profile) {
		this.profile = profile;
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

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getOrgID() {
		return orgID;
	}

	public void setOrgID(String orgID) {
		this.orgID = orgID;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String get_group() {
		return _group;
	}

	public void set_group(String _group) {
		this._group = _group;
	}

	@Override
	public String toSql() {
		// TODO Auto-generated method stub
		return null;
	}

}
