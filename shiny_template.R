library(shiny)

# Define UI ----
ui <- fluidPage(
  
)

# Define server logic ----
server <- function(input, output) {
  output$scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")
}

# Run the app ----
shinyApp(ui = ui, server = server)