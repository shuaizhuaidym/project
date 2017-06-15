package com.jit.project.daily.bean;

import java.util.*;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
public class Daily {
	/** @pdOid 3c33b1a3-95e8-493a-989b-6ba3efa51313 */
	private int dailyID;
	/** @pdOid 3182081a-5e2c-48df-b927-08251edd6ac3 */
	private Date createDate;
	/** @pdOid 8cd87c70-f5b0-46bc-9033-c97640af8518 */
	private int ownerID;
	/** @pdOid 2ccc7904-b2b1-498f-ac8b-51bc7563c251 */
	private int mailTo;
	/** @pdOid b58652bd-f5de-4b3c-b504-a9a7becff904 */
	private String owner;

	public int getDailyID() {
		return dailyID;
	}

	public void setDailyID(int dailyID) {
		this.dailyID = dailyID;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}

	public int getMailTo() {
		return mailTo;
	}

	public void setMailTo(int mailTo) {
		this.mailTo = mailTo;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

}