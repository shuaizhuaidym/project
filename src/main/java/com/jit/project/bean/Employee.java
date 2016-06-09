package com.jit.project.bean;

import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
import org.nutz.dao.entity.annotation.Table;

/**
 * <p>
 * Title:Employee
 * </p>
 * <p>
 * Description:人员实体
 * </p>
 * 
 * @author daiyma
 * @date 2016年6月9日
 */
@Table("t_employee")
public class Employee extends Organization {
	@Id
	@Column("employee_id")
	private int employeeID;

	@Column("full_name")
	private String fullName;
	
	@Column("org_id")
	private int orgID;

	@ManyMany(target = Role.class, relation = "t_employee_role", from = "employee_id", to = "role_id")
	private List<Role> role;

	@Column("status")
	private int status;

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getOrgID() {
		return orgID;
	}

	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}

}
