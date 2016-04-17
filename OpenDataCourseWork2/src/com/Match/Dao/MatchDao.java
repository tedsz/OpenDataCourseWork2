package com.Match.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Dao.BaseDao;
import com.Entity.Match;
import com.sun.prism.paint.RadialGradient;



public class MatchDao extends BaseDao {
	private int noOfRecords;
	public List<Match> queryHistoryMatch(String clubName,int offset,int noOfRecords){
		List<Match> matchList = new ArrayList<>();
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
//			ps = con.prepareStatement("select SQL_CALC_FOUND_ROWS * from footballdata where HomeTeam = ? or AwayTeam=? limit"
//										+offset + "," + noOfRecords);
			ps = con.prepareStatement("select  SQL_CALC_FOUND_ROWS * from footballdata where HomeTeam = ? or AwayTeam=? LIMIT ?,?" );
			ps.setString(1, clubName);
			ps.setString(2, clubName);
			ps.setInt(3, offset);
			ps.setInt(4, noOfRecords);
			
			rs=ps.executeQuery();
			while(rs.next()){
				Match match = new Match();
				match.setSeason(rs.getString("Div"));
				match.setDate(rs.getDate("Date"));
				match.setHomeTeam(rs.getString("HomeTeam"));
				match.setAwayTeam(rs.getString("AwayTeam"));
				match.setFTHG(rs.getInt("FTHG"));
				matchList.add(match);
				System.out.println(match.getSeason());
				System.out.println(match.getFTHG());
			}
			PreparedStatement resultCount = con.prepareStatement("select Count(*) from footballdata where HomeTeam =? and FTR=?");
			resultCount.setString(1, clubName);
			resultCount.setString(2, "H");
			ResultSet count = null;
			count = resultCount.executeQuery();
			int number = 0;
			while(count.next()){
				 number = count.getInt("Count(*)");
			}
			
			System.out.println("Count="+number);
			rs.close();
			rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
               this.noOfRecords = rs.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return matchList;
		}
	public int getNoOfRecords() {
        return noOfRecords;
    }
}
