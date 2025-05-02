library(shiny)

# Create an app that greets the user by name. You don’t know all the functions you
# need to do this yet, so I’ve included some lines of code below. Think about 
# which lines you’ll use and then copy and paste them into the right place in a 
# Shiny app.

ui <- fluidPage(
  # numericInput("age", "How old are you?", value = NA),
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session){
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
}

shinyApp(ui, server)