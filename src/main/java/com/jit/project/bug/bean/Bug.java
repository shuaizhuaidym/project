package com.jit.project.bug.bean;

import java.util.Date;

import org.nutz.dao.entity.annotation.Table;

@Table("t_bug")
public class Bug {
	
	private String bg_bug_id;
	private String bg_status;
	private String bg_responsible;
	private String bg_project;
	private String bg_subject;
	private String bg_summary;
	private String bg_description;
	private String bg_dev_comments;
	private String bg_reproducible;
	private String bg_severity;
	private String bg_priority;
	private String bg_detected_by;
	private Date bg_detection_date;
	private String bg_detection_version;
	private String bg_product;
	private String bg_module;

	public String getBg_bug_id() {
		return bg_bug_id;
	}

	public void setBg_bug_id(String bg_bug_id) {
		this.bg_bug_id = bg_bug_id;
	}

	public String getBg_status() {
		return bg_status;
	}

	public void setBg_status(String bg_status) {
		this.bg_status = bg_status;
	}

	public String getBg_responsible() {
		return bg_responsible;
	}

	public void setBg_responsible(String bg_responsible) {
		this.bg_responsible = bg_responsible;
	}

	public String getBg_project() {
		return bg_project;
	}

	public void setBg_project(String bg_project) {
		this.bg_project = bg_project;
	}

	public String getBg_subject() {
		return bg_subject;
	}

	public void setBg_subject(String bg_subject) {
		this.bg_subject = bg_subject;
	}

	public String getBg_summary() {
		return bg_summary;
	}

	public void setBg_summary(String bg_summary) {
		this.bg_summary = bg_summary;
	}

	public String getBg_description() {
		return bg_description;
	}

	public void setBg_description(String bg_description) {
		this.bg_description = bg_description;
	}

	public String getBg_dev_comments() {
		return bg_dev_comments;
	}

	public void setBg_dev_comments(String bg_dev_comments) {
		this.bg_dev_comments = bg_dev_comments;
	}

	public String getBg_reproducible() {
		return bg_reproducible;
	}

	public void setBg_reproducible(String bg_reproducible) {
		this.bg_reproducible = bg_reproducible;
	}

	public String getBg_severity() {
		return bg_severity;
	}

	public void setBg_severity(String bg_severity) {
		this.bg_severity = bg_severity;
	}

	public String getBg_priority() {
		return bg_priority;
	}

	public void setBg_priority(String bg_priority) {
		this.bg_priority = bg_priority;
	}

	public String getBg_detected_by() {
		return bg_detected_by;
	}

	public void setBg_detected_by(String bg_detected_by) {
		this.bg_detected_by = bg_detected_by;
	}

	public Date getBg_detection_date() {
		return bg_detection_date;
	}

	public void setBg_detection_date(Date bg_detection_date) {
		this.bg_detection_date = bg_detection_date;
	}

	public String getBg_detection_version() {
		return bg_detection_version;
	}

	public void setBg_detection_version(String bg_detection_version) {
		this.bg_detection_version = bg_detection_version;
	}

	public String getBg_product() {
		return bg_product;
	}

	public void setBg_product(String bg_product) {
		this.bg_product = bg_product;
	}

	public String getBg_module() {
		return bg_module;
	}

	public void setBg_module(String bg_module) {
		this.bg_module = bg_module;
	}

}
