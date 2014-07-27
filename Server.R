library(shiny)

require(UsingR)
data(galton)
 
fit <- lm(child ~ parent, data = galton)

guessHeight <- function(fHeight, mHeight, predictor, gender){ # prediction function
        
        if(is.null(predictor)){
                
                return (0)
        }
        else{
                var <- rapply(strsplit(predictor, " "), function(x){x})
                
                if("Mother" %in% var & "Father" %in% var){
                        g <- rapply(strsplit(gender, " "), function(x){x})
                        if("Female" %in% g){
                               ((fHeight + mHeight)/2) - 2.5
                        }
                        else{
                               ((fHeight + mHeight)/2) + 2.5
                        }
                }
                else{
                        if(!("Mother" %in% var)){
                               as.numeric(predict(fit, data.frame("parent" = c(fHeight))))
                                #23.9415 + 0.6463*fHeight
                               
                        }
                        else{
                                as.numeric(predict(fit, data.frame("parent" = c(mHeight))))
                                #23.9415 + 0.6463*mHeight
                                
                        }
                }
        }

}

shinyServer(
        
        
        function(input, output){
                
                observe({
                        if (input$submit == 0)
                                return()
                        isolate({
                                output$oid1 <- renderPrint({input$fHeight})
                                output$oid2 <- renderPrint({input$mHeight})
                                output$oid3 <- renderPrint({input$predictor})
                                                                
                                output$prediction <- renderPrint(guessHeight({input$fHeight}, 
                                                                             {input$mHeight}, 
                                                                             {input$predictor},
                                                                             {input$gender}))
                                output$oid4 <- renderPrint({input$gender})
                                
                                
                        })
                })
                               
        }
        
        
        )