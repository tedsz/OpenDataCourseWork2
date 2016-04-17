<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String currentTeam = (String)request.getSession().getAttribute("currentTeam"); 
		System.out.print("TEST"+currentTeam);
	  HashMap percentMap = new HashMap();
	  percentMap = (HashMap)request.getSession().getAttribute("percentMap");
	%>
	<table border = "1" cellpadding = "5" cellspacing = "5"> 
		<tr>
			<th>Date</th>
			<th>HomeTeam</th>
			<th>AwayTeam</th>
			<th>FullHomeTeamGoal</th>
		</tr>
		<c:forEach var="match" items="${matchList}">
		<tr>
			<td>${match.date}</td>
			<td>${match.homeTeam}</td>
			<td>${match.awayTeam}</td>
			<td>${match.FTHG}</td>
		</tr>
		</c:forEach>
	</table>
	<%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
    <table border="1" cellpadding="5" cellspacing="5">
        <tr>
            <c:forEach begin="1" end="9" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <td>${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="MatchResultServlet?page=${i}&clubName=${currentTeam}">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
    </table>
     <%--For displaying Previous link except for the 1st page --%>
    <c:if test="${currentPage != 1}">
        <td><a href="MatchResultServlet?page=${currentPage - 1}&clubName=${currentTeam}">Previous</a></td>
    </c:if>
    <%--For displaying Next link --%>
    <c:if test="true">
        <td><a href="MatchResultServlet?page=${currentPage + 1}&clubName=${currentTeam}">Next</a></td>
    </c:if>
    <table>
    	<tr>
    		<td>${percentMap.get("wonAsAwayPercent") }</td>
    	</tr>
    </table>
</body>
</html>