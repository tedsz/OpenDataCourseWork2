package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	/*
	 * define the method to connect the database;
	 */
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/footballdata?useUnicode=true&characterEncoding=UTF-8";
			connection = DriverManager.getConnection(url,"root","123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return connection;
	}
	/*
	 * define the method to close the database connection after finishing a data processing
	 */
	public void closeCon(ResultSet rs,PreparedStatement pstm,Connection con){
		 if(rs!=null)
       {
           try {
               con.close();
           } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
           rs=null;
       }
       if(con!=null)
       {
           try {
               con.close();
           } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
           con=null;
       }
       if(pstm!=null)
       {
           try {
          	 pstm.close();
           } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
           pstm=null;
       }}
}
