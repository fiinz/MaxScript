function lamina cx cy raio n_dentes espessura cor1 cor2 =
(
 --ZONA DE TRABALHO
 
 passo=360.0/(n_dentes*2)
raio2=raio*0.75

figura=splineshape()
addnewspline figura 
figura.wirecolor=cor1

for ang=0.0 to 360.0-passo by (passo*2) do 

(
ax=raio2*cos(ang)
ay=raio2*sin(ang)
dx=raio*cos(ang)
dy=raio*sin(ang)

fx=raio*cos(ang+passo)
fy=raio*sin(ang+passo)
ex=raio2*cos(ang+passo)
ey=raio2*sin(ang+passo)

addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [fx,fy,0]
addknot figura 1 #corner #line [ex,ey,0]


)
close figura 1

addmodifier figura (extrude amount:espessura)
updateshape figura
convertToMesh figura  
 max modify mode
 select figura
 subObjectLevel=1 
 for v=1 to (n_dentes*4) do
 (
 if (mod v 4) == 2 then
 (
	 meshop.moveVert figura (v) [0,0,-espessura]
	 meshop.moveVert figura (1+v+(n_dentes*4)) [0,0,espessura]
 )
 
 if ((mod v 4) == 2) or ((mod v 4) == 3) then(
  meshop.setVertColor figura 0 (v) (cor2)
  meshop.setVertColor figura 0 (v+(n_dentes*4)) (cor2)
 )
else(
   meshop.setVertColor figura 0 (v) (cor1)
  meshop.setVertColor figura 0 (v+(n_dentes*4)) (cor1)
)
 



 )
 meshop.setMapSupport figura 0 true
 figura.pos=[cx,cy,0]
 update figura
 max create mode
)

-- Lâmina
-- (c) Jose' F. Martins 
-- 2005


i=3
backgroundColor=white

max select all
max delete $

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor1 = blue
  cor2 =white
  lamina (x*250.0) (-y*250.0) 100.0 i 25.0 cor1 cor2
  i+=1
 )
 
max quick render

