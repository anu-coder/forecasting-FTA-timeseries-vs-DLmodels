
# Core Tidyverse
library(tidyverse)
library(magrittr)
library(forcats)

# Time Series
library(tidyquant)
library(tibbletime)

# Visualization
library(cowplot)
library(ggspectra)


# convert a time series into a tibbletime object
L_FTA <- tourism %>%
  tk_tbl() %>%
  mutate(index = as_date(index)) %>%
  as_tbl_time(index = index)

L_FTA


# plotting the main graph in two grids
# p1 for the first graph

p1 <- L_FTA %>%
  ggplot(aes(index, value)) +
  geom_line(color = "black", size = 0.65, alpha = 0.5, ) +
  stat_peaks(colour = palette_light()[[1]]) +
  stat_valleys(colour = palette_light()[[3]]) +
  theme_tq() +
  labs(
    title = "Entire dataset from 1988 to 2019", x = "Years", y = "No. of Foreign Tourist Arrived"
  )

#p2 for the second graph

# note: 1. ggdraw() and plotgrid() from cowplot
# note: 2. stat_peaks() from ggpmisc

p2 <- L_FTA %>%
  filter_time("2010" ~ "end") %>%
  ggplot(aes(index, value)) +
  geom_line(color = palette_light()[[2]], alpha = 0.5) + 
  stat_peaks(colour = "blue") +
  stat_valleys(colour = palette_light()[[1]]) +
  geom_smooth(method = "loess", color = "firebrick",span = 0.2, se = FALSE) +
  labs(
    title = "FTA 2010 to 2019 (Zoomed In: showing seasonal peaks)", x= "Years", y = "No. of Foreign tourist arrived",
    caption = "Ministry of Tourism , @CEIC"
  )

p_title <- ggdraw() + 
  draw_label("Foreign Tourist Arrival: India", size = 18, fontface = "bold", colour = palette_light()[[1]])

plot_grid(p_title, p1, p2, ncol = 1, rel_heights = c(0.1, 1, 1))



# visualization for the 6 and 24 months prediction. 

months_6=readxl::read_xlsx("month_6.xlsx")
head(months_6)
months_12 <- readxl::read_xlsx("month_24.xlsx")
months_12


p1 <- ggplot(data= months_12, aes(x= time)) +
  geom_line(aes(y = FTA, color = palette_light()[[1]]), linetype = "twodash") +
  geom_line(aes(y = MLP, color = palette_light()[[2]])) + 
  geom_line(aes(y = LSTM, color = palette_light()[[3]])) +
  geom_line(aes(y = `AR(10)`, color = palette_light()[[4]]))+
  theme_tq()+ 
  scale_color_discrete(name = "Predictions: ", labels = c("LSTM", "Original", "AR(10)", "MLP")) +
  labs(
    title = "24 months prediction (01/2018-12/2019)", x = "Years", y = "Tourists Arrived", size = 12
  )

  
p2 <- ggplot(data= months_6, aes(x= time)) +
  geom_line(aes(y = FTA, color = palette_light()[[1]]), linetype = "twodash") +
  geom_line(aes(y = MLP, color = palette_light()[[2]])) + 
  geom_line(aes(y = LSTM, color = palette_light()[[3]])) +
  geom_line(aes(y = `AR(10)`, color = palette_light()[[4]]))+
  theme_tq()+
  scale_color_discrete(name = "Prediction: ", labels = c("LSTM", "Original", "AR(10)", "MLP")) +
  labs(
    title = "6 months prediction (07/2019-12/2019)", x = "Years", y = "Tourists Arrived"
  )

p_title <- ggdraw() + 
  draw_label("Foreign Tourist Arrival: India", size = 18, fontface = "bold", colour = palette_light()[[1]])

plot_grid(p_title, p1, p2, ncol = 1, rel_heights = c(0.1, 1, 1))


