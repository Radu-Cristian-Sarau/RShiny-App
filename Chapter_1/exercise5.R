library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
  data <- dataset()
  if (input$dataset == "economics") {
    ggplot(data, aes(x = date)) +
      geom_line(aes(y = unemploy), color = "steelblue") +
      labs(title = "Unemployment Over Time", y = "Unemployed", x = "Date")
  } else if (input$dataset == "faithfuld") {
    ggplot(data, aes(x = eruptions, y = waiting)) +
      geom_tile(aes(fill = density)) +
      labs(title = "Eruption Duration vs Waiting Time")
  } else if (input$dataset == "seals") {
    ggplot(data, aes(x = long)) +
      geom_line(aes(y = delta_long), color = "steelblue") +
      labs(title = "Seal Observation Coordinates", x = "Longitude", y = "Change in Longitude")
  }
})
}

shinyApp(ui, server)

# library(shiny)
# 
# ui <- fluidPage(
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# 
# server <- function(input, output, session) {
#   # Create a reactive expression
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
#   
#   output$summary <- renderPrint({
#     # Use a reactive expression by calling it like a function
#     summary(dataset())
#   })
#   
#   output$table <- renderTable({
#     dataset()
#   })
# }

shinyApp(ui, server)