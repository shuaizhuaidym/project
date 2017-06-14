package com.jit.project.product.bean;

import java.util.*;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
@Table("t_product")
public class Product {
	@Id
	@Column("p_id")
	private int productID;
	@Column("name")
	private String productName;
	@Column("code")
	private String code;
	@Column("release_version")
	private String releaseVersion;
	@Column("release_date")
	private Date releaseDate;
	@Column("product_mgr")
	private String productMgr;
	@Column("test_mgr")
	private String testMgr;
	@Column("dev_mgr")
	private String devMgr;
	@Column("intruduction")
	private String desc;

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getReleaseVersion() {
		return releaseVersion;
	}

	public void setReleaseVersion(String releaseVersion) {
		this.releaseVersion = releaseVersion;
	}

	public String getProductMgr() {
		return productMgr;
	}

	public void setProductMgr(String productMgr) {
		this.productMgr = productMgr;
	}

	public String getTestMgr() {
		return testMgr;
	}

	public void setTestMgr(String testMgr) {
		this.testMgr = testMgr;
	}

	public String getDevMgr() {
		return devMgr;
	}

	public void setDevMgr(String devMgr) {
		this.devMgr = devMgr;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

}
