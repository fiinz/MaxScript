

max select all
max delete
function roda_dentada cx cy raio n_dentes espessura cor =
(
passo=360.0/(n_dentes*2)
raio2=raio*0.75

figura=splineshape()
addnewspline figura 
figura.wirecolor=cor

for ang=0.0 to 360.0-passo by (passo*2) do 

(
ax=cx+raio2*cos(ang)
ay=cy+raio2*sin(ang)
dx=cx+raio*cos(ang)
dy=cy+raio*sin(ang)

fx=cx+raio*cos(ang+passo)
fy=cy+raio*sin(ang+passo)
ex=cx+raio2*cos(ang+passo)
ey=cy+raio2*sin(ang+passo)

addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [fx,fy,0]
addknot figura 1 #corner #line [ex,ey,0]


)
close figura 1

addmodifier figura (extrude amount:espessura)
updateshape figura
--Zona de Trabalho
)

-- As Rodas Dentadas
-- (c) Jose' F. Martins 
-- 2004


i=3
backgroundColor=white

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor = (color (random 0 255) (random 0 255) (random 0 255))
  roda_dentada (x*210.0) (-y*210.0) 100.0 i 25.0 cor
  i+=1
 )

max quick render
