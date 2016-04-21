package com.Match.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.Dao.BaseDao;
import com.Entity.Match;

public class ForecastDao extends BaseDao{
	Connection con = this.getConnection();
	PreparedStatement ps = null;
	ResultSet rs = null;
	//Define hashMap to store the number of matches team won and draw.
	HashMap<String, Integer> matchCountMap = new HashMap<>();
	//Define a method to select and calculate the number of matches HomeTeam Won and draw.
	public HashMap<String, Integer> teamWonAndDrawCount(String homeTeam,String awayTeam){
		
	try {
		//Count the matches that home team won
		int wonAsHomeCount = 0;
		ps = con.prepareStatement("select count(*) from footballdata where HomeTeam = ? and FTR = ?");
		ps.setString(1, homeTeam);
		ps.setString(2, "H");
		rs = ps.executeQuery();
		//Get the count result
		while(rs.next()){
			wonAsHomeCount = rs.getInt("count(*)");
		}
		//Add this percent to hashmap
		matchCountMap.put("wonAsHomeCount", wonAsHomeCount);
		rs.close();
		
		//Count the matches that home team draw
		int drawAsHomeCount = 0;
		ps = con.prepareStatement("select count(*) from footballdata where HomeTeam = ? and FTR = ?");
		ps.setString(1, homeTeam);
		ps.setString(2, "D");
		rs = ps.executeQuery();
		//Get the count result
		while(rs.next()){
			drawAsHomeCount = rs.getInt("count(*)");
		}
		//Add this percent to hashmap
		matchCountMap.put("drawAsHomeCount", drawAsHomeCount);
		rs.close();
		
		//Count the matches that away team won
		int wonAsAwayCount = 0;
		ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ? and FTR = ?");
		ps.setString(1, awayTeam);
		ps.setString(2, "A");
		rs = ps.executeQuery();
		//Get the count result
		while(rs.next()){
			wonAsAwayCount = rs.getInt("count(*)");
		}
		//Add this percent to hashmap
		matchCountMap.put("wonAsAwayCount", wonAsAwayCount);
		rs.close();
		
		//Count the matches that away team draw
		int drawAsAwayCount = 0;
		ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ? and FTR = ?");
		ps.setString(1, awayTeam);
		ps.setString(2, "D");
		rs = ps.executeQuery();
		//Get the count result
		while(rs.next()){
			drawAsAwayCount = rs.getInt("count(*)");
		}
		//Add this percent to hashmap
		matchCountMap.put("drawAsAwayCount", drawAsAwayCount);
		rs.close();
		
	} catch (Exception e) {
		// TODO: handle exception
	}
		return matchCountMap;
	}
	//Define a method to select the matches between particular HomeTeam and AwayTeam
		
		public List<Match> queryMatchesOfTwoTeams(String HomeTeam,String AwayTeam){
			List<Match> matchList = new ArrayList<>();
			try {
				ps = con.prepareStatement("select * from footballdata where HomeTeam = ? and AwayTeam = ?");
				ps.setString(1, HomeTeam);
				ps.setString(2, AwayTeam);
				rs = ps.executeQuery();
				while(rs.next()){
					Match matchResult = new Match();
					matchResult.setSeason(rs.getString("Season"));
					matchResult.setDate(rs.getDate("Date"));
					matchResult.setHomeTeam(rs.getString("HomeTeam"));
					matchResult.setAwayTeam(rs.getString("AwayTeam"));
					matchResult.setFTHG(rs.getInt("FTHG"));
					matchResult.setFTAG(rs.getInt("FTAG"));
					matchResult.setFullTimeResult(rs.getString("FTR"));
					matchList.add(matchResult);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return matchList;
		}
}
