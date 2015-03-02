package com.htmtennis.prj.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.htmtennis.prj.model.Court;

import com.htmtennis.prj.dao.CourtDao;
import com.htmtennis.prj.model.Court;

public class JdbcCourtDao implements CourtDao{

	@Override
	public Court getCourt(String code) {
		String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=newlecdb";
		String sql = "SELECT * FROM NOTICES WHERE CODE = '"+ code+"'";
		

			try {
				//Class.forName("oracle.jdbc.driver.OracleDriver");
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				
				Connection con = DriverManager.getConnection(url, "tennis", "tennis89"); 
			      Statement st = con.createStatement(); 
			      ResultSet rs = st.executeQuery(sql);     
				
				rs.next();
				
				//모델 마련하기
				Court c = new Court();
				
				c.setCode(rs.getInt(code));
				c.setName(rs.getString("name"));
				c.setAddress(rs.getString("address"));
				c.setPhoNum(rs.getString("phoNum"));
			    c.setSite(rs.getString("site"));
			  	
				
			  	rs.close();
				st.close();
				con.close();
				return c;
				
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
	public List<Court> getCourts(int page, String query, String field) {
		int start=1+(page-1)*20;
	    int end= 20+(page-1)*20;
		
		/*String sql = "SELECT *FROM (SELECT ROWNUM NUM, NO.* FROM ( "
	            + "SELECT * FROM NOTICES WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) NO) "
	            + "WHERE NUM BETWEEN ? AND ?";*/
		/*String url = "jdbc:oracle:thin:@win.newlecture.com:1521:orcl";*/
	    /*String sql = "SELECT * FROM NOTICES";*/
	    String sql = "SELECT N.* FROM("
	             + "SELECT (ROW_NUMBER() OVER(ORDER BY REGDATE DESC)"
	             + ")NUM, NOTICES.* FROM NOTICES WHERE "+field+" LIKE ?) N "
	             + "WHERE N.NUM BETWEEN ? AND ?";
	    
		String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=tennisdb";

			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				
				Connection con = DriverManager.getConnection(url, "tennis", "tennis89"); 
			    PreparedStatement st = con.prepareStatement(sql); 
			    st.setString(1, "%"+query+"%");
			    st.setInt(2, start);
			    st.setInt(3, end);
			    
			    ResultSet rs = st.executeQuery();     
				
			    List<Court> list = new ArrayList<Court>();
				
			    while(rs.next())
			    {
					//모델 마련하기
					Court c = new Court();
					
					c.setCode(rs.getInt("code"));
					c.setName(rs.getString("name"));
					c.setAddress(rs.getString("address"));
					c.setPhoNum(rs.getString("phoNum"));
				    c.setSite(rs.getString("site"));
					
				  	list.add(c);
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
	public List<Court> getCourts(int page, String query) {
		return getCourts(page, query, "name");
		
	}

	@Override
	public List<Court> getCourts(int page) {
		return getCourts(page, "");
		
	}

	@Override
	public int insert(Court court) {
		String sqlCode = "SELECT NVL(TO_NUMBER(MAX(CODE)), 0)+1 CODE FROM NOTICES";	/*코드를생성하기위해*/
        String sql = "INSERT INTO NOTICES(CODE, TITLE, WRITER, CONTENT, REGDATE, HIT) VALUES(?,?,?,?,SYSDATE,0)";

        //String url = "jdbc:oracle:thin:@win.newlecture.com:1521:orcl";
        String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=newlecdb";
        try {
           //Class.forName("oracle.jdbc.driver.OracleDriver");
   	 		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
           
           Statement stCode=con.createStatement();
           ResultSet rs=stCode.executeQuery(sqlCode);
           rs.next();
           String code=rs.getString("CODE");
           
           rs.close();
           stCode.close();
           
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, code);
           st.setString(2, court.getName());
           st.setString(3, court.getAddress());
           st.setString(4, court.getPhoNum());

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
	public int update(Court court) {
		String sql = "UPDATE NOTICES SET TITLE=?, CONTENT=? WHERE CODE=?";

        //String url = "jdbc:oracle:thin:@win.newlecture.com:1521:orcl";
        String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=newlecdb";
        try {
          // Class.forName("oracle.jdbc.driver.OracleDriver");
       	 	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           Connection con = DriverManager.getConnection(url, "tennis", "tennis89");
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, court.getName());
           st.setString(2, court.getAddress());
           st.setInt(3, court.getCode());

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
		 String sql = "DELETE FROM NOTICES WHERE CODE=?";

         //String url = "jdbc:oracle:thin:@win.newlecture.com:1521:orcl";
         String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=newlecdb";
         try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
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

	/*@Override
	public int getSize(String query, String field) {
		return 0;
		
	}

	@Override
	public int getSize(String query) {
		return 0;
		
	}*/

}
