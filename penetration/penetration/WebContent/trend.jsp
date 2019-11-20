<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BarChart Example</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
 <script type="text/javascript" src="includes/js/chartjs/chartjs-plugin-trendline.js"></script>
    <script>
            document.addEventListener("DOMContentLoaded", function(event) {
                // Bar chart
                new Chart(document.getElementById("bar-chart"), {
                            type: 'bar',
                            data: {
                                labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
                                datasets: [
                                    {
                                        label: "Population (millions)",
                                        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                                        data: [2478,5267,734,784,433],
                                        trendlineLinear: {
                                            style: "rgba(255,105,180, .8)",
                                            lineStyle: "dotted",
                                            width: 2
                                        }
                                    },
                                ]
                            },
                                options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: 'Predicted world population (millions) in 2050'
                                }
                            }
                        });
                });
        </script>
</head>
<body>
    <h1>Bar Chart</h1>
    <canvas id="bar-chart" width="800" height="450"></canvas>

    <p>Using example code from <a href="http://tobiasahlin.com/blog/chartjs-charts-to-get-you-started/" target="_blank">tobiasahlin.com.</a></p>
</body>
</html>