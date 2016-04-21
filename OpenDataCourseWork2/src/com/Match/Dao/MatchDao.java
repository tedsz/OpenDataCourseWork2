package com.Match.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
				match.setSeason(rs.getString("Season"));
				match.setDate(rs.getDate("Date"));
				match.setHomeTeam(rs.getString("HomeTeam"));
				match.setAwayTeam(rs.getString("AwayTeam"));
				match.setFTHG(rs.getInt("FTHG"));
				match.setFTAG(rs.getInt("FTAG"));
				match.setFullTimeResult(rs.getString("FTR"));
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
	
	//Define a function to count the percentage of winning,draw and lose in the past 6 seasons
	public HashMap<String,String> calPercent(String clubName){
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//Set a Hashmao variable to store the percent result
		HashMap<String, String> percentMap = new HashMap<>();
		/*
		 * Count the matches the team played in the last 6 seasons.
		 */
		int wholeMatchCount = 0;
		int wholeAwayMatchCount = 0;
		//Set data format
		NumberFormat numberFormat = NumberFormat.getInstance();
		numberFormat.setMaximumFractionDigits(2);
		//Excute the sql query
		try {
			String sql = "select count(*) from footballdata where HomeTeam = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, clubName);
			
			rs = ps.executeQuery();
		//Get the count result;
			while(rs.next()){
				wholeMatchCount = rs.getInt("count(*)");
			}
			rs.close();
		/*
		 * Count matches and percent the team won as Hometeam
		 */
			int wonAsHomeCount = 0;
			String wonAsHomePercent;
			ps = con.prepareStatement("select count(*) from footballdata where HomeTeam = ? and FTR = ?");
			ps.setString(1, clubName);
			ps.setString(2, "H");
			rs = ps.executeQuery();
			//Get the count result
			while(rs.next()){
				wonAsHomeCount = rs.getInt("count(*)");
			}
			//Calculate the percent won as home team
			wonAsHomePercent = numberFormat.format((float)wonAsHomeCount/(float)wholeMatchCount*100)+"%";
			
			//Add this percent to hashmap
			percentMap.put("wonAsHomePercent", wonAsHomePercent);
			rs.close();
		/*
		 * Count matches and percent draw as home team
		 */
			int drawAsHomeTeam = 0;
			String drawAsHomePercent;
			ps = con.prepareStatement("select count(*) from footballdata where HomeTeam = ? and FTR = ?");
			ps.setString(1, clubName);
			ps.setString(2, "D");
			rs = ps.executeQuery();
			//Get the result
			while(rs.next()){
				drawAsHomeTeam = rs.getInt("count(*)");
			}
			//Calculate the percent draw as home team
			drawAsHomePercent = numberFormat.format((float)drawAsHomeTeam/(float)wholeMatchCount*100)+"%";
			
			//Add to hashmap
			percentMap.put("drawAsHomePercent", drawAsHomePercent);
			rs.close();
		/*
		 * Count matches and percent lose as home team
		 **/
			int loseAsHomeTeam = 0;
			String loseAsHomePercent;
			ps = con.prepareStatement("select count(*) from footballdata where HomeTeam = ? and FTR = ?");
			ps.setString(1, clubName);
			ps.setString(2, "A");
			rs = ps.executeQuery();
			//Get the result
			while(rs.next()){
				loseAsHomeTeam = rs.getInt("count(*)");
			}
			//Calculate the percent lose as home team
			loseAsHomePercent = numberFormat.format((float)loseAsHomeTeam/(float)wholeMatchCount*100)+"%";
			//Add to hashmap
			percentMap.put("loseAsHomePercent", loseAsHomePercent);
			
		/*
		 * Calculate the match and percent as Away team
		  */
			
			ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ?");
			ps.setString(1, clubName);
			
			rs = ps.executeQuery();
		//Get the count result;
			while(rs.next()){
				wholeAwayMatchCount = rs.getInt("count(*)");
			}
			rs.close();
			/*
			 * Count matches and percent the team won as AwayTeam
			 */
				int wonAsAwayCount = 0;
				String wonAsAwayPercent;
				ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ? and FTR = ?");
				ps.setString(1, clubName);
				ps.setString(2, "H");
				rs = ps.executeQuery();
				//Get the count result
				while(rs.next()){
					wonAsAwayCount = rs.getInt("count(*)");
				}
				//Calculate the percent won as away team
				wonAsAwayPercent = numberFormat.format((float)wonAsAwayCount/(float)wholeAwayMatchCount*100)+"%";
				
				//Add this percent to hashmap
				percentMap.put("wonAsAwayPercent", wonAsAwayPercent);
				rs.close();
				/*
				 * Count matches and percent draw as home team
				 */
					int drawAsAwayTeam = 0;
					String drawAsAwayPercent;
					ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ? and FTR = ?");
					ps.setString(1, clubName);
					ps.setString(2, "D");
					rs = ps.executeQuery();
					//Get the result
					while(rs.next()){
						drawAsAwayTeam = rs.getInt("count(*)");
					}
					//Calculate the percent draw as home team
					drawAsAwayPercent = numberFormat.format((float)drawAsAwayTeam/(float)wholeAwayMatchCount*100)+"%";
					
					//Add to hashmap
					percentMap.put("drawAsAwayPercent", drawAsAwayPercent);
					rs.close();
					/*
					 * Count matches and percent lose as away team
					 **/
						int loseAsAwayTeam = 0;
						String loseAsAwayPercent;
						ps = con.prepareStatement("select count(*) from footballdata where AwayTeam = ? and FTR = ?");
						ps.setString(1, clubName);
						ps.setString(2, "A");
						rs = ps.executeQuery();
						//Get the result
						while(rs.next()){
							loseAsAwayTeam = rs.getInt("count(*)");
						}
						//Calculate the percent lose as home team
						loseAsAwayPercent = numberFormat.format((float)loseAsAwayTeam/(float)wholeAwayMatchCount*100)+"%";
						//Add to hashmap
						percentMap.put("loseAsAwayPercent", loseAsAwayPercent);
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return percentMap;
	}
	//Define the method to select the history result based on certain season
	public List<Match> queryHistoryMatchBasedOnSeason(String clubName,String season,int offset,int noOfRecords){
		List<Match> matchList = new ArrayList<>();
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			ps = con.prepareStatement("select  SQL_CALC_FOUND_ROWS * from footballdata where  Season = ? and (HomeTeam = ? or AwayTeam = ?)   LIMIT ?,?" );
			ps.setString(1, season);
			ps.setString(2, clubName);
			ps.setString(3, clubName);
			ps.setInt(4, offset);
			ps.setInt(5, noOfRecords);
			rs=ps.executeQuery();
			while(rs.next()){
				Match match = new Match();
				match.setSeason(rs.getString("Season"));
				match.setDate(rs.getDate("Date"));
				match.setHomeTeam(rs.getString("HomeTeam"));
				match.setAwayTeam(rs.getString("AwayTeam"));
				match.setFTHG(rs.getInt("FTHG"));
				match.setFTAG(rs.getInt("FTAG"));
				match.setFullTimeResult(rs.getString("FTR"));
				matchList.add(match);
				
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
			rs.close();
			rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
               this.noOfRecords = rs.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return matchList;
		}

}
