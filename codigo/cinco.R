#instala o package se necessário
if (!require(readxl)) install.packages('readxl')
library(readxl)

dados <- read_excel("dados/umses_alunos_2018.xlsx", sheet="dados")

dificuldades <- c(sum(dados$distracao), sum(dados$usoindev), sum(dados$prejintera), sum(dados$bulling), sum(dados$continadeq), 1)
rotulos <- c("Distracao", "Uso indevido", "Prejuizo da interacao", "Cyberbullying", "Conteudo inadequado", "Outros")
png(filename="gráficos/Secao5_barplot.png", width = 800, height = 600, pointsize = 20)
par(mar = c(9,4,4,2))
barplot(dificuldades, col = rainbow(6),
        main = "Dificuldades de uso",
        horiz = F, las = 2,  names.arg = rotulos, cex.names = 0.8, ylim = c(0,60))
dev.off()
help(par)

