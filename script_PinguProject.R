####TRABAJO CURSO R, QUARTO Y GITHUB#####

#Luis Carmona Rosado#
#Escuela de doctorado UAH#
#Universidad Alcalá de Henares#
#6-10 de febrero de 2023#

#Para realizar el trabajo vamos a utilizar los datos de Palmerpenguis#
#Instalaremos el paquete "parmerperguis"

install.packages("palmerpenguins")
library(palmerpenguins)

penguins

dt <- data.frame(penguins)

#Cargar paquetes
library(tidyverse)

#Observar datos
view(dt)
str(dt)
head(dt)
class(dt)
glimpse(dt)
summarise(dt)
summary(dt)


#DEscriptivos

table(dt$species)
table(dt$species, dt$sex)


result_lenght <- dt %>% summarise(mean(bill_length_mm, na.rm = T), sd(bill_length_mm, na.rm = T), max(bill_length_mm, na.rm = T), min(bill_length_mm, na.rm = T))
result_lenght

result_lenght_sex <- dt %>% filter(!is.na(sex)) %>%  group_by(sex ) %>%  summarise(mean(bill_length_mm, na.rm = T), sd(bill_length_mm, na.rm = T), max(bill_length_mm, na.rm = T), min(bill_length_mm, na.rm = T))
result_lenght_sex

result_depht <- dt %>% summarise(mean(bill_depth_mm, na.rm = T), sd(bill_depth_mm, na.rm = T), max(bill_depth_mm, na.rm = T), min(bill_depth_mm, na.rm = T))
result_depht

result_depht_sex <- dt %>%  filter(!is.na(sex)) %>%  group_by(sex ) %>% summarise(mean(bill_depth_mm, na.rm = T), sd(bill_depth_mm, na.rm = T), max(bill_depth_mm, na.rm = T), min(bill_depth_mm, na.rm = T))
result_depht_sex

result_flipper <- dt %>% summarise(mean(flipper_length_mm, na.rm = T), sd(flipper_length_mm, na.rm = T), max(flipper_length_mm, na.rm = T), min(flipper_length_mm, na.rm = T))
result_flipper

result_flipper_sex <- dt %>%  filter(!is.na(sex)) %>%  group_by(sex ) %>% summarise(mean(flipper_length_mm, na.rm = T), sd(flipper_length_mm, na.rm = T), max(flipper_length_mm, na.rm = T), min(flipper_length_mm, na.rm = T))

result_flipper_sex


result_bodymass <- dt %>% summarise(mean(body_mass_g, na.rm = T), sd(body_mass_g, na.rm = T), max(body_mass_g, na.rm = T), min(body_mass_g, na.rm = T))
result_bodymass

result_bodymass_sex <- dt %>% filter(!is.na(sex)) %>%  group_by(sex ) %>%  summarise(mean(body_mass_g, na.rm = T), sd(body_mass_g, na.rm = T), max(body_mass_g, na.rm = T), min(body_mass_g, na.rm = T))

result_bodymass_sex

##Grafica


ggplot(data = dt, aes( x = as.character(island), fill = species)) +
  geom_bar() + scale_fill_manual(values =  c("orange", "purple", "blue")) +
  labs(x ="Islands", y = "Number of individuals") +
  theme_classic()

table(dt$island)

#Boxplots

ggplot(data= subset(dt, !is.na(sex))) + geom_boxplot(aes(x =sex, y = body_mass_g)) + facet_wrap(~species) + labs(x ="Sex", y = "Body mass (gr)") + theme_classic()



#Suplemento

ggplot(dt, aes(x= flipper_length_mm, y = body_mass_g))+ geom_jitter() + labs(x ="Longitud aleta", y = "Tamaño pingüino (gr)") + geom_smooth(method =  lm) + theme_classic()
