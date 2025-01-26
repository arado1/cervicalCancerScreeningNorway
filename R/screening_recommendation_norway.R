# Function to check cervical cancer screening recommendations for Norway
screening_recommendation_norway <- function(age, hpv_result, cytology_result, genotype, history) {
  
  # Define the recommendations
  recommendation <- ""
  grade <- ""
  
  # Logic for women younger than 25
  if (age < 25) {
    recommendation <- "No screening recommended"
    grade <- "D"
  }
  
  # Logic for women ages 25 to 33 (Primary HPV test)
  else if (age >= 25 && age <= 33) {
    if (hpv_result == "Negative") {
      recommendation <- "HPV test negative - No screening needed for 5 years"
      grade <- "A"
    } else if (hpv_result == "Positive") {
      if (genotype %in% c("16", "18")) {
        recommendation <- "High-risk HPV detected, refer for colposcopy"
        grade <- "A"
      } else {
        recommendation <- "HPV Positive, continue screening every 3 years with HPV or cytology"
        grade <- "A"
      }
    } else {
      recommendation <- "Abnormal HPV result - Refer for further testing"
      grade <- "A"
    }
  }
  
  # Logic for women ages 34 to 69 (HPV test every 5 years)
  else if (age >= 34 && age <= 69) {
    if (hpv_result == "Negative") {
      recommendation <- "HPV test negative - Screening every 5 years"
      grade <- "A"
    } else if (hpv_result == "Positive") {
      if (genotype %in% c("16", "18")) {
        recommendation <- "High-risk HPV detected, refer for colposcopy"
        grade <- "A"
      } else {
        recommendation <- "HPV Positive, continue screening every 5 years with HPV or co-testing"
        grade <- "A"
      }
    } else {
      recommendation <- "Abnormal HPV result - Refer for further testing"
      grade <- "A"
    }
  }
  
  # Return the recommendation and grade
  return(list(recommendation = recommendation, grade = grade))
}

# Example of using the function for women aged 30
result <- screening_recommendation_norway(age = 30, hpv_result = "Negative", genotype = "None", history = "None")
print(result$recommendation)  # Output: "HPV test negative - Screening every 5 years"
print(result$grade)          # Output: "A"
# Load devtools
install.packages("devtools")
library(devtools)

# Create the new package
create_package("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")

# Create the DESCRIPTION file for the new package (Norwegian package)
description_content_norway <- "
Package: cervicalCancerScreeningNorway
Type: Package
Title: An R package for cervical cancer screening recommendations in Norway
Version: 0.1.0
Author: Amir Rad
Maintainer: Amir Rad <your.email@example.com>
Description: This package provides cervical cancer screening recommendations based on HPV results, following Norwegian guidelines.
License: What license it uses
Encoding: UTF-8
LazyData: true
Depends:
  R (>= 4.0)
"

# Write the DESCRIPTION content
writeLines(description_content_norway, "C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway/DESCRIPTION")

# Create the NAMESPACE file
namespace_content_norway <- "
# NAMESPACE
export(screening_recommendation_norway)
"

# Write the NAMESPACE content
writeLines(namespace_content_norway, "C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway/NAMESPACE")
# Add files to the staging area
system("git add .")

# Commit changes
system('git commit -m "Initial commit for cervical cancer screening recommendations in Norway"')

# Set the remote origin (use your new GitHub repository URL)
system("git remote add origin https://github.com/arado1/cervicalCancerScreeningNorway.git")

# Push your code to GitHub
system("git push -u origin master")

# Set the path to where you want to save your R package
package_path <- "C:/Users/Amir Rad/Documents/cervicalCancerScreeningNorway"

# Create the package folder structure
dir.create(package_path)
dir.create(file.path(package_path, "R"))
dir.create(file.path(package_path, "man"))
# Define the path for the DESCRIPTION file
description_path <- file.path(package_path, "DESCRIPTION")

# Create the content for the DESCRIPTION file
description_content <- "
Package: cervicalCancerScreeningNorway
Type: Package
Title: An R package for cervical cancer screening recommendations in Norway
Version: 0.1.0
Author: Amir Rad
Maintainer: Amir Rad <your.email@example.com>
Description: This package provides cervical cancer screening recommendations for women in Norway, based on updated guidelines for HPV testing.
License: What license it uses
Encoding: UTF-8
LazyData: true
Depends:
  R (>= 4.0)
"

# Write the content to the DESCRIPTION file
writeLines(description_content, description_path)
# Define the function content for cervical cancer screening in Norway
function_content <- "
#' @title Cervical Cancer Screening Recommendation for Norway
#' 
#' @description This function provides the cervical cancer screening recommendation for women in Norway based on age and HPV test results.
#' 
#' @param age Age of the woman.
#' @param hpv_result HPV test result (e.g., 'Positive', 'Negative').
#' @param genotype HPV genotype (e.g., '16', '18', 'Other').
#' 
#' @return A list containing the screening recommendation.
#' 
#' @examples
#' screening_recommendation_norway(age = 30, hpv_result = 'Negative', genotype = 'None')
#' 
#' @export
screening_recommendation_norway <- function(age, hpv_result, genotype) {
  recommendation <- ''
  
  # Logic for women aged 25-33 (primary HPV test)
  if (age >= 25 && age <= 33) {
    if (hpv_result == 'Negative') {
      recommendation <- 'Screening every 5 years with HPV test'
    } else if (hpv_result == 'Positive') {
      if (genotype %in% c('16', '18')) {
        recommendation <- 'HPV Positive (high-risk), refer for colposcopy'
      } else {
        recommendation <- 'HPV Positive, continue screening every 5 years with HPV testing'
      }
    }
  }
  
  # Logic for women aged 34 and older
  if (age >= 34) {
    if (hpv_result == 'Negative') {
      recommendation <- 'Screening every 5 years with HPV test'
    } else if (hpv_result == 'Positive') {
      if (genotype %in% c('16', '18')) {
        recommendation <- 'HPV Positive (high-risk), refer for colposcopy'
      } else {
        recommendation <- 'HPV Positive, continue screening every 5 years with HPV testing'
      }
    }
  }
  
  return(list(recommendation = recommendation))
}
"

# Save the function content in the R folder
writeLines(function_content, file.path(package_path, "R/screening_recommendation_norway.R"))

# Create the R/ folder if it doesn't exist
dir.create("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway/R", showWarnings = FALSE)

# Define the function content for screening recommendations (Norway)
function_content <- "
#' @title Cervical Cancer Screening Recommendation (Norway)
#' 
#' @description This function provides the cervical cancer screening recommendation based on age, HPV test result, and medical history, following Norwegian guidelines.
#' 
#' @param age Age of the woman.
#' @param hpv_result HPV test result (e.g., 'Positive', 'Negative').
#' @param genotype HPV genotype (e.g., '16', '18', 'Other').
#' @param history Medical history (e.g., 'None', 'CIN2', 'CIN3', 'Prior hysterectomy').
#' 
#' @return A list containing the screening recommendation and its grade.
#' 
#' @examples
#' screening_recommendation(age = 28, hpv_result = 'Negative', genotype = 'None', history = 'None')
#' 
#' @export
screening_recommendation <- function(age, hpv_result, genotype, history) {
  recommendation <- ''
  grade <- ''
  
  if (age >= 25 && age <= 33) {
    if (hpv_result == 'Negative') {
      recommendation <- 'HPV testing every 5 years'
      grade <- 'A'
    } else if (hpv_result == 'Positive') {
      if (genotype %in% c('16', '18')) {
        recommendation <- 'High-risk HPV detected, refer for colposcopy'
        grade <- 'A'
      } else {
        recommendation <- 'HPV Positive, continue screening every 5 years with HPV'
        grade <- 'A'
      }
    } else {
      recommendation <- 'Abnormal HPV result - Refer for further testing'
      grade <- 'A'
    }
  }
  
  # Return the recommendation and grade
  return(list(recommendation = recommendation, grade = grade))
}
"

# Save the function in the R/ folder
writeLines(function_content, "C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway/R/screening_recommendation_norway.R")

# Create the 'man/' folder inside the corrected package directory
dir.create("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway/man", showWarnings = FALSE)
setwd("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")
devtools::document("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")
devtools::install("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")
