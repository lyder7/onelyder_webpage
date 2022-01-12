library(tidyxl)
library(openxlsx)
library(purrr)
library(dplyr)





list_data <- list(mtcars,
                  cars,
                  Seatbelts,
                  UKDriverDeaths)

list_data <- map(sheet_names, list)

list.files(".", pattern = ".xlsx")





list_sheets <- paste0("sheet_", seq(1, length(list_data)))

my_excel_workbook <- createWorkbook()


list_sheets %>% 
  walk(~addWorksheet(my_excel_workbook, sheetName = .))


## Hva er forskjellen mellom walk og map


# walk gjør noe utenfor sitt scope --> ikke noe objekt. Eller vil vise noe. 


png("programmer.png")
dev.off()
addWorksheet(my_excel_workbook, "sheet_5")
insertImage(my_excel_workbook,
            sheet = "sheet_5",
            file = "programmer.png")


walk2(.x = list_sheets,
      .y = list_data,
      ~writeData(my_excel_workbook,
                sheet = .x,
                x = .y ))

saveWorkbook(my_excel_workbook,
             "demo_workbook.xlsx",
             overwrite = TRUE)
















