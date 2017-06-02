package com.jit.project.product.bean;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
public class Module {
	/** @pdOid 412839db-be97-4f5b-9967-4fc876a06204 */
	private int moduleID;
	/** @pdOid 633b6690-bc47-479f-b5a9-60977d7ab430 */
	private int productID;
	/** @pdOid d92fa5fd-bd05-4039-9350-755d8531423f */
	private String moduleName;
	/** @pdOid 20822721-ba3a-446f-8403-5fe43657eb95 */
	private String code;

	public int getModuleID() {
		return moduleID;
	}

	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}