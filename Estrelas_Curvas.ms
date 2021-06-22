
max select all
max delete

function estrela_curva cx cy raio n_pontas espessura cor =
(
--Zona de Trabalho

passo=360.0/(n_pontas*2.0)
raio2=raio*0.5
figura=splineshape()
addnewspline figura 

for ang=0 to 359.0 by passo*2 do 
(

figura.wirecolor=cor

	ax=cx+raio*cos(ang)
	ay=cy+raio*sin(ang)
	
	dx=cx+raio2*cos(ang+passo)
	dy=cy+raio2*sin(ang+passo)
	
	addknot figura 1 #smooth #curve  [ax,ay,0]
	addknot figura 1 #smooth #curve [dx,dy,0]
)

close figura 1
addmodifier figura (extrude amount:espessura)
updateshape figura


)

-- As Estrelas Curvas
-- (c) Jose' F. Martins 
-- 2004


i=3
backgroundColor=white

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor = (color (random 0 255) (random 0 255) (random 0 255))
  estrela_curva (x*210.0) (-y*210.0) 100.0 i 25.0 cor
  i+=1
 )
 
max quick render
