package com.htmtennis.prj.model;

import java.util.Date;

public class FreeFile {

	private String freeCode;
	private String description;
	private Date regdate;
	private String src;
	private String code;
	
	public String getFreeCode() {	return freeCode;	}
	public void setFreeCode(String freeCode) {		this.freeCode = freeCode;	}
	
	public String getDescription() {		return description;	}
	public void setDescription(String description) {		this.description = description;	}
	
	public Date getRegdate() {	return regdate;		}
	public void setRegdate(Date regdate) {		this.regdate = regdate;	}

	public String getSrc() {		return src;	}
	public void setSrc(String src) {			this.src = src;	}
	
	public String getCode() {	return code;	}
	public void setCode(String code) {	this.code = code;	}
}
