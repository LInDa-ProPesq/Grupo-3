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

png(filename="gráficos/faixa_etaria.png", width = 800, height = 500, pointsize = 16)

par(bg = "light blue") #cor do fundo azul claro
nomes <- c("16 e 20","21 e 25","26 e 30")
barplot(dado,names.arg = nomes,ylim=c(0,40),xlab = "Idade",ylab = "Frequência",col = rainbow(3),main = "Faixa etária dos questionados")
dev.off()


