function el_diablo cx cy cz raio n_pontas cor =
(
 
passo=(180.0)/(n_pontas*4.0)
raio2=raio*0.5
figura=splineshape()
addnewspline figura 

for ang=0.0 to 180.0-passo*2.0 by (passo*2.0) do (

figura.wirecolor=cor

ax=raio*sin(ang)
ay=raio*cos(ang)

dx=raio2*sin(ang+passo)
dy=raio2*cos(ang+passo)

ex=raio*sin(ang+passo*2)
ey=raio*cos(ang+passo*2)

addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [ex,ey,0]



)
close figura 1

addmodifier figura (lathe seg:50)
figura.pos=[cx,cy,0]
updateshape figura 
 
 
)

-- El Diablo
-- (c) Jose' F. Martins 
-- 2005

backgroundColor=white

max select all
max delete $

for x=0 to 3 do
(
 cor = (color (random 0 255) (random 0 255) (random 0 255))
 el_diablo (x*300.0) 0.0 0.0 100.0 (x+1) cor
)

max quick render
