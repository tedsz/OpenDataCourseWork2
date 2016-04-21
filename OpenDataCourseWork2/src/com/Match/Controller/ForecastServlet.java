package com.Match.Controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Entity.Match;
import com.Match.Dao.ForecastDao;

/**
 * Servlet implementation class ForecastServlet
 */
@WebServlet("/ForecastServlet")
public class ForecastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForecastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			
			
			
	}
	/**
	 * Define algorithm based on Elo Rating prediction system to calculate the winning chance for both AwayTeam and AwayTeam
	 */
	
	/*
	 * Define a function to calculate the rating score of a team; 
	 * -WIN:Plus 3 rate
	 * -Draw:Plus 1 rate
	 * -Lose:Plus 0 rate
	 */
		public int calculateRating(int wonCount,int drawCount){
			
			int rating = wonCount * 3/10 + drawCount * 1/10; 
			return rating;
		}
		
	/*
	 * Define a function to predict the winning chance as a HomeTeam
	 * According to Elo Rating algorithm, winning chance of HomeTeam = 44.8% + (0.53% * (The rating subtraction of two teams))
	 */
		public String predictChanceAsHomeTeam(int ratingSubstraction){
			//Set data format
			NumberFormat numberFormat = NumberFormat.getInstance();
			numberFormat.setMaximumFractionDigits(2);
			//Calculate the chance according Elo equation
			String winningChanceAsHomeTeam = numberFormat.format(((float)(44.8)/100+(float)(0.53/100) * (float)ratingSubstraction)*100)+"%";
			return winningChanceAsHomeTeam;
		}

	/*
	 * Define a function to predict the winning chance as a AwayTeam
	 * According to Elo Rating algorithm, winning chance of AwayTeam = 24.5% + (0.39% * (The rating subtraction of two teams))
	 */
		public String predictChanceAsAwayTeam(int ratingSubtraction){
			//Set data format
			NumberFormat numberFormat = NumberFormat.getInstance();
			numberFormat.setMaximumFractionDigits(2);
			//Calculate the chance according Elo equation
			String winningChanceAsAwayTeam = numberFormat.format(((float)24.5/100+(float)0.39/100 * (float)ratingSubtraction)*100)+"%";
			return winningChanceAsAwayTeam;
		}
	/*
	 * Define a function to predict the chance of draw 
	  */
		public String predictDrawChanceAsAwayTeam(int ratingSubtraction){
			NumberFormat numberFormat = NumberFormat.getInstance();
			numberFormat.setMaximumFractionDigits(2);
			//Calculate the draw chance 
			String drwaChance = numberFormat.format((1-(float)24.5/100+(float)0.39/100 * (float)ratingSubtraction-((float)(44.8)/100+(float)(0.53/100) * (float)ratingSubtraction))*100)+"%";
			return drwaChance;
		}
	/**
	 * Define a function to print the data containing goal number to .csv file
	 */
		public void printToFile(List<Match> matchList) {
			PrintStream dataConsole;
			try {
				dataConsole = new PrintStream(new File("E:/Southampton Master/Msc Degree/Github/OpendataCoursework/OpenDataCourseWork2/WebContent/goalData.csv"));
				System.setOut(dataConsole);
				//Print the row name on the first line
				dataConsole.println("Season"+","+"Date"+","+"HomeTeam"+","+"AwayTeam"+","+"FTHG"+","+"FTAG"+","+"FTR");
				for(int i = 0;i < matchList.size();i++){
					dataConsole.println(matchList.get(i).getSeason()+","+matchList.get(i).getDate()+","+
										matchList.get(i).getHomeTeam()+","+matchList.get(i).getAwayTeam()+","+
										matchList.get(i).getFTHG()+","+matchList.get(i).getFTAG()+","+
										matchList.get(i).getFullTimeResult());
				}
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Accept the team name from jsp page and acquire the match statistic data and calculate the winning chance of two teams 
					
				//Get the team names of home team and away team;
					//Check whether the name is null;
					String homeTeam = request.getParameter("HomeTeam");
					String awayTeam = request.getParameter("AwayTeam");
					System.out.println("The forecast servlet:"+homeTeam+"||"+ awayTeam);
					//Set the parameter session for pk section
					//request.getSession().setAttribute("jump", "yes");
				//Call the query method in Dao to get the match statistic data
					HashMap<String, Integer> matchCountMap = new HashMap<>();
					ForecastDao forecastDao = new ForecastDao();
					matchCountMap = forecastDao.teamWonAndDrawCount(homeTeam, awayTeam);
				/*
				 * Get the match count data from HashMap
				 * -wonAsHomeCount: The number of matches the HomeTeam won
				 * -drawAsHomeCount:The number of matches the HomeTeam draw
				 * -wonAsAwayCount: The number of matches the AwayTeam won
				 * -drawAsAwayCount:The number of matches the AwayTeam draw
				 */
					int wonAsHomeCount = matchCountMap.get("wonAsHomeCount");
					int drawAsHomeCount = matchCountMap.get("drawAsHomeCount");
					int wonAsAwayCount = matchCountMap.get("wonAsAwayCount");
					int drawAsAwayCount = matchCountMap.get("drawAsAwayCount");
					
				//Using the match data to calculate the winning chance of two teams
				//Get the rating of HomeTeam and AwayTeam
					int homeTeamRating = calculateRating(drawAsHomeCount, drawAsHomeCount);
					int awayTeamRating = calculateRating(wonAsAwayCount, drawAsAwayCount);
				//Get the subtraction of HomeTeamRating and AwayTeamRating
					int ratingSubtraction = homeTeamRating - awayTeamRating;
				//Calculate the winning chance of HomeTeam 
					String winningChanceOfHomeTeam = predictChanceAsHomeTeam(ratingSubtraction);
				//Calculate the winning chance of AwayTeam 
					String winningChanceOfAwayTeam = predictChanceAsAwayTeam(ratingSubtraction);
				//Calculate the draw chance 
					String drawChance = predictDrawChanceAsAwayTeam(ratingSubtraction);
						
				/**
				 * Get the matches result of two particular teams and print the result to a csv file
				 */
					List<Match> matchResultList = new ArrayList<>();
					matchResultList = forecastDao.queryMatchesOfTwoTeams(homeTeam, awayTeam);
					printToFile(matchResultList);
					
				//Store the result data into session
					request.getSession().setAttribute("winningChanceOfHomeTeam", winningChanceOfHomeTeam);
					request.getSession().setAttribute("winningChanceOfAwayTeam", winningChanceOfAwayTeam);
					request.getSession().setAttribute("drawChance", drawChance);
					request.getSession().setAttribute("matchAgainstResult", matchResultList);
					response.sendRedirect("forecast.jsp?jump=yes&color=yes#pk");
	}

}
