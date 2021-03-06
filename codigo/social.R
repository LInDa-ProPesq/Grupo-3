library(readxl)

df <- read_xlsx("dados/umses_graduacao_2018_vtidy.xlsx", sheet="dados")

redes = c(sum(df$facebook), sum(df$twitter), sum(df$whatsapp), sum(df$linkedin), sum(df$youtube), sum(df$instagram), sum(df$snapchat), sum(df$tumblr), sum(df$pinterest))
redes
lbls <- c("Facebook", "Twitter", "Whatsapp", "LinkedIn", "Youtube", "Instagram", "Snapchat", "Tumblr", "Pinterest")

png(filename = "gráficos/Secao2_barplot.png", width =x 800, height = 600, pointsize = 20)
par(mar=c(6,4,6,4))
grafico = barplot(redes, col = rainbow(9), 
                  main = "Uso das Redes Sociais", 
                  las = 2, 
                  names.arg = lbls,
                  cex.names = 0.8,
                  ylim = c(0,75),
                  ylab="Quantidade dos questionados")
text(grafico,redes+8,paste(redes,"",sep=""))


dev.off()
