library(readxl)

df <- read_xlsx("dados/umses_alunos_2018.xlsx", sheet="dados")

redes = c(sum(df$facebook), sum(df$twitter), sum(df$whatsapp), sum(df$linkedin), sum(df$youtube), sum(df$instagram), sum(df$snapchat), sum(df$tumblr), sum(df$pinterest))

lbls <- c("Facebook", "Twitter", "Whatsapp", "LinkedIn", "Youtube", "Instagram", "Snapchat", "Tumblr", "Pinterest")

png(filename = "gráficos/Secao2_barplot.png", width = 800, height = 600, pointsize = 20)

grafico = barplot(redes, col = rainbow(9), 
                  main = "Uso das Redes Sociais", 
                  las = 2, 
                  names.arg = lbls,
                  cex.names = 0.8,
                  ylim = c(0,70))

dev.off()
