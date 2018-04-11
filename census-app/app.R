# Lesson 5
library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")
# Define UI ----
ui <- fluidPage( title = "2010 US Census Visualization",
  titlePanel("2010 US Census Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("select", 
                  h3(strong("Choose a population to display")),
                  choices = list(
                    "Percent White",
                    "Percent Black",
                    "Percent Hispanic",
                    "Percent Asian"),
                  selected = "Percent White"
      ),
      sliderInput("num",
                  h3(strong("Range of Interest")),
                  min = 0, max = 100, value = c(0, 50)),
      plotOutput("map")
      ),
    
    mainPanel(
      p("Shiny is an R package that makes it",em("incredibly easy ")," to build interactive web applications straight from R"),
      p("It is an interactive approach to tell your data story, and allow end users to interact with your data and analysis."),
      
      h2("Features"),
      p("- Combines the computational power of R"),
      p("- Built in Responsive Design try it on your mobile device or tablet!"),
      p("- Host your Shiny app on the web by using your own servers or RStudio's hosting service like this", 
        strong("one")," with ShinyApps.io"),
      p("- Shiny applications are automatically 'live' in the same way that ", 
        strong("spreadsheets"),
        " are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.  Try it out!"),
      img(src = "rstudio.png", height = 80, width = 250, align = "center"),
      br(),
      "Shiny is a product of ",span("RStudio",style = "color:blue"),
      p("To learn more visit the ",
        a("Shiny homepage.", 
          href = "http://shiny.rstudio.com"))
      )
  )
  )

# Define server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$select,
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$select,
                   "Percent White" = "darkgreen",
                   "Percent Black" = "black",
                   "Percent Hispanic" = "red",
                   "Percent Asian" = "brown")
    
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