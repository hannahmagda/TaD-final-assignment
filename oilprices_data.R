##Code to plot the oil prices of the data provided by opec on https://www.opec.org/opec_web/en/data_graphs/40.htm


#load necessary librabries
library(xml2)
library(ggplot2)


# Parse the XML data
oil_price_xml <- read_xml("basketDayArchives.xml")


# Define the namespace
ns <- xml_ns(oil_price_xml)

basket_lists <- xml_find_all(doc, ".//*[local-name()='BasketList']", ns)
data <- xml_attr(basket_lists, "data")
val <- xml_attr(basket_lists, "val")
oil_prices_df <- data.frame(date = data, value = as.numeric(val))

oil_prices_df$date <- as.Date(oil_prices_df$date)
oil_prices_df$year <- format(oil_prices_df$date, "%Y")


ggplot(oil_prices_df, aes(x = date, y = value)) +
  geom_line() +
  labs(title = "Oil Prices Over Time",
       x = "Year",
       y = "Price ($)") +
  theme_minimal()


