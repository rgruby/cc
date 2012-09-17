//= require d3
alert "d3_test.js.coffee"
x = $("#viz").length
if x > 0
    alert "viz length: " + x
sampleSVG = d3.select("#viz")
    .append("svg")
    .attr("width", 400)
    .attr("height", 75)
    
sampleSVG.selectAll("circle")
    .data([100, 140, 180])
    .enter().append("circle")
    .style("stroke", "gray")
    .style("fill", "white")
    .attr("r", 10)
    .attr("cx", (d) -> d)
    .attr("cy", 20)