xinstall.packages("readxl")
library(readxl)
library(graphics)
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

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

##grafico genero

genero <- table(dados$genero)
genero
v <- round(genero/sum(genero)*100)
png(filename="gráficos/genero.png", width = 800, height = 600, pointsize = 20)

gen <- barplot(v,col = rainbow(2),ylim=c(0,70),xlab = "Gênero",
               ylab = "Porcentagem de pessoas",main = "Gênero dos questionados")

text(gen, v+4,paste(v,"%",sep="")) #add o numero em cima
dev.off()
#grafico da faixa etaria
#pegando dados
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx") 
dados2 <- read_excel("dados/dicionario_de_dados.xlsx")
dados2$X__4[5]
dados <- as.data.frame(dados) #deixando como data frame
#dados
dados2
dado<- table(dados$idade)
dado

png(filename="gráficos/faixa_etaria.png", width = 800, height = 600, pointsize = 20)

nomes <- c("16 e 20 anos","21 e 25 anos","26 e 30 anos")
novodado <- round(dado/sum(dado)*100)
novodado
grafico <- barplot(novodado,names.arg = nomes,ylim=c(0,60),xlab = "Idade",
                   ylab = "Porcentagem dos questionados",col = rainbow(3),main = "Faixa etária dos questionados")
text(grafico, novodado+4,paste(novodado,"%",sep="")) #add o numero em cima

dev.off()

#fazendo grafico principais motivos
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
dados <- as.data.frame(dados)

d<- c(sum(dados$contato),sum(dados$atualizado),sum(dados$preencher),sum(dados$encontrar),sum(dados$compopiniao),sum(dados$compfoto),sum(dados$amigosja),sum(dados$profnetwork),sum(dados$novaamizade),sum(dados$compdetalhe))
d
names(d) <- c("Contato","Atualizar","Tempo livre","Conteúdo","Opiniões","Fotos ou vídeos","Amigos","Networking","Pessoas","Assuntos")
png(filename="gráficos/Seção3_barplot.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))
grafico <- barplot(d,col=rainbow(11),las=2,
                   ylim = c(0,70),main="Principais motivos de uso",
                   ylab = "Quantidade de questionados")
text(grafico,d+6,paste(d,"",sep=""))

dev.off()


#fazendo grafico 4 - uso academico
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
dados
dados$usoacademico
d <- as.data.frame(dados)
dado <- d$usoacademico  
dado <- factor(d$usoacademico)
dado2 <- table(dado)
names(dado2) <- c("Não","Sim","Com restrições","Não sei")
png(filename="gráficos/Seção4_uso_academico.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))
dado2
dado2 <- round(dado2/sum(dado2)*100)
teste  <- barplot(dado2,cex.names=1.0,col=rainbow(11),
                  ylab="Quantidade",ylim = c(0,80),
                  main="Mídia social pode ser usada pelos professores?")
text(teste, dado2+6,paste(dado2,"%",sep="")) #add o numero em cima
dev.off()
#fazendo grafico 4 - profchegal
dado <- d$profchegaal
dado2 <- table(dado)
dado2
names(dado2) <- c("Não","Sim","Não sei")
png(filename="gráficos/Seção4_prof_chegal.png", width = 800, height = 600, pointsize = 20)
dado2
par(mar = c(7,4,4,4))
dado2 <- round(dado2/sum(dado2)*100)


grafico <- barplot(dado2,cex.names = 1.5, col=rainbow(7),
                   las=2,ylab="Porcentagem dos questionados",
                   ylim=c(0,50),main="Melhor forma dos professores se aproximarem?")
text(grafico,dado2+5,paste(dado2,"%",sep=""))
dev.off()

#fazendo grafico 4 - mlehorresul
dado <- d$melhoraresul
dado2 <- table(dado)
names(dado2) <- c("Não","Sim","Não sei")
png(filename="gráficos/Seção4_melhorresul.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))
dado2 <- round(dado2/sum(dado2)*100)

grafico <- barplot(dado2,cex.names = 1.5, col=heat.colors(3),
                   las=2,ylab="Quantidade",
                   ylim=c(0,70),main="Melhores resultados com a integração das redes socias")
text(grafico,dado2+5,paste(dado2,"%",sep=""))

dev.off()

tudo <- d
names(tudo)
tudo.tab <- table(tudo$genero,tudo$bulling)
tudo.tab
row.names(tudo.tab) <- c("Masculino","Feminino")
colnames(tudo.tab) <- c("Não","Sim")
## tentando juntar colunas 
d
tudo <- d
names(tudo)
table(tudo$trabalha,tudo$tempogasto)
tudo.tabela <- table(tudo$trabalha,tudo$tempogasto)
rownames(tudo.tabela) <- c("Desempregado","Jornada parcial","Jornada integral","Estagiário","Bolsista Capes")
colnames(tudo.tabela) <- c("5~10m","10~30m","30~1h","1~2h","2~3h","3~4h","mais de 5 h")
png(filename="gráficos/tempo gasto x situação trabalhista.png", width = 800, height = 600, pointsize = 20)

par(mar=c(3, 4, 5, 5) + 0.1)
barplot(cex.name=0.8,tudo.tabela,col=rainbow(7),ylab = "Quantidade",
        ylim = c(0,20),main = "Tempo gasto em redes socias por dia")

legend(7,23, legend=rownames(tudo.tabela),lwd=10,
       title="Situação trabalhista",
       col=rainbow(7), lty=1:2, cex=0.8,xpd = TRUE)
##falta colocar png
dev.off()

tudo <- d
tudo.teste <- table(tudo$melhoraresul,tudo$distracao)
rownames(tudo.teste) <- c("Não","Sim","Não sei")
colnames(tudo.teste) <- c("Não distrai","Distrai")

x <- c(tudo.teste[2,1],tudo.teste[2,2])

s <- round(x/sum(x)*100) #deixando em %

grap <- barplot(cex.name=0.8,s,col=rainbow(7),ylab = "pessoas que acreditam no melhor resultado",
                ylim = c(0,100),main = "Distração em sala de aula")

legend(2.2,120, legend=c("Não distrai","Distrai"),lwd=10,
       title="Distração",
       col=rainbow(7), lty=1:2, cex=0.8,xpd = TRUE)
text(grap,s+5,paste(s,"%",sep="")) #dado2+3 é o lugar que fica o "n"

##grafico melhor forma de aproximar com prejudica interação
aa <- table(tudo$prejintera,tudo$profchegaal)

rownames(aa) <- c("Não Prejudica","prejudica")
colnames(aa)<- c("Afasta","Aproxima","Não sei")

barplot(aa,col = rainbow(2),
        main="Interpolação de dados:\nAproxima X Prejudica a interação\nEntre os professores e alunos")
legend("topright", legend=rownames(aa),lwd=10,col = rainbow(2)
       , lty=1:2, cex=0.8,xpd = TRUE)

#grafico de quem acha que aproxima com prejudica/n prejudica interação
b<- c(aa[1,2],aa[2,2])
b <- round(b/sum(b)*100)
names(b) <- c("Não prejudica","Prejudica")

aproxima <- barplot(b, ylim = c(0,100),col=rainbow(2),main="Opinião das pessoas que apoiam ")
text(aproxima,b+5,paste(b,"%",sep=""))
legend("topright", legend=c("Não prejudica","Prejudica"),lwd=10,col = rainbow(2)
       , lty=1:2, cex=0.8,xpd = TRUE)