package com.jit.project.daily.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Many;
import org.nutz.dao.entity.annotation.Table;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
@Table("t_daily")
public class Daily {
	@Id
	@Column("daily_id")
	private int dailyID;
	
	@Column("create_date")
	private Date createDate;
	
	@Column("owner_id")
	private int ownerID;
	
	@Column("owner_name")
	private String ownerName;
	
	@Column("mail_to")
	private int mailTo;
	
	//日报状态，0：草稿，1：已提交
	@Column("status")
	private int status;
	
	@Many(target = DailyItem.class, field = "dailyID")
	private List<DailyItem> items = new ArrayList<DailyItem>();
	
	@Column("item_links")
	private String itemLinks;
	
	public String getItemLinks() {
		return itemLinks;
	}

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

	public List<DailyItem> getItems() {
		return items;
	}

	public void setItems(List<DailyItem> items) {
		this.items = items;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public void setItemLinks(String itemLinks) {
		this.itemLinks = itemLinks;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}