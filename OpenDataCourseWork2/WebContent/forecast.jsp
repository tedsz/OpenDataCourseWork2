<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <!-- Site made with Mobirise Website Builder v2.10, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v2.10, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/logo-1050x1050-40.png" type="image/x-icon">
  <meta name="description" content="">
<!--   <link href="assets/bootstrap.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-select.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  

  
  
</head>
<body>
<%	
	String winningChanceOfHomeTeam = (String)request.getSession().getAttribute("winningChanceOfHomeTeam");
	String drawChance = (String)request.getSession().getAttribute("drawChance");
	String winningChanceOfAwayTeam = (String)request.getSession().getAttribute("winningChanceOfAwayTeam");
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
                        <div class="mbr-navbar__column"><ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="index.jsp#form1-10">OVERVIEW</a><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="index.jsp#features1-11">SINGLE CLUB</a></ul></div>
                        <div class="mbr-navbar__column"><ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-inverse mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__btn btn btn-default" href="forecast.jsp">PREDICTION</a></ul></div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>

<!--prediction-->
<section class="engine"></section><section class="mbr-parallax-background mbr-section mbr-section--relative mbr-section--fixed-size mbr-background mbr-after-navbar" id="content5-16" style="background-image: url(assets/images/ep-3247x1622-65.jpg);">
    <div class="mbr-overlay" style="opacity: 0.7; background-color:rgba(0, 28, 57, 0.76)"></div>
    <div class="mbr-section__container container mbr-section__container--first" style="padding-top: 40px;padding-bottom: 150px">
        <div class="mbr-header mbr-header--wysiwyg row  animated fadeInUp">
            <div class="col-sm-8 col-sm-offset-2">
                <h3 class="mbr-header__text" style="min-width:330px;">RESULT PREDICTION</h3>
                <div id="chooseteam" class="row" style="min-width:335px;margin-top: 20px;margin-bottom: 25px;padding: 20px 0; border:1px white solid;border-radius: 20px; background-color: rgba(0, 0, 0, 0.70); ">
                    <!-- home-->
                    <div class="col-md-6 mbr-buttons--center"  id="home"  style="padding-top: 20px;">
                     <form action="" method="post" name="teamPKForm" id = "teamPKForm">
                        <select id="hs" name="HomeTeam">
                            <option value="" id="--">--</option>
                            <option value="Arsenal" id="Arsenal">Arsenal</option>
                            <option value="Aston Villa" id="Aston Villa" >Aston Villa</option>
                            <option value="Birmingham" id="Birmingham" >Birmingham</option>
                            <option value="Blackburn" id="Blackburn" >Blackburn</option>
                            <option value="Blackpool" id="Blackpool" >Blackpool</option>
                            <option value="Bolton" id="Bolton" >Bolton</option>
                            <option value="Bournemouth" id="Bournemouth" >Bournemouth</option>
                            <option value="Burnley" id="Burnley" >Burnley</option>
                            <option value="Cardiff" id="Cardiff" >Cardiff</option>
                            <option value="Chelsea" id="Chelsea" >Chelsea</option>
                            <option value="Crystal Palace" id="Crystal Palace" >Crystal Palace</option>
                            <option value="Everton" id="Everton" >Everton</option>
                            <option value="Fulham" id="Fulham" >Fulham</option>
                            <option value="Hull" id="Hull" >Hull</option>
                            <option value="Leicester" id="Leicester" >Leicester</option>
                            <option value="Liverpool" id="Liverpool" >Liverpool</option>
                            <option value="Man City" id="Man City" >Man City</option>
                            <option value="Man United" id="Man United" >Man United</option>
                            <option value="Newcastle" id="Newcastle" >Newcastle</option>
                            <option value="Norwich" id="Norwich" >Norwich</option>
                            <option value="QPR" id="QPR" >QPR</option>
                            <option value="Reading" id="Reading" >Reading</option>
                            <option value="Southampton" id="Southampton" >Southampton</option>
                            <option value="Stoke" id="Stoke" >Stoke</option>
                            <option value="Sunderland" id="Sunderland" >Sunderland</option>
                            <option value="Swansea" id="Swansea" >Swansea</option>
                            <option value="Tottenham" id="Tottenham" >Tottenham</option>
                            <option value="Watford" id="Watford" >Watford</option>
                            <option value="West Brom" id="West Brom" >West Brom</option>
                            <option value="West Ham" id="West Ham" >West Ham</option>
                            <option value="Wigan" id="Wigan" >Wigan</option>
                            <option value="Wolves" id="Wolves" >Wolves</option>
                        </select>
                        <button  id="ht" type="button" onclick="cfunction()" class="btn btn-primary">
                            CHOOSE HOME
                        </button>
                        <div id="homedetail" style="margin-top: 20px;display: none;clear:both;">
                            <img id="homepic" style="max-height: 120px;">
                            <spam id="homename" style="color: white;font-size: 1.5em;text-align: left;padding: 50px 0 0 20px;"></spam>
                        </div>
                    </div>

                    <!-- away-->
                    <div class="col-md-6 mbr-buttons--center"  id="away" style="padding-top: 20px;" >
                        <select id="as" name="AwayTeam">
                            <option value="" id="--">--</option>
                            <option value="Arsenal" id="Arsenal">Arsenal</option>
                            <option value="Aston Villa" id="Aston Villa" >Aston Villa</option>
                            <option value="Birmingham" id="Birmingham" >Birmingham</option>
                            <option value="Blackburn" id="Blackburn" >Blackburn</option>
                            <option value="Blackpool" id="Blackpool" >Blackpool</option>
                            <option value="Bolton" id="Bolton" >Bolton</option>
                            <option value="Bournemouth" id="Bournemouth" >Bournemouth</option>
                            <option value="Burnley" id="Burnley" >Burnley</option>
                            <option value="Cardiff" id="Cardiff" >Cardiff</option>
                            <option value="Chelsea" id="Chelsea" >Chelsea</option>
                            <option value="Crystal Palace" id="Crystal Palace" >Crystal Palace</option>
                            <option value="Everton" id="Everton" >Everton</option>
                            <option value="Fulham" id="Fulham" >Fulham</option>
                            <option value="Hull" id="Hull" >Hull</option>
                            <option value="Leicester" id="Leicester" >Leicester</option>
                            <option value="Liverpool" id="Liverpool" >Liverpool</option>
                            <option value="Man City" id="Man City" >Man City</option>
                            <option value="Man United" id="Man United" >Man United</option>
                            <option value="Newcastle" id="Newcastle" >Newcastle</option>
                            <option value="Norwich" id="Norwich" >Norwich</option>
                            <option value="QPR" id="QPR" >QPR</option>
                            <option value="Reading" id="Reading" >Reading</option>
                            <option value="Southampton" id="Southampton" >Southampton</option>
                            <option value="Stoke" id="Stoke" >Stoke</option>
                            <option value="Sunderland" id="Sunderland" >Sunderland</option>
                            <option value="Swansea" id="Swansea" >Swansea</option>
                            <option value="Tottenham" id="Tottenham" >Tottenham</option>
                            <option value="Watford" id="Watford" >Watford</option>
                            <option value="West Brom" id="West Brom" >West Brom</option>
                            <option value="West Ham" id="West Ham" >West Ham</option>
                            <option value="Wigan" id="Wigan" >Wigan</option>
                            <option value="Wolves" id="Wolves" >Wolves</option>
                        </select>
                        <button  id="at" type="button" onclick="cfunction()"  class="btn btn-primary">
                            CHOOSE AWAY
                        </button>

                        <div class="" id="awaydetail" style=";margin-top: 20px;display: none;clear:both;">
                            <img id="awaypic" style="max-height: 120px;">
                            <span id="awayname" style="color: white;font-size: 1.5em;text-align: left;padding: 50px 0 0 20px;"></span>
                        </div>

                    </div>

                    <!-- button pk-->
                    <div class="mbr-buttons--center col-md-12" style="margin-top: 20px;">
                        <a id="btlink" onclick="click()"><img  id="bt" src="assets/images/football.png" class=" animated fadeInUp delay" style="width: 255px;margin:20px auto;"    /></a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--PK-->
<section style="background-color: rgba(114, 114, 114, 0.68);display:none ;padding: 40px 0; " id="pk">
    <div id="pkdetail" class="delay animated fadeInUp row" style="width: 70%;margin: 0 auto; " >
        <h1 style="text-align: center;margin: 50px 0;" >DATA ANALYSIS</h1>
        <div id="homewin" class="col-md-4 ">
        <%
        	String homeTeamName = (String)request.getSession().getAttribute("homeTeamName");
            String awayTeamName = (String)request.getSession().getAttribute("awayTeamName");
        %>
            <div class="ratecontent">H: <b><%=homeTeamName %></b> WIN RATE</div>
            <div id="homewinrate" class="ratecontent ratedata" style=""><%=winningChanceOfHomeTeam %></div>
        </div>
        <div id="draw" class="col-md-4 ">
            <div class="ratecontent">DRAW RATE</div>
            <div id="drawrate" class="ratecontent ratedata"><%=winningChanceOfAwayTeam %></div>
        </div>
        <div id="awaywin" class="col-md-4 ">
            <div class="ratecontent">A: <b><%=awayTeamName %></b> WIN RATE</div>
            <div id="awaywinrate" class="ratecontent ratedata" style=""><%=drawChance %></div>
        </div>

        <div class="col-md-12" style="border-top: solid 1px black;margin: 40px 0;padding: 20px 0;">
            <div class="ratecontent">FULL TIME GOALS DATA</div>
            <div id="pr_visualization" style="text-align:center;width: 100%;margin:0 auto;"></div>
            
        </div>
        <div class="col-md-12" style="border-top: solid 1px black;padding: 20px 0;">
            <div class="ratecontent">MATCH RAW DATA</div>
            <div id="mdata">
                <table border="0" class="table table-striped table-hover" style="table-layout:fixed;; word-wrap:break-word;">
                    <tr>
                        <th>Div</th>
                        <th>Date</th>
                        <th>Home Team</th>
                        <th>Away Team</th>
                        <th>Home Goal</th>
                        <th>Away Goal</th>
                        <th>Match Result</th>
                    </tr>
                    <c:forEach var="match" items="${matchAgainstResult}">
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
            </div>
        </div>
    </div>
</section>


<footer class="mbr-section mbr-section--relative mbr-section--fixed-size" id="footer1-2" style="background-color: rgb(68, 68, 68);">
    
    <div class="mbr-section__container container">
        <div class="mbr-footer mbr-footer--wysiwyg row" style="padding-top: 37px; padding-bottom: 37px;">
            <div class="col-sm-12">
                <p class="mbr-footer__copyright"></p><p>Copyright (c) 2016 OPEN DATA CW2&nbsp;&nbsp;</p><p></p>
            </div>
        </div>
    </div>
</footer>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap-select.js"></script>

  <script src="assets/smooth-scroll/SmoothScroll.js"></script>
  <script src="assets/mobirise/js/script.js"></script>
  
  <script src="http://d3js.org/d3.v3.min.js"></script>
    <!-- <script src="assets/jquery.js"></script>
    <script src="assets/bootstrap.js"></script> -->
    <script>
    var jump1 = '<%=request.getParameter("jump")%>';
    if (jump1 == 'yes'){
    	var margin = {top: 20, right: 55, bottom: 30, left: 40},
        width  = 600 - margin.left - margin.right,
        height = 350  - margin.top  - margin.bottom;

    var x = d3.scale.ordinal()
        .rangeRoundBands([0, width], .5);

    var y = d3.scale.linear()
        .rangeRound([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    

    var svg = d3.select("#pr_visualization").append("svg")
        .attr("width",  width  + margin.left + margin.right)
        .attr("height", height + margin.top  + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    //数据字典映射
    var dataMaps = {
      "FTHG":"FullTimeHomeTeamGoals",
      "FTAG":"FullTimeAwayTeamGoals"
    }

    d3.csv("goalData.csv", function (error, data) {

      var labelVar = 'Date';
      var varNames = ['FTHG','FTAG'];
      var color = d3.scale.ordinal()
      .range(["rgba(111, 21, 48, 0.73)","rgba(236, 149, 174, 0.86) "])
      .domain(varNames);


      data.forEach(function (d) {
        var y0 = 0;
        d.mapping = varNames.map(function (name) { 
          return {
            name: name,
            label: d[labelVar],
            y0: y0,
            y1: y0 += +d[name]
          };
        });
        d.total = d.mapping[d.mapping.length - 1].y1;
      });

      x.domain(data.map(function (d) { return d.Date; }));
      y.domain([0, d3.max(data, function (d) { return d.total; })]);

      svg.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

      svg.append("g")
          .attr("class", "y axis")
          .call(yAxis)
        .append("text")
          .attr("transform", "rotate(-90)")
          .attr("y", 6)
          .attr("dy", ".71em")
          .style("text-anchor", "end")
          .text("Goals");

      var selection = svg.selectAll(".series")
          .data(data)
        .enter().append("g")
          .attr("class", "series")
          .attr("transform", function (d) { return "translate(" + x(d.Date) + ",0)"; });

      selection.selectAll("rect")
        .data(function (d) { return d.mapping; })
      .enter().append("rect")
        .attr("width", x.rangeBand())
        .attr("y", function (d) { return y(d.y1); })
        .attr("height", function (d) { return y(d.y0) - y(d.y1); })
        .style("fill", function (d) { return color(d.name); })
        //.style("stroke", "grey")
        .on("mouseover", function (d) { showPopover.call(this, d); })
        .on("mouseout",  function (d) { removePopovers(); })

      var legend = svg.selectAll(".legend")
          .data(varNames)
        .enter().append("g")
          .attr("class", "legend")
          .attr("transform", function (d, i) { return "translate(55," + i * 20 + ")"; });

      legend.append("rect")
          .attr("x", width - 10)
          .attr("width", 10)
          .attr("height", 10)
          .style("fill", color)
          .style("stroke", "grey");

      legend.append("text")
          .attr("x", width - 12)
          .attr("y", 6)
          .attr("dy", ".35em")
          .style("text-anchor", "end")
          .text(function (d) { return dataMaps[d]; });

      function removePopovers () {
        $('.popover').each(function() {
          $(this).remove();
        }); 
      }

      function showPopover (d) {
        $(this).popover({
          title: d.name,
          placement: 'auto top',
          container: 'body',
          trigger: 'manual',
          html : true,
          content: function() { 
            return "Date: " + d.label + 
                   "<br/>"+dataMaps[d.name]+": " + d3.format(",")(d.value ? d.value: d.y1 - d.y0); }
        });
        $(this).popover('show')
      }
    });
    }
      
    </script>
  
  
<script type="text/javascript">
	//Check whether jump to serlet
	var jump = '<%=request.getParameter("jump")%>';
	var color='<%=request.getParameter("color")%>';
	var homevalue;
    var awayvalue;
    var homewin;
    var awaywin;
     homevalue = $("#hs option:selected").text();
     awayvalue = $("#as option:selected").text();
     homewin = document.getElementById("homewinrate").innerText;
     awaywin = document.getElementById("awaywinrate").innerText;
	if(jump =='yes'){
		  $("#pk").fadeIn("slow");
	}
	if(color=='yes'){
		if (homewin>awaywin){
            document.getElementById("homewinrate").style="color: #009513;";
            document.getElementById("awaywinrate").style="color: #950500";
        }
        else if(homewin == awaywin){
            document.getElementById("homewinrate").style="color: #252525;";
            document.getElementById("awaywinrate").style="color: #252525;";
        }
        else{
            document.getElementById("homewinrate").style="color: #950500;";
            document.getElementById("awaywinrate").style="color: #009513";
        }
	}
    //action of away button
    $(document) .ready(function(){
        $("#at").click(function(){
            var awayvalue;
            awayvalue = $("#as option:selected").text();
            if (awayvalue != "--") {
            	
                $("#awaydetail").fadeIn("slow");
                document.getElementById("awaypic").src = "assets/images/club%20Images/" + awayvalue + ".png";
                document.getElementById("awayname").innerHTML = awayvalue;
            }
            else{
                document.getElementById("awaydetail").style = "margin-top: 20px;display: none;clear:both;";
            }
        });
//      action of home button
        $("#ht").click(function(){
            var homevalue;

            homevalue = $("#hs option:selected").text();

            if (homevalue != "--") {
                $("#homedetail").fadeIn("slow");
                document.getElementById("homepic").src = "assets/images/club%20Images/" + homevalue + ".png";
                document.getElementById("homename").innerHTML = homevalue;
            }
            else{
                document.getElementById("homedetail").style = "margin-top: 20px;display: none;clear:both;";
            }

        });
//      action of pk botton
        $("#btlink").click(function(){

            var homevalue;
            var awayvalue;
            var homewin;
            var awaywin;
            homevalue = $("#hs option:selected").text();
            awayvalue = $("#as option:selected").text();
            homewin = document.getElementById("homewinrate").innerText;
            awaywin = document.getElementById("awaywinrate").innerText;

            if (homevalue != "--" && awayvalue != "--" && homevalue != awayvalue) {
            	 teamPKForm.action="ForecastServlet";
           	  	 teamPKForm.submit();
                $("#pk").Slidedown("fast");
                document.getElementById("btlink").href = "#pk";
            }
            if (homevalue == awayvalue && (homevalue != "--" || awayvalue != "--")) {
                alert("Please choose different teams!");
                document.getElementById("btlink").href = "#menu-0";
            }
            if (homevalue == "--" || awayvalue == "--") {
                alert("Please choose both the home team and the away team!");
                document.getElementById("btlink").href = "#menu-0";
            }

						
        });


    });

</script>





  <!--<script type="text/javascript">-->
      <!--//action of PK button-->
      <!--function pkfunction() {-->
          <!--var homevalue;-->
          <!--var awayvalue;-->
          <!--var homewin;-->
          <!--var awaywin;-->
          <!-- -->
          <!--homevalue = $("#hs option:selected").text();-->
          <!--awayvalue = $("#as option:selected").text();-->
          <!--if (homevalue != "&#45;&#45;" && awayvalue != "&#45;&#45;" && homevalue != awayvalue) {-->
              <!--$("#pk").fadeIn("fast");-->
              <!--document.getElementById("btlink").href = "#pk";-->
          <!--}-->
          <!--if (homevalue == awayvalue && (homevalue != "&#45;&#45;" || awayvalue != "&#45;&#45;")) {-->
              <!--alert("Please choose different teams!");-->
              <!--document.getElementById("btlink").href = "#menu-0";-->
          <!--}-->
          <!--if (homevalue == "&#45;&#45;" || awayvalue == "&#45;&#45;") {-->
              <!--alert("Please choose both the home team and the away team!");-->
              <!--document.getElementById("btlink").href = "#menu-0";-->
          <!--}-->

          <!-- -->
          <!--homewin = document.getElementById("homewinrate").innerText;-->
          <!--alert(homewin);-->
      <!--}-->

      <!--//action of selecting team-->
      <!--function cfunction() {-->
          <!--var homevalue;-->
          <!--var awayvalue;-->
          <!--homevalue = $("#hs option:selected").text();-->
          <!--awayvalue = $("#as option:selected").text();-->

          <!--if (homevalue != "&#45;&#45;") {-->
              <!--$("#homedetail").fadeIn("slow");-->
              <!--document.getElementById("homepic").src = "assets/images/club%20Images/" + homevalue + ".png";-->
              <!--document.getElementById("homename").innerHTML = homevalue;-->
          <!--}-->
          <!--else{-->
              <!--document.getElementById("homedetail").style = "margin-top: 20px;display: none;clear:both;";-->
          <!--}-->

          <!--if (awayvalue != "&#45;&#45;") {-->
              <!--$("#awaydetail").fadeIn("slow");-->
              <!--document.getElementById("awaypic").src = "assets/images/club%20Images/" + awayvalue + ".png";-->
              <!--document.getElementById("awayname").innerHTML = awayvalue;-->
          <!--}-->
      <!--}-->

      <!--function rate(){-->

      <!--}-->


  <!--</script>-->
  
</body>
</html>