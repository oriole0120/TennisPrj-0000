package com.htmtennis.prj.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.htmtennis.prj.dao.FreeFileDao;
import com.htmtennis.prj.model.FreeFile;



public class JdbcFreeFileDao implements FreeFileDao {

	@Override
	public List<FreeFile> getFreeFiles(String freeCode) {
		String sql = "SELECT * FROM FREEBOARDS WHERE NOTICECODE = ?";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			PreparedStatement st = con.prepareStatement(sql);
								
			st.setString(1, freeCode);
						
			ResultSet rs = st.executeQuery();

			List<FreeFile> list = new ArrayList<FreeFile>();
			
			//모델마련하기		
			while(rs.next()){
		
				FreeFile n = new FreeFile();
				n.setCode(rs.getString("Code"));
				n.setSrc(rs.getString("Src"));
				n.setRegdate(rs.getDate("Regdate"));
				n.setDescription(rs.getString("Description"));
				n.setFreeCode("FreeCode");
			
				list.add(n);
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
	public int insert(FreeFile file) {
		String sql1 = "SELECT ISNULL(MAX(CAST(CODE AS INT)), 0)+1 CODE FROM FreeFileS";
		
		String sql = "INSERT INTO FREEFILES(Code, Src, Regdate, Description, NoticeCode ) VALUES(?, ?, getDate(), ?, ?)";
		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=tennisdb";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
			Statement stCode = con.createStatement();
			ResultSet rs = stCode.executeQuery(sql1);
			
			rs.next();
			String code = rs.getString("Code"); 
					
			rs.close();
			stCode.close();
			
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, code);
			st.setString(2, file.getSrc());
			st.setString(3, file.getDescription());
			st.setString(4, file.getFreeCode());

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
}
