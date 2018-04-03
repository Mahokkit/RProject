# Lesson 5
library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")
# Define UI ----
ui <- fluidPage(
  titlePanel(strong("censusVis")),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic 
               maps with information from the 2010 US Census."),
      
      selectInput("select", 
                  h3(strong("Choose a variable to display")),
                  choices = list(
                    "Percent White",
                    "Percent Black",
                    "Percent Hispanic",
                    "Percent Asian"),
                  selected = "Percent White"
      ),
      sliderInput("num",
                  h3(strong("Range of Interest")),
                  min = 0, max = 100, value = c(0, 50))
      ),
    
    mainPanel(plotOutput("map"))
  )
  )


# Define server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$select,
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$select,
                   "Percent White" = "darkgreen",
                   "Percent Black" = "black",
                   "Percent Hispanic" = "brown",
                   "Percent Asian" = "darkorange")
    
    legend <- switch(input$select,
                    "Percent White" = "% White",
                    "Percent Black" = "% Black",
                    "Percent Hispanic" = "% Hispanic",
                    "Percent Asian" = "% Asian")
    percent_map(data, color, legend, input$num[1], input$num[2])
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)