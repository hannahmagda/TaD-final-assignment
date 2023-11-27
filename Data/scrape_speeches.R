## Text as data

##webscraping the opec speeches from 2011


#packages
library(rvest)
library(stringr)

#function to get the text from links
extract_text_from_link <- function(url) {
  webpage <- read_html(url)
  parsed_nodes <- html_nodes(webpage, 
                             xpath = '//p')
  speech_text <- html_text(parsed_nodes)
  return(speech_text)
}



#all the URLs from 2011 - I coulnd't spot a pattern so far :(
speech_urls <- c(
  "https://www.opec.org/opec_web/en/press_room/2169.htm",
  "https://www.opec.org/opec_web/en/press_room/2145.htm",
  "https://www.opec.org/opec_web/en/press_room/2038.htm",
  "https://www.opec.org/opec_web/en/press_room/2036.htm",
  "https://www.opec.org/opec_web/en/press_room/1996.htm",
  "https://www.opec.org/opec_web/en/press_room/1995.htm",
  "https://www.opec.org/opec_web/en/press_room/1986.htm"
)

# Apply the function to each URL
all_speech_text <- lapply(speech_urls, extract_text_from_link)

all_speech_text
