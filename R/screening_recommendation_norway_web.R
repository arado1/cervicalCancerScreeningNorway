install.packages("pkgdown")
# Create the pkgdown directory
dir.create("pkgdown")

# Create the _pkgdown.yml file inside the pkgdown directory
file.create("pkgdown/_pkgdown.yml")


# Create the 'pkgdown' directory if it doesn't exist
pkgdown_content <- "
# Package documentation site configuration
template:
  bootstrap: 5
  bootswatch: cerulean

navbar:
  title: 'Cervical Cancer Screening Norway'
  left:
    - text: 'Reference'
      href: reference/index.html
    - text: 'Articles'
      href: articles/index.html

url: 'https://your-github-username.github.io/Cervical-Cancer-Screening-Norway'

reference:
  - title: 'Functions'
    contents:
      - screening_recommendation

articles:
  - title: 'Norwegian Screening Guidelines'
    contents:
      - articles/Norwegian_Screening_Guidelines.html
"
writeLines(pkgdown_content, "pkgdown/_pkgdown.yml")

dir.create("vignettes", showWarnings = FALSE)
vignette_content <- "
---
title: 'Norwegian Screening Guidelines'
output: rmarkdown::html_vignette
vignette: >
  %\\VignetteIndexEntry{Norwegian Screening Guidelines}
  %\\VignetteEngine{knitr::rmarkdown}
  %\\VignetteEncoding{UTF-8}
---

## Cervical Cancer Screening in Norway

This vignette provides details about the screening guidelines in Norway.
"
writeLines(vignette_content, "vignettes/Norwegian_Screening_Guidelines.Rmd")

desc::desc_set("URL", "https://your-github-username.github.io/Cervical-Cancer-Screening-Norway")
desc::desc_set("BugReports", "https://github.com/your-github-username/Cervical-Cancer-Screening-Norway/issues")

dir.create("vignettes", showWarnings = FALSE)
vignette_content <- "
---
title: 'Norwegian Screening Guidelines'
output: rmarkdown::html_vignette
vignette: >
  %\\VignetteIndexEntry{Norwegian Screening Guidelines}
  %\\VignetteEngine{knitr::rmarkdown}
  %\\VignetteEncoding{UTF-8}
---

## Cervical Cancer Screening in Norway

This vignette provides details about the screening guidelines in Norway.
"
writeLines(vignette_content, "vignettes/Norwegian_Screening_Guidelines.Rmd")

# Build vignettes
devtools::build_vignettes()


desc::desc_set("Package", "cervicalCancerScreeningNorway")
file.rename(
  "C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway",
  "C:/Users/Amir Rad/Documents/cervicalCancerScreeningNorway"
)
devtools::install("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")



# Set working directory to your package directory
setwd("C:/Users/Amir Rad/Documents/Cervical Cancer Screening Norway")

# Build the website
pkgdown::build_site()

system("git add docs/")
system('git commit -m "Add website built with pkgdown"')
system("git push origin master")

system("git add .")
system('git commit -m "Add pkgdown site"')
system("git push origin master")

