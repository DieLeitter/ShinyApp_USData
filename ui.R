library(shiny)

shinyUI(fluidPage(
        titlePanel("Linear Regression for USA data (data:state.x77)"),
        sidebarLayout(
                sidebarPanel(
                        br(),
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
                        br(),br(),
                        h3("Linear model"),
                        h5("(Brush points to see fitted model)"),
                        h5("Slope"),
                        textOutput("SlopOut"),
                        h5("Intercept"),
                        textOutput("IntOut"),
                        
                        br(),
                        checkboxInput("checkbox", label="Show equation of linear regression", value=FALSE),
                        br()
                ),
                
                mainPanel(
                        tabsetPanel(type="tabs",
                                    tabPanel("Main",
                                             plotOutput("plot1", width = "100%", brush=brushOpts(id="brush1"),
                                                        dblclick = "plot1_dblclick")
                                    ),
                                    tabPanel("About", br(), br(),
                                             h5("This shiny app generates scatter plots between two chosen variables and fit a linear regression. 
                                                The varaibles are selected from `state.x77` dataset. One can choose between 8 features: 
                                                Population, Income, Illiteracy, Life Exp., Murder, HS Grad, Frost, and Area."),
                                             br(), br(),
                                             
                                             h5("Click link below to see documentataion for state.x77 dataset"),
                                             a("state.x77", target="_blank", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html"),
                                             br(), br()
                                    ),
                                    tabPanel("How to start", br(), br(),
                                             tags$ul(
                                                     tags$li("Select desired x and y from the input boxes."), 
                                                     tags$li("Brush the plot to select points for which you would like to fit regression line. The regression line will be added as a blue line in the plot. Note: at least two points need to be selected to fit a regression line."), 
                                                     tags$li("Zoom in can be done by double clicking on previously selected (brushed) area.")
                                             ),
                                             br(),br(),
                                             h5("For a presentation pitch click link below"),
                                             a("Presentation_RPubs", href="http://rpubs.com/ooctig/247740")
                                    )                                    
                        )
                )
        )
))


## https://dieleitter.shinyapps.io/usa_data/