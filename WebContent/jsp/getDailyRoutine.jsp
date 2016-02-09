<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

	 var queryObject="";
     var queryObjectLen="";
	$.ajax
	({
		type: "GET",
		url: "../SaveDaily",
		dataType:"json",
		success: function(data)
		{	queryObject = eval('(' + JSON.stringify(data) + ')');
            queryObjectLen = data.Routines.length;			
		},
		error : function(xhr, type) {
            alert('server error occoured')
        }
	});
	google.load("visualization", "1", {packages:["line"]});
    google.setOnLoadCallback(drawChart);
	
    function drawChart() {
    	console.log("Hi"+queryObject);
    	var data = new google.visualization.DataTable();
   		data.addColumn('string', 'Date');
        data.addColumn('number', 'Wakeup');
        data.addColumn('number', 'Breakfast');
        data.addColumn('number', 'Lunch');
        data.addColumn('number', 'Dinner');
        data.addColumn('number', 'Sleep');
        data.addColumn('number', 'Meditation');
        for(var i=0;i<queryObjectLen;i++)
        {
            var date = queryObject.Routines[i].date;
            var wakeup = queryObject.Routines[i].wakeup;
            var breakfast = queryObject.Routines[i].breakfasttime;
            var lunch = queryObject.Routines[i].lunchtime;
            var dinner = queryObject.Routines[i].dinnertime;
            var sleep = queryObject.Routines[i].sleep;
            var meditation = queryObject.Routines[i].meditation;
            data.addRows([
                [date,parseInt(wakeup),parseInt(breakfast),parseInt(lunch),parseInt(dinner),parseInt(sleep),parseInt(meditation)]
            ]);
        }
        var options = {
        };
        var chart = new google.charts.Line(document.getElementById('chart_div'));

        chart.draw(data,options);
    } 
	  

</script>
<body>
<div id="content">
</div>
<h3>Daily Activity Graph</h3>
<div id="chart_div"></div>

</body>
</html>
