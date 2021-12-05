library(shiny)
library(tidyverse)

# Define UI for application that draws a scatter plot of price vs diamonds variables
ui <- fluidPage(
  
  # Application title
  titlePanel("Diamonds Data"),
  
  # Sidebar with variables options and discription
  sidebarLayout(
    sidebarPanel(
      helpText(),
      selectInput("variable", "Variable:",
                  choices=c("Carat" = "carat",
                            "Table" = "table",
                            "Depth" = "depth",
                            "X" = "x",
                            "Y" = "y",
                            "Z" = "z")),
      hr(),
      helpText("the relation of price with the other diamonds variables")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOtput("caption")),
      plotOutput("diamondsPlot")
    )
  )
)

# Define server logic required to draw the diamonds data
server <- function(input, output, session) {
  formulaText <- reactive({
    paste("price vs", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$diamondsPlot <- renderPlot({
   
    if (input$variable == "carat") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = carat, y = price), color = "tomato1")
    }
    if (input$variable == "depth") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = depth, y = price), color = "tomato1")
    }
    if (input$variable == "table") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = table, y = price), color = "tomato1")
    }
    if (input$variable == "x") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = x, y = price), color = "tomato1")
    }
    if (input$variable == "y") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = y, y = price), color = "tomato1")
    }
    if (input$variable == "z") {
      p <- ggplot() +
        geom_point(data = diamonds, aes(x = z, y = price), color = "tomato1")
    }
    p
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
