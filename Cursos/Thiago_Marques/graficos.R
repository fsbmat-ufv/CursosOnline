#Gráficos Estatísticos no R
install.packages("gridExtra")
library(tidyverse,scales,plotly,gridExtra)
library(plotly)

#1. Base de dados que sera utilizado
#2. Aesthetic - Parte estetica do grafico, eixos, cores, tamanhos...
#3. Geometria que sera utilizada (tipo de grafico)
#4.Escala (formato, unidade de medida)
#5. Rotulos, Titulos, Legendas, etc...

View(iris)
#Grafico de coluna
grafico_coluna=ggplot(iris, aes(x=Sepal.Length,fill=Species))+
  geom_bar(position = "dodge")+
  xlab("Tamanho da Sépala")+
  ylab("Número de plantas (Frequência Simples)")+
  ggtitle("Gráfico de colunas do Tamanho da Sépala")
grafico_coluna
ggplotly(grafico_coluna)

grafico_coluna=ggplot(iris, aes(x=Sepal.Length,fill=Species))+
  geom_bar(position = "dodge")+
  xlab("Tamanho da Sépala")+
  ylab("Número de plantas (Frequência Simples)")+
  ggtitle("Gráfico de colunas do Tamanho da Sépala")
grafico_coluna
ggplotly(grafico_coluna)

#grafico de coluna empilhada

grafico_coluna_empilhada=ggplot(iris, aes(x=Sepal.Length,fill=Species))+
  geom_bar(position = "fill")+
  scale_y_continuous(labels = percent)+
  xlab("Tamanho da Sépala")+
  ylab("Número de plantas em % (Frequência Relativa)")+
  ggtitle("Gráfico de colunas empilhadas do Tamanho da Sépala")
grafico_coluna_empilhada
ggplotly(grafico_coluna_empilhada)

#Grafico de pizza
df_pizza_tab=table(iris$Species)
df_pizza=as.data.frame((df_pizza_tab))
df_pizza


grafico_pizza_interativo=plot_ly(df_pizza,
                                 labels=~Var1,
                                 values=~Freq,
                                 type = 'pie') %>% 
  layout(title="Gráfico de pizza da Frequencia Relativa das Espécies")
grafico_pizza_interativo


#Gráfico Histograma
dados=iris
attach(iris)
grafico_hist=ggplot(dados,aes(x=Sepal.Length))+
  geom_histogram(color="black",fill="lightblue",bins=30)+
  xlab("Tamanho das Sépalas")+
  ylab("Frequência simples")+
  ggtitle("Gráfico Histograma do Tamanho da Sépala das plantas")+
  theme_bw()
grafico_hist
ggplotly(grafico_hist)

#Gráfico Histograma por Espécie
grafico_hist_especie=ggplot(dados,aes(x=Sepal.Length))+
  geom_histogram(color="black",fill="lightblue",bins=30)+
  xlab("Tamanho das Sépalas")+
  ylab("Frequência simples")+
  ggtitle("Gráfico Histograma do Tamanho da Sépala das plantas")+
  facet_grid(~Species)+
  theme_bw()
grafico_hist_especie
ggplotly(grafico_hist_especie)

#Gráfico da densidade por Espécie
grafico_geom_density=ggplot(dados,aes(x=Sepal.Length,fill=Species))+
  geom_density(alpha=0.6)+
  xlab("Tamanho das Sépalas")+
  ylab("densidade")+
  ggtitle("Gráfico da densidade do Tamanho da Sépala das plantas")+
  facet_grid(~Species)
grafico_geom_density
ggplotly(grafico_geom_density)

#Gráfico box-plot
grafico_boxplot=ggplot(dados,aes(x=Sepal.Length, y=Petal.Length,fill=Species))+
  geom_boxplot()+
  xlab("Tamanho das Sépalas")+
  ylab("Tamanho das pétalas")+
  ggtitle("Gráfico de Box-Plot do tamanho da Sépala vs Tamanho das Petalas das Plantas")
grafico_boxplot

#Gráfico de Dispersão - cor espécies
grafico_dispersao_cor=ggplot(dados,aes(x=Sepal.Length,y=Petal.Length,col=Species))+
  geom_point(size=4)+
  xlab("Tamanho das Sépalas")+
  ylab("Tamanho das Pétalas")+
  ggtitle("Gráfico de Dispersão do Tamanho da Sépala vs o tamanho das Pétalas das Plantas")
grafico_dispersao_cor  
ggplotly(grafico_dispersao_cor)

#Grafico de Dispersao - cor espécies
grafico_dispersao_tamanho=ggplot(dados,aes(x=Sepal.Length,y=Petal.Length,col=Species))+
  geom_point(size=Species)+
  xlab("Tamanho das Sépalas")+
  ylab("Tamanho das Pétalas")+
  ggtitle("Gráfico de Dispersão do Tamanho da Sépala vs o tamanho das Pétalas das Plantas")
grafico_dispersao_tamanho
ggplotly(grafico_dispersao_cor)

#Grafico de Dispersao - cor espécies
grafico_dispersao_especie=ggplot(dados,aes(x=Sepal.Length,y=Petal.Length,col=Species))+
  geom_point(size=4)+
  xlab("Tamanho das Sépalas")+
  ylab("Tamanho das Pétalas")+
  ggtitle("Gráfico de Dispersão do Tamanho da Sépala vs o tamanho das Pétalas das Plantas")+
  facet_grid(~Species)
grafico_dispersao_especie
ggplotly(grafico_dispersao_cor)

#Gráfico de linhas
dados2 <- economics
grafico_linhas=ggplot(economics,aes(x=date,y=unemploy))+
  geom_line(col="red")+
  xlab("Ano")+
  ylab("Desemprego (em Milhares)")+
  ggtitle("Desemprego nos Estados Unidos de 1967 a 2015 - Economics")
grafico_linhas
ggplotly(grafico_linhas)

#Agrupando os gráficos
grid.arrange(grafico_coluna_empilhada,
             grafico_coluna,
             grafico_boxplot,
             grafico_dispersao_cor,
             grafico_dispersao_especie,
             grafico_linhas,
             nrow=3,ncol=2)

install.packages("GGally")
library("GGally")
#Todas as variáveis
pm <- ggpairs(iris,aes(color=Species))
ggplotly(pm)

#Só da terceira 