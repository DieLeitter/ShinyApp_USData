USA Data, Shiny app
========================================================
author: MS
date: February 4, 2017
autosize: true
transition: rotate
transition-speed: fast

About
========================================================

This is a Pitch Presentation for a USA Data Shiny app. It is a Coursera project for a course Developing Data Products (9<sup>th</sup> course of Data Science Specialization) .

The Shiny app is avaliable at: <https://dieleitter.shinyapps.io/usa_data/>

The code for the ui. R and server.R is avaliable at Github: <https://github.com/DieLeitter/ShinyApp_USData> 


Introduction
========================================================
* Wondering if there is correlation between income and education?  
* Do states of USA with high education level have lower murder rate?
* Does the average of frost days correlate with population? 
* Does the life expextancy collerate with illiteracy?

<br>
<br>

<span style="font-weight:bold; font-size: 34pt;">You can stop wonering and get some numbers</span>




USA Data Shiny App
========================================================

<small> This shiny app generates scatter plots between two chosen variables and fit a linear regression. 
The varaibles are selected from `state.x77` dataset (more info about data set here <https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html>). One can choose between 8 features: 
Population, Income, Illiteracy, Life Exp., Murder, HS Grad, Frost, and Area.</small>

To get started:
* Select desired x and y from the input boxes. 
* Brush the plot to select points for which you would like to fit regression line. The regression line will be added as a blue line in the plot. Note: at least two points need to be selected to fit a regression line.
* Zoom in can be done by double clicking on previously selected (brushed) area.




Scatter plot example
========================================================


<img src="index-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

<br>
Caution:
<span style="font-weight:bold; color:red;">Correlation is not causation</span>


