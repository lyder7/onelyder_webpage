library(tidyverse)
library(tidyxl)


list_xlsx <- list.files(".", pattern = ".xlsx")


list_xlsx %>% 
  tolower()
xlsx_cells(list_xlsx[3])
# se hvilke former som er i arket
xlsx_cells(list_xlsx[2]) %>%
  filter(!is.na(formula)) %>% 
  head() %>% 
  pull(formula)


# tell hvor mange formuler det i arket
xlsx_cells(list_xlsx[3]) %>%
  filter(!is.na(formula)) %>% 
 nrow()


## Lage en fore-loop for antall formular celler det er hver workbook

results <- rep(0, length(list_xlsx))


for(i in seq_along(list_xlsx)){
  results[i] <- xlsx_cells(list_xlsx[i]) %>%
    filter(!is.na(formula)) %>% 
    nrow()
}

results

# eksmepel 2

results <- cbind(rep(0, length(list_xlsx)), 0)

for(i in seq_along(list_xlsx)){
  results[i, 1] <- list_xlsx[i]
  results[i, 2] <- xlsx_cells(list_xlsx[i]) %>%
    filter(!is.na(formula)) %>% 
    nrow()
}

results

xlsx_sheet_names(list_xlsx[3])
# ekmsepel 3
tidyxl::xlsx_sheet_names()

count_formulas <- function(workbook_name){
  n_formulas <- xlsx_sheet_names(workbook_name) 
    # filter(!is.na(formula)) %>% 
    # nrow()
  
  data.frame("workbook" = workbook_name,
             "n_formulas" = n_formulas)
}




map(seq(1, 10), sqrt)

map(list_xlsx, count_formulas) %>% 
  bind_rows()


a <- map_dfr(list_xlsx, count_formulas) 


