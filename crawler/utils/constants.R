# CONSTANTS 

.CAMARA = "camara"
.SENADO = "senado"

.PACK <- "Package"
.LIST_OF_PACKAGES <- c("RCurl", "dplyr", "lubridate", "magrittr", "stats", 
                      "stringr", "tibble", "tidyr", "utils", "devtools", "optparse")

.RCONGRESSO_URL <- "andresmrm/rcongresso"
.LEGGO_URL <- "analytics-ufcg/agora-digital"

.README_MESSAGE <- "Read the README file"
.HELP_MESSAGE <- "Use --help for more information\n"
.INPUT_FILEPATH <- "./data/proposicoes.csv"
.OUTPUT_FILEPATH <- "./data/versoes.csv"
.HELP_INPUT_ARG <- paste0("Caminho para o arquivo csv contendo os dados das proposições [default=", .INPUT_FILEPATH, "]")
.HELP_OUTPUT_ARG <- paste0("Caminho para o arquivo csv de saída [default=", .OUTPUT_FILEPATH, "]")