package com.jit.project.version.bean;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
/**
 * 产品版本为了展示目的，一个完整的版本为path的值
 * <p>Title:Version</p>
 * <p>Description:</p>
 * @author daiyma
 * @date 2017年7月15日
 */
@Table("t_version")
public class Version {
	@Id
	@Column("version_id")
	private int verionID;
	
	@Column
	private String version;
	
	@Column
	private String alias;
	/**
	 * 设计为树形展示的parent，例如3.0.33.6
	 * |_3.0
	 * 		|_.33
	 * 			|__.6
	 * 则.6的parent为3.0.33，.33的parent为3.0
	 */
	@Column("parent_version")
	private String parentVersion;
	
	@Column("parent_id")
	private int parentID;
	
	@Column("product_name")
	private String productName;
	
	@Column("product_id")
	private int productID;
	
	@Column("path")
	private String path;
	
	@Column("publish_date")
	private Date publishDate;

	public int getVerionID() {
		return verionID;
	}

	public void setVerionID(int verionID) {
		this.verionID = verionID;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getParentVersion() {
		return parentVersion;
	}

	public void setParentVersion(String parentVersion) {
		this.parentVersion = parentVersion;
	}

	public int getParentID() {
		return parentID;
	}

	public void setParentID(int parentID) {
		this.parentID = parentID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}
}
