<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["calendar"]});
      google.charts.setOnLoadCallback(drawChart);

   function drawChart() {
       var dataTable = new google.visualization.DataTable();
       dataTable.addColumn({ type: 'date', id: 'Date' });
       dataTable.addColumn({ type: 'number', id: 'Won/Loss' });
       dataTable.addRows([
          [ new Date(2023, 3, 13), 1],
          [ new Date(2023, 3, 14), 1 ],
          [ new Date(2023, 3, 15), 4],
          [ new Date(2023, 3, 16), 5],
          [ new Date(2023, 3, 17), 10 ],
        ]);

       var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));

       var options = {	
         calendar: { cellSize: 38 }
       };

       chart.draw(dataTable, options);
   }
    </script>
</head>
<body>
	 <div id="calendar_basic" style="width: 1965px; height:495px;"></div>
</body>
</html>