################################################################################################################
########################################## DISTRIBUIÇÕES DE PROBABILIDADE ########################################
################################################################################################################

# Marcelle Martins Vargas
# Outubro/2020

################################################################################################################

# EDITÁVEIS:

# mudar caminho para onde estiver a pasta com os scripts do R 

dir <- setwd("C:/Users/Marcelle/Desktop/")

#----------------------------------------------------------------------------------------------------

library("lmom")
library("goftest")

dados_chuva <- read.table("dados_chuva.txt")
dados_chuva <- as.numeric(unlist(dados_chuva))

MML         <-samlmu(x=dados_chuva,nmom=4)

# Generalized Extreme-Value (GEV)
GEV_parametros <- pelgev(MML)
GEV_AD         <- ad.test(x=dados_chuva, null="cdfgev", GEV_parametros)

# Gumbel (Extreme-Value Type I) 
Gumbel_parametros <- pelgum(MML)
Gumbel_AD         <- ad.test(x=dados_chuva, null="cdfgum", Gumbel_parametros)

# nível de significância do teste de Anderson-Darling (5%)
AD_alpha <- 0.05

View(GEV_parametros)
View(GEV_AD)
View(Gumbel_parametros)
View(Gumbel_AD)


