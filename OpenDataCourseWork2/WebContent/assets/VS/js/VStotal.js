
var pie_totalF= dc.pieChart('#pie_totalF');
var pie_totalH= dc.pieChart('#pie_totalH');
//var statusPie = dc.pieChart('#status_pie');
var row_allteams = dc.rowChart('#allteams');


d3.csv("DATA/footballdata.csv", function(data) {

  var ndx = crossfilter(data);
  var all = ndx.groupAll();

//f
  var odds = ndx.dimension(function(d) {
    return d["FTR"];
  });
  var oddsGroup = odds.group();
  pie_totalF
    /*.width(380)
    .height(380)*/
    .radius(120)
    .dimension(odds)
    .group(oddsGroup)
    .ordinalColors(['#980000  ', '#E0C700 ', '#006600'])
    //.legend(dc.legend())

    .label(function(d) {
      return (d.key);
    });

//h
  var oddsh = ndx.dimension(function(d) {
    return d["HTR"];
  });
  var oddshGroup = oddsh.group();
  pie_totalH
    /*.width(380)
    .height(380)*/
    .radius(120)
    .dimension(oddsh)
    .group(oddshGroup)
    .ordinalColors(['#6baed6', '#31a354 ', '#756bb1 '])
    //.legend(dc.legend())


    .label(function(d) {
      return (d.key);
    });



//表示team的
  var allteams = ndx.dimension(function(d) {
    return d["HomeTeam"];
  });
 var allteamsGroup = allteams.group(); 
  row_allteams
    .width(400)
    .height(750)
    .dimension(allteams)
    .group(allteamsGroup)
    .label(function(d) {
      return d.key;
    })
    .title(function(d) {
      return d.value;
    })
    .elasticX(true)
    .ordering(function(d) {
      return -d.value;
    })
    .xAxis().ticks(6);
 



  //Render the charts! This MUST stay at the end
  dc.renderAll();

});

 function Reset()
                    {
                    window.location.reload();
                    }
