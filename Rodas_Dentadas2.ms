max select all
max delete
function roda_dentada2 cx cy raio n_dentes espessura cor =
(
--Zona de Trabalho
passo=360.0/(n_dentes*2.0)
raio2=raio*0.75
raio3=raio*0.5

figura=splineshape()
addnewspline figura 
addnewspline figura 

for ang=0.0 to 359.0 by (passo*2) do 
(
ax=cx+raio2*cos(ang)
ay=cy+raio2*sin(ang)
dx=cx+raio*cos(ang)
dy=cy+raio*sin(ang)

fx=cx+raio*cos(ang+passo)
fy=cy+raio*sin(ang+passo)
ex=cx+raio2*cos(ang+passo)
ey=cy+raio2*sin(ang+passo)

hx=cx+raio3*cos(ang+passo/2)
hy=cy+raio3*sin(ang+passo/2)


addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [fx,fy,0]
addknot figura 1 #corner #line [ex,ey,0]

addknot figura 2 #corner #line [hx,hy,0]



)
close figura 1
close figura 2

updateshape figura

addmodifier figura (extrude amount:50.0)
figura.wirecolor=cor

)

-- As Rodas Dentadas Part Deux
-- (c) Jose' F. Martins 
-- 2004


i=3
backgroundColor=white

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor = (color (random 0 255) (random 0 255) (random 0 255))
  roda_dentada2 (x*210.0) (-y*210.0) 100.0 i 25.0 cor
  i+=1
 )
 
max quick render
