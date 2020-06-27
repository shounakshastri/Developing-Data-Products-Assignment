# Developing-Data-Products-Assignment
This repository contains the files needed to create a basic shiny app.
A detailed explanation about how the app works is provided below

**The code for the app can be found in the `Week_4_Assignment` folder**

This repo also contains the files for the presentation

## Details of the app

The app takes 4 inputs 
1. The Latitude
2. The Longitude
3. The range
4. The number of random landmarks the user wishes to insert on the map

Once these values are provided, the user should click the `Generate Map` button to see the output

### Server side details
The map is generated using the leaflet package.

The latitude and longitude serve as the centre of the map.

The range is used to decide the boundry in which the markers for the landmarks would be placed.
The boundary is calculated as:

*maxLatitude = input$lat + range*

*minLatitude = input$lat - range*

Same for the longitude

The markers are placed between these values and the user can play with the map using all the functionalities of the leaflet package.
