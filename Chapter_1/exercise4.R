library(shiny)

ui <- fluidPage(
  sliderInput("x", "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", "and y is", min = 1, max = 50, value = 5),
  "then, (x * y) is", textOutput("product"),
  "and, (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y) + 10 is", textOutput("product_plus10")
)

server <- function(input, output, session) {
  calcProduct <- reactive({
    product <- input$x * input$y
  })
  
  output$product <- renderText({ 
    calcProduct()
  })
  output$product_plus5 <- renderText({ 
    calcProduct() + 5
  })
  output$product_plus10 <- renderText({ 
    calcProduct() + 10
  })
}

shinyApp(ui, server)