package com.htmtennis.prj.dao.mybatis;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisMain extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		//builder.build(config);
	}
	
}
