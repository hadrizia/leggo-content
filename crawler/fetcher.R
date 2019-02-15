#! /usr/bin/Rscript

suppressWarnings(suppressMessages(source(here::here("crawler/utils/constants.R"))))
suppressWarnings(suppressMessages(source(here::here("crawler/process_data.R"))))

#' @title Install and load a list of packages
#' @description Install new packages and load all required libraries
#' @param list_of_packages List of packages
#' @examples
#' install_and_load_packages(c("dplyr", "readr"))
install_and_load_packages <- function(list_of_packages) {
  new_packages <- suppressMessages(suppressWarnings(
    list_of_packages[!(list_of_packages %in% installed.packages()[,.PACK])]))
  
  if(length(new_packages) > 0) {
    suppressMessages(suppressWarnings(install.packages(new_packages)))
  }
  
  suppressWarnings(suppressMessages(lapply(list_of_packages, require)))
  suppressWarnings(suppressMessages(devtools::install_github(.RCONGRESSO_URL, force = TRUE)))
  suppressWarnings(suppressMessages(devtools::install_github(.LEGGO_URL, force = TRUE)))
}

#' @title Get arguments from command line option parsing
#' @description Get arguments from command line option parsing
get_args <- function() {
  args = commandArgs(trailingOnly=TRUE)
  
  message(.README_MESSAGE)
  message(.HELP_MESSAGE)
  
  option_list = list(
    optparse::make_option(c("-i", "--input"), 
                type="character", 
                default=.INPUT_FILEPATH,
                help=.HELP_INPUT_ARG, 
                metavar="character"),
    optparse::make_option(c("-o", "--output"), 
                type="character", 
                default=.OUTPUT_FILEPATH,
                help=.HELP_OUTPUT_ARG, 
                metavar="character")
  );
  
  opt_parser <- optparse::OptionParser(option_list = option_list) 
  opt <- optparse::parse_args(opt_parser)
  return(opt);
}

install_and_load_packages(.LIST_OF_PACKAGES)

args <- get_args()

df <- fetch_data(args$input)

save_data(df, args$output)