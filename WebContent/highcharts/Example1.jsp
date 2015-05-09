<!DOCTYPE HTML>
<html>
	<head><%String contextPath=request.getContextPath();%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

   <script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.2.min.js"></script>
        <script src="<%=contextPath%>/js/highcharts/highcharts.js"></script>
<script src="<%=contextPath%>/js/highcharts/exporting.js"></script>

		<script type="text/javascript">
$(function () {
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
    
        var chart;
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container2',
                type: 'spline',
                marginRight: 10,
                events: {
                    load: function() {
    
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setInterval(function() {
                            var x = (new Date()).getTime(), // current time
                                y = Math.random();
                            series.addPoint([x, y], true, true);
                        }, 1000);
                    }
                }
            },
            title: {
                text: '仪表4'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Value'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'Random data',
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data;
                })()
            }]
        });
    });
    
});
		</script>
	</head>
	<body>

<div id="container2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
<input type="button" value="关闭" id="close" />
	</body>
</html>
