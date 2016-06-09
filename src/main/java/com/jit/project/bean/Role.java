package com.jit.project.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * <p>
 * Title:Role
 * </p>
 * <p>
 * Description:人员角色（岗位）
 * </p>
 * 
 * @author daiyma
 * @date 2016年6月9日
 */
@Table("t_role")
public class Role {
	@Id
	@Column("role_id")
	private int roleID;
	
	@Column("role_name")
	private String roleName;
	
	@Column("status")
	private int status = 0;// 状态，在用/停用

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
