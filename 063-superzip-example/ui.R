###bus code
library(shinydashboard)
library(leaflet)
#
# Choices for drop-downs
site_type <- c(
		"Impaired" = "impaired",
		"Unimpaired" = "unimpaired",
		"All Sites" = "full"
)

vars <- c(
		"Magnitude" = "avg",
		"Duration" = "centile",
		"Inter-Annual Frequency" = "college",
		"Intra-Annual Frequency" = "income",
		"Timing" = "adultpop"
)

header <- dashboardHeader(titleWidth=150,
		title = "Menu"#,
#		tags$li(class = "dropdown",
#				tags$p(div("Availability of High-magnitude Streamflow for Groundwater Banking", 
#				style="text-align:center;white-space: normal; word-wrap: break-word;"))
#		)
)

sidebar <- dashboardSidebar(width=150,
			sidebarMenu(
					menuItem("Interactive Map", tabName="interactivemap", icon=icon("globe")),
					menuItem("Data Explorer", tabName = "dataexplorer", icon=icon("info-circle"))
				)
			)
bodies <- dashboardBody( 
				tags$script(HTML('
										$(document).ready(function() {
										$("header").find("nav").append(\'<div class="myClass"> Availability of High-magnitude Streamflow for Groundwater Banking </div>\');
										})
										')),
		tabItems(
			tabItem(tabName="interactivemap",
#					fluidRow(column(width=12,
#							infoBox(div("Availability of high-magnitude streamflow for groundwater banking in the Central Valley, CA",
#											style = "white-space: normal; word-wrap: break-word"), 
#									value = NULL,
#									subtitle="Interactive Map",
#									icon = shiny::icon("globe"), color = "aqua", width = NULL,
#									href = NULL, fill = FALSE) 
#							)),
#					
					fluidRow(
							column(width=6,
									box(width=NULL, height=NULL,
									tags$head(
# Include our custom CSS
											includeCSS("styles.css"),
											includeScript("gomap.js")
									),
									tags$style(type = "text/css", "#map {height: calc(100vh - 100px) !important;}"),
									
									leafletOutput("map")
									
							)
					),
					column(width=3,
							box(width=NULL,
								selectInput("sites", "Sites Included", site_type),
								selectInput("metric", "Metric", vars)
						)
						)
			)
				),
			tabItem(tabName= "dataexplorer",
#					fluidRow(column(width=12,
#									infoBox(div("Availability of high-magnitude streamflow for groundwater banking in the Central Valley, CA",
#													style = "white-space: normal; word-wrap: break-word"), 
#											value = NULL,
#											subtitle="Data Explorer",
#											icon = shiny::icon("info-circle"), color = "aqua", width = NULL,
#											href = NULL, fill = FALSE) 
#							)),
					fluidRow(
							column(3,
									selectInput("states", "States", c("All sites"="", structure(state.abb, names=state.name), "Washington, DC"="DC"), multiple=TRUE)
							),
							column(3,
									conditionalPanel("input.states",
											selectInput("cities", "Cities", c("All cities"=""), multiple=TRUE)
									)
							),
							column(3,
									conditionalPanel("input.states",
											selectInput("zipcodes", "Zipcodes", c("All zipcodes"=""), multiple=TRUE)
									)
							)
					),
					fluidRow(
							column(1,
									numericInput("minScore", "Min score", min=0, max=100, value=0)
							),
							column(1,
									numericInput("maxScore", "Max score", min=0, max=100, value=100)
							)
					),
					hr(),
					DT::dataTableOutput("ziptable")
			)
		)

)

dashboardPage(
		title="Flow Availability",
		header=header,
		sidebar=sidebar,
		body=bodies,
		skin="black"
)


