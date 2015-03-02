package com.htmtennis.prj.dao;

import java.util.List;

import com.htmtennis.prj.model.InfomationFile;


public interface InfomationFileDao {

	public List<InfomationFile> getInfomationFiles(String infomationCode);
	public int insert(InfomationFile file);
}
