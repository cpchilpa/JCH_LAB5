####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Jair Chilpa Hern�ndez (UAEH)

##########################################################################################
# LABORATORIO 4: Visi�n clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -�rbol de expansi�n m�xima- (asegurar una visi�n clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como m�ximo
# Regla 2: Quitar las conexiones con el peso m�s bajo, nos vamos quedar con las del peso m�ximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------


# 1.C�mo crear una Visi�n clara del espacio-producto: �rbol de expansi�n m�xima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

library(EconGeo)
#cargar paquete


file.choose()
# ubicar archivo

M = as.matrix(
  read.csv("C:\\Users\\HP\\Documents\\CIENCIA DE DATOS\\LAB 5 DATOS\\relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

head (M[,1:10])
dim (M)



#Importar matriz "relatednessbinario.csv"



library (igraph)
red_hidalgo1 <- graph.adjacency(M, mode="undirected" ,weighted=TRUE)
plot (red_hidalgo1)
#grafica la matriz de proximidades natural



M <- -M
head (M[,1:6])
#Transforma la matriz en en NEGATIVA y para identificar los m�ximos

red_hidalgo2 <- graph.adjacency(M, mode="undirected" , weighted=TRUE)
MST <- minimum.spanning.tree(red_hidalgo2)
plot (MST, vertex.shape="none", vertex.label.cex=.7)
#grafica la nueva matriz negativa con MST




write.graph(MST,file="redhidalgo2.gml" , format="gml")
#nodos n-1



A <- get.adjacency(MST, sparse = F)
# matriz de proximos adyaentes (nuevo relacionamiento)





#exportar LISTA DE EDGE

write.csv (A, file="AdyacentesCorMST.csv")
#exportar matriz de proximos adyacentes