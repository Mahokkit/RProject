# Lesson 3
library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel(strong("censusVis")),
  sidebarPanel(
    helpText("Create demographic 
             maps with information from the 2010 US Census."),
    
    selectInput("select", 
                h3(strong("Choose a variable to display")),
                choices = list(
                  "Percent White" = 1,
                  "Percent Black" = 2,
                  "Percent Hispanic" = 3,
                  "Percent Asian" = 4),
                selected = 1
                ),
    sliderInput("num",
                h3(strong("Range of Interest")),
                min = 0, max = 100, value = 50)
    )

)


# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)