install.packages("readxl")
library(readxl)
library(graphics)
library(stringr)
dados <- read_excel("dados/umses_alunos_2018.xlsx")

#Trata os dados, transformando números em strings (1 = "Indefinido", 
#2 = "Masculino", etc).
i<- 1
for (opcao in dados$genero) {
  if (opcao == 1) {
    dados$genero<- replace(dados$genero, i, "Indefinido")
  }
  else if (opcao == 2){
    dados$genero<- replace(dados$genero, i, "Masculino")
  }
  else {
    dados$genero<- replace(dados$genero, i, "Feminino")
  }
  i<-i+1
}
dados$genero

pie(table(dados$genero), col = rainbow(2))

#grafico da faixa etaria
#pegando dados
dados <- read_excel("dados/umses_alunos_2018.xlsx") 
dados2 <- read_excel("dados/dicionario_de_dados.xlsx")
dados2$X__4[5]
dados <- as.data.frame(dados) #deixando como data frame
#dados
dados2
dado<- table(dados$idade)
dado

png(filename="gráficos/faixa_etaria_pie.png", width = 800, height = 600, pointsize = 20)

par(bg = "light blue") #cor do fundo azul claro
nomes <- c("16 e 20","21 e 25","26 e 30")
barplot(dado,names.arg = nomes,ylim=c(0,40),xlab = "Idade",ylab = "Frequência",col = rainbow(3),main = "Faixa etária dos questionados")
dev.off()

#fazendo grafico principais motivos
dados <- read_excel("dados/umses_alunos_2018.xlsx")
dados <- as.data.frame(dados)

d<- c(sum(dados$contato),sum(dados$atualizado),sum(dados$preencher),sum(dados$encontrar),sum(dados$compopiniao),sum(dados$compfoto),sum(dados$amigosja),sum(dados$profnetwork),sum(dados$novaamizade),sum(dados$compdetalhe))
d
names(d) <- c("Contato","Atualizar","Tempo livre","Conteudo","Opiniões","Fotos ou vídeos","Amigos","Networking","Pessoas","Assuntos")
png(filename="gráficos/Seção3_barplot.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))
barplot(d,col=rainbow(11),las=2,ylim = c(0,60),main="Principais motivos de uso")
dev.off()
