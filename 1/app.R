#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
#Hadley_2 has been improved by hadley_1, perhaps by adding more controls, more refined user interface components,
# or more sophisticated responsive features

library(shiny)


ui <- fluidPage(
  verbatimTextOutput("summary_output"),    
  textOutput("text_output"),                
  verbatimTextOutput("t_test_output"),      
  verbatimTextOutput("lm_output"),          
  plotOutput("plot", width = "700px", height = "300px") 
)

#
server <- function(input, output, session) {
  output$summary_output <- renderPrint(summary(mtcars))
  output$text_output <- renderText("Good morning!")
  output$t_test_output <- renderPrint(t.test(1:5, 2:6))
  output$lm_output <- renderPrint(str(lm(mpg ~ wt, data = mtcars)))
  output$plot <- renderPlot(plot(1:5), res = 96, 
                            alt = "Scatterplot of 5 random numbers")
}

# 
shinyApp(ui, server)


