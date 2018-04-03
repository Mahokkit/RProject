# Lesson 5
library(shiny)

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
    
    mainPanel(
      textOutput("selected_select"),
      textOutput("min_max")
    )
  )
  )


# Define server logic ----
server <- function(input, output) {
  output$selected_select <- renderText({
    paste("You have selected ", input$select)
  })
  output$min_max <- renderText({
    paste("You have choosen a range from ", input$num[1], " to ", input$num[2])
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)