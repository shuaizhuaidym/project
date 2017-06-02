package com.jit.project.product.bean;

import java.util.*;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
public class Product {
	/** @pdOid 08fc2e9f-bdff-426f-b5c8-72eccaf5221c */
	private int productID;
	/** @pdOid d3dc4570-5cd6-4013-9fb3-d44e35ad17b5 */
	private String productName;
	/** @pdOid 548250a7-947e-4a33-8ab4-dca337dde403 */
	private String releaseVersion;
	/** @pdOid a4db7e7a-b533-4cf0-b169-e040d6a4dfda */
	private Date relaseDate;
	/** @pdOid 29126e0c-3f18-4785-95a0-2efe7726322c */
	private String productMgr;
	/** @pdOid 59e6737a-63f6-4d3e-bb2f-ac0d8657ebaa */
	private String testMgr;
	/** @pdOid abd4c7cc-1649-43fa-bdfb-e597651d311d */
	private String devMgr;

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

	public Date getRelaseDate() {
		return relaseDate;
	}

	public void setRelaseDate(Date relaseDate) {
		this.relaseDate = relaseDate;
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

}
