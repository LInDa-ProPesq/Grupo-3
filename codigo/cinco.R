#instala o package se necessário
if (!require(readxl)) install.packages('readxl')
library(readxl)

#joga a planilha em "dados"
dados <- read_excel("dados/umses_alunos_2018.xlsx", sheet="dados")

#cria o vetor "dificuldades" com a quantidade de pessoas que responderam "sim" a cada uma
#das perguntas da seção 5, na ordem expressa em "rotulos"
dificuldades <- c(sum(dados$distracao), sum(dados$usoindev), sum(dados$prejintera), sum(dados$bulling), sum(dados$continadeq), 1)

rotulos <- c("Distracao", "Uso indevido", "Prejuizo da interacao", "Cyberbullying", "Conteudo inadequado", "Outros")

#Inicia a geração da imagem
png(filename="gráficos/Secao5_barplot.png", width = 800, height = 600, pointsize = 20)

#muda as margens do gráfico para que o texto não seja cortado
par(mar = c(9,4,4,2))

#"las = 2" faz o texto ficar na vertical; "cex.names" diminui o tamanho do texto; "ylim" determina
#o mínimo e máximo do eixo y
barplot(dificuldades, col = rainbow(6),
        main = "Dificuldades de uso",
        horiz = F, las = 2,  names.arg = rotulos, cex.names = 0.8, ylim = c(0,60))

#encerra o salvamento da imagem
dev.off()

