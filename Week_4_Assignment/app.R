#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(leaflet)

# Define UI for application that generates random landmarks in a given location
ui <- fluidPage(
    headerPanel("Create Random Landmarks"),
    
    headerPanel(" "),# Add vertical space between two lines
    
    sidebarPanel(h3("Enter Latitude and Longitude values"),
                 h4("Latitude values can be between -90.0000 and 90.0000"),
                 numericInput("lat", "Latitude", value = 40.7128, min = -90.0000, max = 90.0000 ),
                 
                 headerPanel(" "),# Add vertical space between two lines
                 
                 h4("Longitude values can be between -180.0000 and 180.0000"),
                 numericInput("lon", "Longitude", value = -74.0060, min = -180.0000, max = 180.0000 ),
                 
                 headerPanel(" "),# Add vertical space between two lines
                 h3("Provide a range to plot the map"),
                 sliderInput("rnge", "Range", value = 0.05, min = 0.00, max = 1.00),
                 
                 headerPanel(" "),# Add vertical space between two lines
                 h3("Give the number of landmarks you want to insert"),
                 h4("The number can be between 100 and 1500"),
                 numericInput("no_of_points", "Number of Landmarks", value = 500, min = 100, max = 1500),
                 actionButton("submit", "Generate Map"),
                 width = 3),
    
    mainPanel(leafletOutput("map"))
)

# Define server logic required to generate the map
server <- function(input, output, session) {
    
    
    df <- eventReactive(input$submit, { data.frame(lat = runif(input$no_of_points,
                                 min = input$lat - input$rnge,
                                 max = input$lat + input$rnge),
                     lng = runif(input$no_of_points,
                                 min = input$lon - input$rnge,
                                 max = input$lon + input$rnge))
    })
    
    
    output$map <- renderLeaflet(leaflet(data = df()) %>%
                                    addTiles() %>%
                                    addMarkers(clusterOptions = markerClusterOptions()))
   
}

# Run the application 
shinyApp(ui = ui, server = server)
