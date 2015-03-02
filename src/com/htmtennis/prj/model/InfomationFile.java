package com.htmtennis.prj.model;

import java.util.Date;

public class InfomationFile {

	private String infomationCode;
	private String description;
	private Date regdate;
	private String src;
	private String code;
	
	public String getInfomationCode() {	return infomationCode;	}
	public void setInfomationCode(String infomationCode) {		this.infomationCode = infomationCode;	}
	
	public String getDescription() {		return description;	}
	public void setDescription(String description) {		this.description = description;	}
	
	public Date getRegdate() {	return regdate;		}
	public void setRegdate(Date regdate) {		this.regdate = regdate;	}

	public String getSrc() {		return src;	}
	public void setSrc(String src) {			this.src = src;	}
	
	public String getCode() {	return code;	}
	public void setCode(String code) {	this.code = code;	}
}
