
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Titanic Survivor Prediction"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("cl", "Class:",
                   c("First" = "1st",
                     "Second" = "2nd",
                     "Third" = "3rd",
                     "Crew" = "Crew"),
                   "2nd"),
      radioButtons("sex", "Sex:",
                   c("Female" = "Female", "Male" = "Male"),
                   "Male"),
      radioButtons("age", "Age:",
                   c("Child" = "Child",
                     "Adult" = "Adult"),
                   "Adult"),
      
      submitButton('Submit')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      p('Make your selection to predict whether would survive on the Titanic.'),
      h4('Would survive?'),
      verbatimTextOutput("result")
    )
  )
))
