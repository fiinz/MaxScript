function sol cx cy raio n_pontas espessura cor1 cor2 =
(
 raio2 = raio*0.50

 passo=360.0/(n_pontas*2)

 estrela = splineshape()
 
 addnewspline estrela

 for ang=0 to 360-passo*2+.1 by passo*2 do
 (
  ax = cx + raio*cos(ang)
  ay = cy + raio*sin(ang)
  addknot estrela 1 #smooth #curve [ax,ay,0]
  dx = cx + raio2*cos(ang+passo)
  dy = cy + raio2*sin(ang+passo)
  addknot estrela 1 #smooth #curve [dx,dy,0] 
 )

 close estrela 1 
 updateshape estrela
 
 addModifier estrela (extrude amount:espessura)
 estrela.wireColor = cor1
 
 convertToMesh estrela
 max modify mode
 select estrela
 subObjectLevel=1
 v=1
 for n=1 to (n_pontas*14*2) do
 (
  if ((mod v 2)==0) then
  ( 
   meshop.moveVert estrela (v) [0,0,(-espessura*0.2)]
   meshop.setVertColor estrela 0 (v) cor2
  )
  else  meshop.setVertColor estrela 0 (v) cor1 
  v+=1
 )
 meshop.setMapSupport estrela 0 true
 update estrela
 max create mode
)

-- O Sol
-- (c) Jose' F. Martins 
-- 2005


i=9
backgroundColor=black

max select all
max delete $

for y=0 to 1 do
 for x=0 to 4 do
 (
  cor1 = yellow
  cor2 = red
  sol (x*225.0) (-y*225.0) 100.0 i 25.0 cor1 cor2
  i+=1
 )
 
max quick render
