xinstall.packages("readxl")
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

teste  <- barplot(dado2,cex.names=1.0,col=rainbow(11),
                  las=2,ylab="Quantidade",ylim = c(0,45),
                  main="Mídia social pode ser usada pelos professores?")
text(teste, dado2+4,paste("",dado2,sep="")) #add o numero em cima
dev.off()
#fazendo grafico 4 - profchegal
dado <- d$profchegaal
dado <- factor(dado)
dado2 <- table(dado)
names(dado2) <- c("Não","Sim","Não sei")
png(filename="gráficos/Seção4_prof_chegal.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))

grafico <- barplot(dado2,cex.names = 1.5, col=rainbow(7),
                   las=2,ylab="Quantidade",
                   ylim=c(0,30),main="Melhor forma dos professores se aproximarem?")
text(grafico,dado2+3,paste("",dado2,sep=""))
dev.off()

#fazendo grafico 4 - mlehorresul
dado <- d$melhoraresul
dado <- factor(dado)
dado2 <- table(dado)
names(dado2) <- c("Não","Sim","Não sei")
png(filename="gráficos/Seção4_melhorresul.png", width = 800, height = 600, pointsize = 20)

par(mar = c(7,4,4,4))

grafico <- barplot(dado2,cex.names = 1.5, col=heat.colors(3),
                   las=2,ylab="Quantidade",
                   ylim=c(0,45),main="Melhores resultados com a integração das redes socias")
text(grafico,dado2+3,paste("",dado2,sep="")) #dado2+3 é o lugar que fica o "n"

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

par(mar=c(3, 4, 5, 5) + 0.1)
barplot(cex.name=0.8,tudo.tabela,col=rainbow(7),ylab = "Quantidade",
        ylim = c(0,20),main = "Tempo gasto em redes socias por dia")

legend(7,23, legend=rownames(tudo.tabela),lwd=10,
       title="Situação trabalhista",
       col=rainbow(7), lty=1:2, cex=0.8,xpd = TRUE)
##falta colocar png

d
tudo <- d
names(tudo)
table(tudo$melhoraresul,tudo$distracao)
tudo.teste <- table(tudo$melhoraresul,tudo$distracao)
rownames(tudo.teste) <- c("Não","Sim","Não sei")
tudo.teste
colnames(tudo.teste) <- c("Não distrai","Distrai")

par(mar=c(3, 4, 5, 5) + 0.1)
barplot(cex.name=0.8,tudo.teste,col=rainbow(7),ylab = "Quantidade de pessoas",
        ylim = c(0,60),main = "Distração em sala de aula")

legend(2,80, legend=rownames(tudo.teste),lwd=10,
       title="traz melhores resultados ",
       col=rainbow(7), lty=1:2, cex=0.8,xpd = TRUE)



x <- c(tudo.teste[2,1],tudo.teste[2,2])
x
help(pie)
pie(x,main="Distração em sala de aula",labels = c("Não Distrai","Distrai"),col = rainbow(7))

grap <- barplot(cex.name=0.8,x,col=rainbow(7),ylab = "pessoas que acreditam no melhor resultado",
        ylim = c(0,50),main = "Distração em sala de aula")
s <- round(x/sum(x)*100)
lbls <- c("Não Distrai","Distrai")
lbls <- paste(lbls,s)
lbls <- paste(lbls,"%",sep="")
pie(x,main="Distração em sala de aula",labels = lbls,col = rainbow(7))

legend(2,55, legend=c("Não distrai","Distrai"),lwd=10,
       title="Distração",
       col=rainbow(7), lty=1:2, cex=0.8,xpd = TRUE)
text(grap,x+3,paste("",x,sep="")) #dado2+3 é o lugar que fica o "n"

aa <- table(tudo$prejintera,tudo$profchegaal)
aa
rownames(aa) <- c("Não Prejudica","prejudica")
colnames(aa)<- c("Não","Sim","Não sei")
aa
S##testando matrix
pao <- matrix(ncol=4,byrow=TRUE)
pao
rownames(pao)
colnames(pao)
colnames(pao) <- c("sim","nao","talvez","sei la")
rownames(pao) <- c("face","insta","lul","paozin")
row.names(pao)
pao
pao <- as.table(pao)
pao
pao <- rbind(pao,"aaa")
pao
