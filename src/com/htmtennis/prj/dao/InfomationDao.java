package com.htmtennis.prj.dao;

import java.util.List;

import com.htmtennis.prj.model.Infomation;

public interface InfomationDao {

	public Infomation getInfomation(String code);
	public Infomation prevInfomation(String curCode);
	public Infomation nextInfomation(String curCode);
	
	public List<Infomation> getInfomations(int page, String query, String field);
	public List<Infomation> getInfomations(int page, String query);
	public List<Infomation> getInfomations(int page);

	public int insert(Infomation infomation);
	public int update(Infomation infomation);
	public int delete(String code);
	
	public int getSize(String query, String field);
	public int getSize(String query);
	public String lastCode();

}
