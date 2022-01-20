
df_w <- data.frame(d1, 
                   weekd = 1:length(d1))




mnam <- c("mon", "tue", "wed", "thu", "fri")
mnam <- c("mon", "tue", "wed", "thu", "fri", "sat", "sun")

df_w$weekd = mnam


rbind(df_w, mnam)
merge(df_w, mnam)


df <- data.frame(Date = as.Date("2022-01-10") + 0:4, 
                 Logical = c(TRUE, FALSE, TRUE, TRUE, FALSE),
                 Klient = paste("Tema Einendom AS", 0:4), 
                 Accounting = -2:2, 
                 hLink = "https://CRAN.R-project.org/",
                 Percentage = seq(-1, 1, length.out = 5), 
                 TinyNumber = runif(5)/1e+09, 
                 stringsAsFactors = FALSE)

klienter <- as.vector(read.csv("data_raw/klientliste.csv"))

klienter %>% 
  filter(manager == "Name 1") %>% 
  arrange(hours)


felles <- data.frame(
  klienter = klienter, 
  Status = paste("$")
)
