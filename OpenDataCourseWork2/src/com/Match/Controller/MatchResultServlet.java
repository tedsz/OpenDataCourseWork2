package com.Match.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Entity.Match;
import com.Match.Dao.MatchDao;

/**
 * Servlet implementation class MatchResultServlet
 */
@WebServlet("/MatchResultServlet")
public class MatchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Query the records with limitation number per page
		int page = 1;
		int recordsPerPage = 10;
		if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page"));
		
		String clubName = request.getParameter("clubName").toString();
		//Save the clubName to session
		request.getSession().setAttribute("currentTeam", clubName);
		
		MatchDao mDao = new MatchDao();
		List<Match> matchList=mDao.queryHistoryMatch(clubName,(page-1)*recordsPerPage,recordsPerPage);
		
		int noOfRecords = mDao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.getSession().setAttribute("matchList", matchList);
        request.getSession().setAttribute("noOfPages", noOfPages);
        request.getSession().setAttribute("currentPage",page);
        
        //Get the percent result from MatchDao
        HashMap<String, String> percentMap = new HashMap<>();
        percentMap = mDao.calPercent(clubName);
        
		//Save the percentMap into Session
        request.getSession().setAttribute("percentMap", percentMap);
        response.sendRedirect("single.jsp?#msg-box1-29");
        }
		else{
        	
    		
    		String clubName = request.getParameter("clubName").toString();
    		//Save the clubName to session
    		request.getSession().setAttribute("currentTeam", clubName);
    		
    		MatchDao mDao = new MatchDao();
    		List<Match> matchList=mDao.queryHistoryMatch(clubName,(page-1)*recordsPerPage,recordsPerPage);
    		
    		int noOfRecords = mDao.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.getSession().setAttribute("matchList", matchList);
            request.getSession().setAttribute("noOfPages", noOfPages);
            request.getSession().setAttribute("currentPage",page);
            
            //Get the percent result from MatchDao
            HashMap<String, String> percentMap = new HashMap<>();
            percentMap = mDao.calPercent(clubName);
            
    		//Save the percentMap into Session
            request.getSession().setAttribute("percentMap", percentMap);
            response.sendRedirect("single.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
