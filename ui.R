library(shiny)

shinyUI(fluidPage(
        titlePanel("Linear Regression for USA data (data:state.x77)"),
        sidebarLayout(
                sidebarPanel(
                        h3("Choose x (predictors) and y (outcome)"),
                        selectInput("select_x", label=h5("Select x"),
                                    choices=list("Population",
                                                 "Income",
                                                 "Illiteracy",
                                                 "Life Exp.",
                                                 "Murder",
                                                 "HS Grad.",
                                                 "Frost",
                                                 "Area"),
                                    selected="Income"),
                        selectInput("select_y", label=h5("Select y"),
                                    choices=list("Population",
                                                 "Income",
                                                 "Illiteracy",
                                                 "Life Exp.",
                                                 "Murder",
                                                 "HS Grad.",
                                                 "Frost",
                                                 "Area"),
                                    selected="Illiteracy"),
                        h3("Linear model"),
                        h5("Slope"),
                        textOutput("SlopOut"),
                        h5("Intercept"),
                        textOutput("IntOut"),
                        
                        br(),
                        checkboxInput("checkbox", label="Show equation of linear regression", value=FALSE),
                        
        
                        
                        br(),br(),
                        h5("Click link below to see documentataion for state.x77 dataset"),
                        a("state.x77", target="_blank", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html"),
                        br(), br(),
                        h5("For a presentation pitch click link below"),
                        a("Presentation_RPubs", href="http://rpubs.com/ooctig/247153")
                
                ),
                mainPanel(
                        plotOutput("plot1", width = "100%", brush=brushOpts(id="brush1"),
                                   dblclick = "plot1_dblclick")
                        )
        )
        
        
))


## https://dieleitter.shinyapps.io/usa_data/