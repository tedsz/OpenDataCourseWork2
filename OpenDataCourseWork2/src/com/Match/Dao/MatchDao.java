package com.Match.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Dao.BaseDao;
import com.Entity.Match;



public class MatchDao extends BaseDao {
	public List<Match> queryHistoryMatch(String clubName){
		List<Match> matchList = new ArrayList<>();
		
		Connection con = this.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Match match = new Match();
		try {
			ps = con.prepareStatement("select * from footballdata where HomeTeam = ?");
			ps.setString(1, clubName);
			rs=ps.executeQuery();
			while(rs.next()){
				match.setSeason(rs.getString("Div"));
				match.setFTHG(rs.getInt("FTHG"));
				matchList.add(match);
				System.out.println(match.getSeason());
				System.out.println(match.getFTHG());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return matchList;
		
	}
}
