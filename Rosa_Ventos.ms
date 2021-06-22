function rosa_ventos cx cy raio n_pontas espessura cor =
(
--Zona de Trabalho

passo=360.0/(n_pontas*4.0)
raio2=raio*0.5
raio3=raio*0.75
figura=splineshape()
addnewspline figura 

for ang=0.0 to 359.0 by passo*4.0 do (

figura.wirecolor=cor

ax=cx+raio*cos(ang)
ay=cy+raio*sin(ang)

dx=cx+raio2*cos(ang+passo)
dy=cy+raio2*sin(ang+passo)

ex=cx+raio3*cos(ang+passo*2)
ey=cy+raio3*sin(ang+passo*2)

fx=cx+raio2*cos(ang+passo*3)
fy=cy+raio2*sin(ang+passo*3)


addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [ex,ey,0]
addknot figura 1 #corner #line [fx,fy,0]

)
close figura 1
addmodifier figura (extrude amount:espessura)
updateshape figura

)

-- As Rosas dos Ventos
-- (c) Jose' F. Martins 
-- 2004

max select all
max delete

i=3
backgroundColor=white

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor = (color (random 0 255) (random 0 255) (random 0 255))
  rosa_ventos (x*210.0) (-y*210.0) 100.0 i 25.0 cor
  i+=1
 )
 
max quick render
