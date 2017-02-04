library(shiny)

shinyServer(
        function(input, output){
               
                ranges <- reactiveValues(x = NULL, y = NULL)
                 
                 output$plot1 <- renderPlot({
                         
                         palette(c("black","red", "green3", "blue", "cyan", "magenta", "orange", "gray") )
                         
                         x <- switch(input$select_x,
                                     "Population"=state.x77[,1],
                                     "Income"=    state.x77[,2],
                                     "Illiteracy"=state.x77[,3],
                                     "Life Exp."= state.x77[,4],
                                     "Murder"=    state.x77[,5],
                                     "HS Grad."=  state.x77[,6],
                                     "Frost"=     state.x77[,7],
                                     "Area"=      state.x77[,8])
                         y <- switch(input$select_y,
                                     "Population"=state.x77[,1],
                                     "Income"=    state.x77[,2],
                                     "Illiteracy"=state.x77[,3],
                                     "Life Exp."= state.x77[,4],
                                     "Murder"=    state.x77[,5],
                                     "HS Grad."=  state.x77[,6],
                                     "Frost"=     state.x77[,7],
                                     "Area"=      state.x77[,8])
                         df <- data.frame(cbind(x, y), names=c("x", "y"))
                         
                         
                     
                         
                      
                         
                         
                         model <- reactive({
                                 brushed_data <- brushedPoints(df, input$brush1,  
                                                               xvar="x", yvar="y")
                                 if(nrow(brushed_data) < 2){
                                         return(NULL)
                                 }
                                 lm(y~x, data=brushed_data)
                         })
                         
                         
                
                         

                         
                         plot(df$x, df$y, xlab=input$select_x,
                              ylab=input$select_y, main = "USA Data",
                              cex=1.5, pch=16, bty="n", xlim = ranges$x, ylim=ranges$y)
                         if(!is.null(model())){
                                 abline(model(), col="blue", lwd=2)
                         }
                         
                         
                         output$SlopOut <- renderText({ 
                                 
                                 if(is.null(model())){
                                         "No Model Found"
                                 }else {
                                         model()[[1]][2]
                                 }
                                 
                         })
                         
                         
                         
                         
                         output$IntOut <- renderText({
                                 if(is.null(model())){
                                         "No Model Found"
                                 } else {
                                         model()[[1]][1]
                                 }
                         })
                         
                        
                         
                         
                         if(input$checkbox){
                                 
                                 if(is.null(model())){
                                         mtext <- text(1.5*min(df$x), max(df$y), "No Model Found")  
                                 }else{
                                 lm_equat <- paste("y = ", round(model()[[1]][1],4), "+", round(model()[[1]][2],4), " * x")
                                 mtext <- text(1.5*min(df$x), max(df$y), lm_equat)
                                 }
                         }
                         
                         
                         mtext <- text(df$x,df$y, pos=c(1,2,3,4),offset=0.25, rownames(state.x77), col=1:dim(state.x77)[1])
                         
                            
                        
                   
                         
                         
                                                            
                         
                 }, height = 650, width=1200)
                 
            
                 
                 
                 observeEvent(input$plot1_dblclick, {
                         brush <- input$brush1
                         if (!is.null(brush)) {
                                 ranges$x <- c(brush$xmin, brush$xmax)
                                 ranges$y <- c(brush$ymin, brush$ymax)
                                 
                         } else {
                                 ranges$x <- NULL
                                 ranges$y <- NULL
                         }
                 })
                  
        }
)
                         