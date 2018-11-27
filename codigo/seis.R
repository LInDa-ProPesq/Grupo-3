#instala o package se necessário
if (!require(readxl)) install.packages('readxl')
library(readxl)

#joga a planilha em "dados"
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx", sheet="dados")

#Inicia a geração da imagem
png(filename="gráficos/Secao6_barplot.png", width = 800, height = 600, pointsize = 20)

#Inicia o armazenamento dos dados que serão utilizados (da seção 6)
a<-table(dados$grandeuso)

#Dá nome aos parâmetro de entrada (1 = Excelente, ..., 5 = Muito ruim)
names(a)<-c("Excelente", "Bom", "Indiferente", "Ruim", "Muito ruim")

#Apensiona à tabela "a" as outras linhas da seção 6
a<-rbind(a, c(sum(dados$evioinfo==1), sum(dados$evioinfo==2), sum(dados$evioinfo==3),
           sum(dados$evioinfo==4), sum(dados$evioinfo==5)))
a<-rbind(a, c(sum(dados$facegrupo==1), sum(dados$facegrupo==2), sum(dados$facegrupo==3),
              sum(dados$facegrupo==4), sum(dados$facegrupo==5)))
a<-rbind(a, c(sum(dados$trocainfo==1), sum(dados$trocainfo==2), sum(dados$trocainfo==3),
              sum(dados$trocainfo==4), sum(dados$trocainfo==5)))
a<-rbind(a, c(sum(dados$compinfopal==1), sum(dados$compinfopal==2), sum(dados$compinfopal==3),
              sum(dados$compinfopal==4), sum(dados$compinfopal==5)))
a<-rbind(a, c(sum(dados$quadrovirtual==1), sum(dados$quadrovirtual==2), sum(dados$quadrovirtual==3),
              sum(dados$quadrovirtual==4), sum(dados$quadrovirtual==5)))

#muda o nome das linhas para corresponder às perguntas da tabela
rownames(a)<-c("Uso crecente \npara promocao", "Envio de \ninformacoes \npara os pais",
               "Uso de \ngrupos do \nFacebook", "Troca de \ninformacoes", "Compartilhamento \nde informacoes", "Quadro virtual")

#transpõe a tabela
a<-t(a)

par(mar = c(5.1,4.1,4.1,6))
barplot(a, main = "Avaliacao dos recursos ",
        col = rainbow(5), las = 1, ylab = "Quantidade",
        cex.names = 0.55)

legend(7.5, 50, xpd = TRUE, legend = rownames(a), lwd = 10, col = rainbow(5),
       cex = 0.7)
#encerra o salvamento da imagem
dev.off()

