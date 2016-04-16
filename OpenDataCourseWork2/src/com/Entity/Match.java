package com.Entity;

import java.util.Date;

public class Match {
	//Set properties for match
	private int matchId; 
	private String season; //The exact season year of the match
	private Date date; // The exact holding date of the match
	private String homeTeam;//The home team name
	private String awayTeam;//The away team name
	private int FTHG;// The full time goal of home team
	private int FTAG;//The full time goal of away team
	private String fullTimeResult;//The result of full time match; A-Away team win/H-Home team win;
	private String halfTimeResult;//The result of half time match; A-Away team win/H-Home team win;
	//Define set and get methods
	public int getMatchId() {
		return matchId;
	}
	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	public int getFTHG() {
		return FTHG;
	}
	public void setFTHG(int fTHG) {
		FTHG = fTHG;
	}
	public int getFTAG() {
		return FTAG;
	}
	public void setFTAG(int fTAG) {
		FTAG = fTAG;
	}
	public String getFullTimeResult() {
		return fullTimeResult;
	}
	public void setFullTimeResult(String fullTimeResult) {
		this.fullTimeResult = fullTimeResult;
	}
	public String getHalfTimeResult() {
		return halfTimeResult;
	}
	public void setHalfTimeResult(String halfTimeResult) {
		this.halfTimeResult = halfTimeResult;
	}
	
	
	
}
