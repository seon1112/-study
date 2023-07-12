<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['day', 'seon', 'jin','cha'],
    ['1일',  1,3,6],
    ['2',  2,4,9],
    ['3',  1,3,5],
    ['4', 5 ,6,4],
    ['5', 0 ,0,0],
    ['6', 0 ,0,0],
    ['7', 0 ,0,0],
    ['8', 0 ,0,0],
    ['9', 0 ,0,0],
    ['10', 0 ,0,0],
    ['11', 0 ,0,0],
    ['12', 0 ,0,0],
    ['13', 0 ,0,0],
    ['14', 0 ,0,0],
    ['15', 0 ,0,0],
    ['16', 0 ,0,0],
    ['17', 0 ,0,0],
    ['18', 0 ,0,0],
    ['19', 0 ,0,0],
    ['20', 0 ,0,0],
    ['21', 0 ,0,0],
    ['22', 0 ,0,0]
    
  ]);

  var options = {
    curveType: 'function',
    legend: { position: 'bottom' }
  };

  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

  chart.draw(data, options);
}
</script>
</head>
<body>
	 <div id="curve_chart" style="width: 1700px; height: 1200px"></div>
</body>
</html>