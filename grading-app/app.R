library(shiny)
library(tidyverse)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("How well am I doing in PH142?"),
  
  fluidRow(
    hr(),
    column(12,
           HTML("<b>Homework </b><br/> Enter a % grade for each assignment (example: enter 71 if you got 71%). 
                Guess grades for assignment not yet completed or leave blank. <b>Your lowest two will be automatically dropped.</b> <br><br>")),
    column(2, 
           numericInput("hw01", "HW 01", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw02", "HW 02", value = NA, min = 0, max = 100)),
    column(2, 
           numericInput("hw03", "HW 03", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw04", "HW 04", value = NA, min = 0, max = 100)),
    column(2, 
           numericInput("hw05", "HW 05", value = NA, min = 0, max = 100))),
  fluidRow(
    column(2,
           numericInput("hw06", "HW 06", value = NA, min = 0, max = 100)),
    column(2, 
           numericInput("hw07", "HW 07", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw08", "HW 08", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw09", "HW 09", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw10", "HW 10", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("hw11", "HW 11", value = NA, min = 0, max = 100))
  ),
  fluidRow(column(4,
                  div(textOutput("hw_avg"), style = "color: red;"))),
  hr(),
  fluidRow(
    column(12,
           HTML("<b>Lab </b><br/> Select 'Completed' or 'Not Completed' for each lab. Guess completion for upcoming labs or leave blank. <br/><br/>")),
    column(2, 
           radioButtons("lab01", "Lab 01", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab02", "Lab 02", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2, 
           radioButtons("lab03", "Lab 03", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab04", "Lab 04", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2, 
           radioButtons("lab05", "Lab 05", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown"))),
  fluidRow(
    column(2,
           radioButtons("lab06", "Lab 06", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2, 
           radioButtons("lab07", "Lab 07", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab08", "Lab 08", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab09", "Lab 09", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab10", "Lab 10", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown")),
    column(2,
           radioButtons("lab11", "Lab 11", choices = c("Completed", "Not Completed", "Unknown"), selected = "Unknown"))),
  fluidRow(
    column(4,
           div(textOutput("lab_avg"), style = "color: red;"))),
  hr(),
  fluidRow(
    column(12,
           HTML("<b>Quizzes </b><br/> Enter a % grade for each quiz. <b>The lowest two will be automatically dropped.</b><br><br>")),
    column(2, 
           numericInput("q1", "Q1", value = NA, min = 0, max = 100, step = 1)),
    column(2,
           numericInput("q2", "Q2", value = NA, min = 0, max = 100, step = 1)),
    column(2, 
           numericInput("q3", "Q3", value = NA, min = 0, max = 100, step = 1)),
    column(2,
           numericInput("q4", "Q4", value = NA, min = 0, max = 100, step = 1)),
    column(2, 
           numericInput("q5", "Q5", value = NA, min = 0, max = 100, step = 1))),
  fluidRow(
    column(2,
           numericInput("q6", "Q6", value = NA, min = 0, max = 100, step = 1)),
    column(2, 
           numericInput("q7", "Q7", value = NA, min = 0, max = 100, step = 1))),
  fluidRow(
    column(4,
           div(textOutput("quiz_avg"), style = "color: red;"))),
  
  hr(),
  fluidRow(
    column(12,
           HTML("<b>Tests (Midterms 15% each, Final 25%)</b><br/>Enter a % grade for each test. 
                Guess grades for tests not yet completed to see how it will affect your overall grade. <br><br>")),
    column(2,
           numericInput("m1", "Midterm 1", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("m2", "Midterm 2", value = NA, min = 0, max = 100)),
    column(2,
           numericInput("final", "Final Exam", value = NA, min = 0, max = 100))
           ),
  hr(),
  fluidRow(
    column(12,
           HTML("<b>Miscellaneous</b><br/> Enter a % grade for each item. You can miss 5 participations points without penalty of lecture attendance.<br><br>")),
    column(3, 
           numericInput(("lec"), "Lecture participation", value = NA, min = 0, max = 100)),
    column(3, 
           numericInput(("group"), "Data Project", value = NA, min = 0, max = 100)),
    column(3, 
           numericInput(("bonus"), "Extra Credit Assignment", value = NA, min = 0, max = 100))
  ), 
  hr(),
  fluidRow(
    column(12, 
           HTML("<b>Final Grade</b>")),
    column(12,
           div(textOutput("weighted_avg"), style = "color: red;")),
    column(12,
           div(textOutput("letter_grade"), style = "color: red;")),
    column(12, 
           HTML("<br><br><br><br><br><br>"))
  ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  avg_drop_x_lowest <- function(values, x=0) {
    if (length(values) - sum(is.na(values)) <= x) {
      return(100)
    } else if (x == 0) {
      return(round(sum(values, na.rm = T) / (sum(!is.na(values)) - x), 2))
    } else {
      return(round((sum(values, na.rm = T) - sum(sort(values)[1:x])) / (sum(!is.na(values)) - x), 2))
    }
  }
  
  ##### HOMEWORK
  output$hw_avg <- renderText({ 
    hw_grades <- c(input$hw01, input$hw02, input$hw03, input$hw04, input$hw05, 
                   input$hw06, input$hw07, input$hw08, input$hw09, input$hw10, input$hw11)
    hw_avg <- avg_drop_x_lowest(hw_grades, x=2)
    
    paste0("Homework Mean: ", hw_avg, "%")
  })
  
  ##### LAB
  output$lab_avg <- renderText({ 
    lab_grades_raw <- c(input$lab01, input$lab02, input$lab03, input$lab04, input$lab05, 
                        input$lab06, input$lab07, input$lab08, input$lab09, input$lab10, input$lab11)
    lab_grades <- replace(lab_grades_raw, lab_grades_raw == "Completed", 100)
    lab_grades <- replace(lab_grades, lab_grades == "Not Completed", 0)
    lab_grades <- replace(lab_grades, lab_grades == "Unknown", NA)
    lab_avg <- avg_drop_x_lowest(as.numeric(lab_grades), x=0) 
    
    paste0("Lab Mean: ", lab_avg, "%")
  })
  
  ##### QUIZ
  output$quiz_avg <- renderText({ 
    quiz_grades <- c(input$q1, input$q2, input$q3, input$q4, input$q5, 
                     input$q6, input$q7)
    quiz_avg <- avg_drop_x_lowest(quiz_grades, x=2)
    
    paste0("Quiz Mean: ", quiz_avg, "%")
  })
  
  ##### WEIGHTED
  weighted <- reactive({ 
    
    hw_weight <- 0.2
    lec_weight <- 0.05
    lab_weight <- 0.05
    quiz_weight <- 0.05
    
    mt1_weight <- 0.15
    mt2_weight <- 0.15
    final_weight <- 0.25
    
    project_weight <- 0.10
    extra_credit_weight <- 0.02
    
    hw_grades <- c(input$hw01, input$hw02, input$hw03, input$hw04, input$hw05, 
                   input$hw06, input$hw07, input$hw08, input$hw09, input$hw10, input$hw11)
    hw_avg <- avg_drop_x_lowest(hw_grades, x=2)
    
    lab_grades_raw <- c(input$lab01, input$lab02, input$lab03, input$lab04, input$lab05, 
                        input$lab06, input$lab07, input$lab08, input$lab09, input$lab10, input$lab11)
    lab_grades <- (lab_grades_raw == "Completed") * 100
    lab_avg <- avg_drop_x_lowest(lab_grades, x=0) 
    
    quiz_grades <- c(input$q1, input$q2, input$q3, input$q4, input$q5, 
                     input$q6, input$q7)
    quiz_avg <- avg_drop_x_lowest(quiz_grades, x=2)
    
    weight_avg <- (hw_avg * hw_weight) + (input$lec * lec_weight) + (lab_avg * lab_weight) + (quiz_avg * quiz_weight) +
      (input$m1* mt1_weight) + (input$m2 * mt2_weight) + (input$final * final_weight) +
      (input$group * project_weight) + (input$bonus * extra_credit_weight)
    
    return(weight_avg)
  })
  
  output$weighted_avg <- renderText({
    paste0("Final grade: ", round(weighted(), 2), "%")
  })
  
  output$letter_grade <- renderText({
    paste0("Letter grade: ", case_when(weighted() >= 97.5 ~ "A+",
                                       weighted() < 97.5 & weighted() >= 93 ~ "A",
                                       weighted() < 93 & weighted() >= 88 ~ "A-",
                                       weighted() < 88 & weighted() >= 84 ~ "B+",
                                       weighted() < 84 & weighted() >= 80 ~ "B",
                                       weighted() < 80 & weighted() >= 75 ~ "B-",
                                       weighted() < 75 & weighted() >= 70 ~ "C+",
                                       weighted() < 70 & weighted() >= 60 ~ "C- or C",
                                       weighted() < 60  ~ "C- or lower")
    )
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
