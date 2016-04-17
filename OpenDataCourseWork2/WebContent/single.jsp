<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
 <%@page import="java.util.HashMap"%>
<html>
<head>
  <!-- Site made with Mobirise Website Builder v2.10, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v2.10, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/logo-1050x1050-40.png" type="image/x-icon">
  <meta name="description" content="">
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  
</head>
<body>
<!-- Get the dynamic content from session -->
<%
	String clubName = (String)request.getSession().getAttribute("currentTeam"); 
	HashMap percentMap = new HashMap();
	percentMap = (HashMap)request.getSession().getAttribute("percentMap");
%>

<!--navigation bar-->
<section class="mbr-navbar mbr-navbar--freeze mbr-navbar--absolute mbr-navbar--transparent mbr-navbar--sticky mbr-navbar--auto-collapse" id="menu-0">
    <div class="mbr-navbar__section mbr-section">
        <div class="mbr-section__container container">
            <div class="mbr-navbar__container">
                <div class="mbr-navbar__column mbr-navbar__column--s mbr-navbar__brand">
                    <span class="mbr-navbar__brand-link mbr-brand mbr-brand--inline">
                        <span class="mbr-brand__logo"><a href="index.jsp"><img src="assets/images/logo-1050x1050-40.png" class="mbr-navbar__brand-img mbr-brand__img" alt="home"></a></span>
                        <span class="mbr-brand__name"><a class="mbr-brand__name text-white" href="index.jsp">FOOTBALL &nbsp;FORECAST</a></span>
                    </span>
                </div>
                <div class="mbr-navbar__hamburger mbr-hamburger"><span class="mbr-hamburger__line"></span></div>
                <div class="mbr-navbar__column mbr-navbar__menu">
                    <nav class="mbr-navbar__menu-box mbr-navbar__menu-box--inline-right">
                        <div class="mbr-navbar__column"><ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="index.jsp#form1-10">OVERVIEW</a></li><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="index.jsp#features1-11">SINGLE CLUB</a></li></ul></div>
                        <div class="mbr-navbar__column"><ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-inverse mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__btn btn btn-default" href="forecast.html">PREDICTION</a></li></ul></div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>

<!--club overview-->
<section class="engine"></section><section class="mbr-box mbr-section mbr-section--relative mbr-section--fixed-size mbr-section--full-height mbr-section--bg-adapted mbr-parallax-background mbr-after-navbar" id="header2-19" style="background-image: url(assets/images/grass-1920x1200-44.jpg);">
    <div class="mbr-box__magnet mbr-box__magnet--sm-padding mbr-box__magnet--center-left" style="padding-bottom: 100px;">
        <div class="mbr-overlay" style="opacity: 0.7; background-color: rgb(34, 34, 34);"></div>
        <div class="mbr-box__container mbr-section__container container">
            <div class="mbr-box mbr-box--stretched">
                <div class="mbr-box__magnet mbr-box__magnet--center-left">
                    <div class="row">
                        <div class="animated fadeInUp col-md-offset-1 col-md-4 delay">
                            <img style="max-width: 300px;" src="assets/images/club%20Images/<%=clubName%>.png">
                        </div>
                        <div class=" col-md-6">
                            <div class="mbr-hero animated fadeInUp">
                                <h1 class="mbr-hero__text" id="clubname"><%=clubName%></h1>
                                <!-- table of club overview-->
                                <table class="table" style="font-weight: bold; font-size:1.5em;">
                                    <tr>
                                        <th></th>
                                        <th>HOME</th>
                                        <th>AWAY</th>
                                    </tr>
                                    <tr>
                                        <td>WIN</td>
                                        <td>${percentMap.get("wonAsHomePercent")}</td>
                                        <td>${percentMap.get("wonAsAwayPercent")}</td>
                                    </tr>
                                    <tr>
                                        <td>DRAW</td>
                                        <td>${percentMap.get("drawAsHomePercent")} </td>
                                        <td>${percentMap.get("drawAsAwayPercent")}</td>
                                    </tr>
                                    <tr>
                                        <td>LOSE</td>
                                        <td>${percentMap.get("loseAsHomePercent")}</td>
                                        <td>${percentMap.get("loseAsAwayPercent")}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--club details info.-->
<section class="mbr-section mbr-section--relative mbr-section--short-paddings" id="msg-box1-29" style="background-color: rgba(214, 214, 214, 0.64)">
    <div class="mbr-section__container mbr-section__container--isolated container" style="padding-top: 40px; padding-bottom: 40px;">
        <div class="row">
            <!--<div class="mbr-box mbr-box&#45;&#45;fixed mbr-box&#45;&#45;adapted">-->
                <!--<div class="mbr-box__magnet mbr-box__magnet&#45;&#45;top-left mbr-section__left">-->
                    <div class="row">
                        <div class="mbr-header mbr-header--auto-align mbr-header--wysiwyg col-md-8">
                            <h3 class="mbr-header__text" style="color: black;">CLUB MATCH INFO.</h3>
                        </div>
                        <div class="btn-group col-md-offset-10 col-md-4">
                            <button type="button" class=" mbr-buttons__btn btn btn-primary  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                SEASON <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li id="2010/2011"><a href="#">2010/2011</a></li>
                                <li id="2011/2012"><a href="#">2011/2012</a></li>
                                <li id="2012/2013"><a href="#">2012/2013</a></li>
                                <li id="2013/2014"><a href="#">2013/2014</a></li>
                                <li id="2014/2015"><a href="#">2014/2015</a></li>
                                <li id="2015/2016"><a href="#">2015/2016</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="mbr-section__container">
                        <!-- tables of club details-->
                        <table border="0" class="table table-striped table-hover" style="table-layout:fixed; word-wrap:break-word;" id="detail">
                            <tr>
                                <th>Season</th>
                                <th>Date</th>
                                <th>Home Team</th>
                                <th>Away Team</th>
                                <th>Home Goal</th>
                                <th>Away Goal</th>
                                <th>Match Result</th>
                            </tr>
                            <c:forEach var="match" items="${matchList}">
                            <tr>
                               	<td>${match.season}</td>
								<td>${match.date}</td>
								<td>${match.homeTeam}</td>
								<td>${match.awayTeam}</td>
								<td>${match.FTHG}</td>
								<td>${match.FTAG}</td>
								<td>${match.fullTimeResult}</td>
                            </tr>
                            </c:forEach>
                        </table>
                        <%--For displaying Page numbers. 
						    The when condition does not display a link for the current page--%>
						    <table border="0" style="width:400px;">
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
						        <td><a href="MatchResultServlet?page=${currentPage + 1}&clubName=${currentTeam}#detail">Next</a></td>
						    </c:if>
						    
                    </div>
                <!--</div>-->
            <!--</div>-->
        </div>
    </div>

</section>

<!--footer-->
<footer class="mbr-section mbr-section--relative mbr-section--fixed-size" id="footer1-2" style="background-color: rgb(68, 68, 68);">
    
    <div class="mbr-section__container container">
        <div class="mbr-footer mbr-footer--wysiwyg row" style="padding-top: 36px; padding-bottom: 36px;">
            <div class="col-sm-12">
                <p class="mbr-footer__copyright"></p><p>Copyright (c) 2016 OPEN DATA CW2&nbsp;&nbsp;</p><p></p>
            </div>
        </div>
    </div>
</footer>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/SmoothScroll.js"></script>
  <script src="assets/jarallax/jarallax.js"></script>
  <script src="assets/mobirise/js/script.js"></script>



</body>
</html>>