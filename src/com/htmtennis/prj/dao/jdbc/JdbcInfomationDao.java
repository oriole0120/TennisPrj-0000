package com.htmtennis.prj.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.htmtennis.prj.dao.InfomationDao;
import com.htmtennis.prj.model.Free;
import com.htmtennis.prj.model.Infomation;

public class JdbcInfomationDao implements InfomationDao {

	@Override
	public Infomation getInfomation(String code) {
		String sql = "SELECT * FROM INFOBOARDS WHERE CODE = '" + code + "' ";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis",
					"tennis89");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			// 모델마련하기
			rs.next();

			Informat Inf = new Information();
			if.setCode(rs.getString("CODE"));
			if.setWriter(rs.getString("WRITER"));
			if.setRegdate(rs.getDate("REGDATE"));
			if.setTitle(rs.getString("TITLE"));
			if.setContent(rs.getString("CONTENTS"));
			if.setHit(rs.getInt("HIT"));
			if.setAuthority(rs.getString( "AUTORITY"));

			rs.close();
			st.close();
			con.close();
			return if;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Infomation> getInfomations(int page, String query, String field) {
		int start = 1 + (page - 1) * 20; // (page-1)*20+1;
		int end = 20 + (page - 1) * 20; // page*20;

		String sql = "SELECT N.* FROM ( "
				+ " SELECT ( ROW_NUMBER() OVER (ORDER BY REGDATE DESC) ) NUM, INFOBOARDS.* "
				+ " FROM INFOBOARDS WHERE " + field + " LIKE ? ) N "
				+ " WHERE N.NUM BETWEEN ? AND ?";

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				
			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			PreparedStatement st = con.prepareStatement(sql);

			// st.setString(1,field);라고 넣으면 'field'라고 들어가므로 sql 직접 넣어준다

			st.setString(1, "%" + query + "%");
			st.setInt(2, start);
			st.setInt(3, end);

			ResultSet rs = st.executeQuery();

			List<Infomation> list = new ArrayList<Infomation>();

			// 모델마련하기
			while (rs.next()) {

				Infomation b = new Infomation();
				b.setCode(rs.getString("CODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setWriter(rs.getString("WRITER"));
				b.setRegdate(rs.getDate("REGDATE"));
				b.setHit(rs.getInt("HIT"));
				b.setContent(rs.getString("CONTENT"));

				list.add(b);
			}

			rs.close();
			st.close();
			con.close();

			return list;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Infomation> getInfomations(int page, String query) {

		return getInfomations(page, query, "Title");
	}

	@Override
	public List<Infomation> getInfomations(int page) {

		return getInfomations(page, "");
	}

	@Override
	public int insert(Infomation Infomation) {
		String sql1 = "SELECT ISNULL(MAX(CAST(CODE AS INT)), 0)+1 CODE FROM INFOBOARDS";
		String sql = "INSERT INTO INFOBOARDS(CODE, TITLE, WRITER, CONTENT, REGDATE, HIT) VALUES(?,?,?,?,Getdate(), 0)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			Statement stCode = con.createStatement();
			ResultSet rs = stCode.executeQuery(sql1);

			rs.next();
			String code = rs.getString("CODE");

			rs.close();
			stCode.close();

			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, code);
			st.setString(2, Infomation.getTitle());
			st.setString(3, Infomation.getWriter());
			st.setString(4, Infomation.getContent());

			int result = st.executeUpdate(); // 실행했을때 영향받는 row 수

			st.close();
			con.close();

			return result;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public int update(Infomation Infomation) {
		String sql = "UPDATE INFOBOARDS SET TITLE=?, CONTENT=? WHERE CODE=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, Infomation.getTitle());
			st.setString(2, Infomation.getContent());
			st.setString(3, Infomation.getCode());

			int result = st.executeUpdate();

			st.close();
			con.close();

			return result;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(String code) {
		String sql = "DELETE FROM INFOBOARDS WHERE CODE=?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, code);

			int result = st.executeUpdate();

			st.close();
			con.close();

			return result;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int getSize(String query, String field) {
		String sql = "SELECT COUNT(*) CNT FROM INFOBOARDS WHERE " + field
				+ " LIKE ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, "%" + query + "%");

			ResultSet rs = st.executeQuery();

			// 모델마련하기
			rs.next();

			int size = rs.getInt("CNT");

			rs.close();
			st.close();
			con.close();

			return size;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int getSize(String query) {

		return getSize(query, "TITLE");
	}

	@Override
	public String lastCode() {
		String sql = "SELECT ISNULL(MAX(CAST(CODE AS INT)), 0) Code  FROM INFOBOARDS";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			rs.next();
			String code = rs.getString("Code");

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Infomation prevInfomation(String curCode) {
		String sql = "SELECT TOP 1 * FROM INFOBOARDS"
				+ " WHERE REGDATE > (SELECT REGDATE FROM INFOBOARDS WHERE CODE = ?) "
				+ " ORDER BY REGDATE ASC";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis",
					"tennis89");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, curCode);
			ResultSet rs = st.executeQuery();

			rs.next();

			Infomation b = new Infomation();
			b.setCode(rs.getString("CODE"));
			b.setTitle(rs.getString("TITLE"));
			b.setWriter(rs.getString("WRITER"));
			b.setRegdate(rs.getDate("REGDATE"));
			b.setHit(rs.getInt("HIT"));
			b.setContent(rs.getString("CONTENT"));

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Infomation nextInfomation(String curCode) {
		String sql = "SELECT TOP 1 * FROM INFOBOARDS "
				+ " WHERE REGDATE < (SELECT REGDATE FROM INFOBOARDS WHERE CODE = ?) "
				+ " ORDER BY REGDATE DESC";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis",
					"tennis89");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, curCode);
			ResultSet rs = st.executeQuery();

			rs.next();

			Infomation b = new Infomation();
			b.setCode(rs.getString("CODE"));
			b.setTitle(rs.getString("TITLE"));
			b.setWriter(rs.getString("WRITER"));
			b.setRegdate(rs.getDate("REGDATE"));
			b.setHit(rs.getInt("HIT"));
			b.setContent(rs.getString("CONTENT"));

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
