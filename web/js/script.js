google.charts.load('current', {packages: ['corechart', 'bar']});

//on resize
$(window).resize(function(){
	  	drawMaterial();
	  	drawChartRedWhite();
	  	drawMaterialCountry();
	});


google.charts.setOnLoadCallback(drawMaterial);
function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['Wines', "Wines per month"],
        ['January', 500],
        ['February', 817],
        ['March', 1792],
        ['April', 2695],
        ['May', 2099],
        ['June', 1526]
      ]);

      var materialOptions = {
        chart: {
          title: 'Wine tokenized per month'
        },
        hAxis: {
          title: 'Wines',
          minValue: 0,
        },
        vAxis: {
          title: 'Month'
        },
        bars: 'horizontal'
      };
      var materialChart = new google.charts.Bar(document.getElementById('chart_month'));
      materialChart.draw(data, materialOptions);
    }

google.charts.setOnLoadCallback(drawChartRedWhite);
      function drawChartRedWhite() {
        var data = google.visualization.arrayToDataTable([
          ['Type', 'Red/White'],
          ['White',     3],
          ['Red',      7]
        ]);

        var options = {
          title: 'Percentages of red and White wine',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('redwhitechart'));
        chart.draw(data, options);
      }

google.charts.setOnLoadCallback(drawMaterialCountry);
function drawMaterialCountry() {
      var data = google.visualization.arrayToDataTable([
        ['Wines', "Wines per country"],
        ['France', 3479],
        ['Italy', 2354],
        ['Spain', 1792],
        ['United States', 695],
        ['Argentina', 299],
      ]);

      var materialOptions = {
        chart: {
          title: 'Wine tokenized per month'
        },
        hAxis: {
          title: 'Wines',
          minValue: 0,
        },
        vAxis: {
          title: 'Country'
        },
        bars: 'horizontal'
      };
      var materialChart = new google.charts.Bar(document.getElementById('chart_country'));
      materialChart.draw(data, materialOptions);
    }