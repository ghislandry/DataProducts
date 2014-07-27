library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Give MyApp a try!
        "),
        
        sidebarPanel( # min height 20 inch max 87 inch 
                numericInput('fHeight', 'Enter you father\'s height in inch' , 
                             20, min = 20, max = 87, step = 1),
                numericInput('mHeight', 'Enter you mother\'s height in inch' , 
                             20, min = 20, max = 87, step = 1),
                checkboxGroupInput("predictor", "Predictors", 
                                   c("Mother" = "Mother", "Father" = "Father")),
                
                radioButtons("gender", "Gender", c("Male", "Female"), selected = NULL),
                
                actionButton("submit", "Submit"),
                
                h4("Instructions:"),
                h5("To predict your hieght, you must provide 
                   the height (in inch) of at least one of your parent
                   according to the predictor you want to use. 
                   You might also want to use the heights of your two parents
                   in which case you need to select all the predictors."),
                h5("Once all the parameters are selected, use the submit button 
                   to submit your query. Parameters you have selected will be 
                   displayed to you along with your predicted height.")
                
                
        ),
        
        mainPanel(
                h3("MyApp tells you your height from what you entered!"),
                h4("Father's height"),
                verbatimTextOutput("oid1"), ## father's height
                h4("Mother's height"),
                verbatimTextOutput("oid2"), ## mother's height
                h4("The predictor(s) you selected"),
                verbatimTextOutput("oid3"),
                h4("Your gender"),
                verbatimTextOutput("oid4"),
                h4("Here is our Guess"),
                verbatimTextOutput("prediction"),
                
                h3("
                   
                   
                   ")
                
                
                
        )
)
)