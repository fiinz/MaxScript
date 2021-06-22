function roda_dentada cx cy raio n_dentes espessura cor1 cor2 =
(
 raio2 = raio*0.75
 passo=360.0/(n_dentes*2)

 roda = splineshape()
 
 addnewspline roda

 for ang=0 to 360-passo*2+.1 by passo*2 do
 (
  ax = cx + raio*cos(ang)
  ay = cy + raio*sin(ang)
  addknot roda 1 #corner #line [ax,ay,0]
  dx = cx + raio*cos(ang+passo)
  dy = cy + raio*sin(ang+passo)
  addknot roda 1 #corner #line [dx,dy,0] 
  ex = cx + raio2*cos(ang+passo)
  ey = cy + raio2*sin(ang+passo)
  addknot roda 1 #corner #line [ex,ey,0] 
  fx = cx + raio2*cos(ang+passo*2)
  fy = cy + raio2*sin(ang+passo*2)
  addknot roda 1 #corner #line [fx,fy,0]
 )

 close roda 1 
 updateshape roda
 
 addModifier roda (extrude amount:espessura)
 roda.wireColor = cor1
 
 convertToMesh roda
 max modify mode
 select roda
 subObjectLevel=1
 v=1
 for n=1 to (n_dentes*4*2) do
 (
  if (((mod v 4)==1)or((mod v 4)==2)) then
  ( 
   meshop.moveVert roda (v) [0,0,(-espessura*2)]
   meshop.setVertColor roda 0 (v) cor2
  )
  else  meshop.setVertColor roda 0 (v) cor1 
  v+=1
 )
 meshop.setMapSupport roda 0 true
 update roda
 max create mode

 
)

-- As Rodas Dentadas 3
-- (c) Jose' F. Martins 
-- 2005


i=3
backgroundColor=white

max select all
max delete $

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor1 = red
  cor2 = green
  roda_dentada (x*250.0) (-y*250.0) 100.0 i 25.0 cor1 cor2
  i+=1
 )
 
max quick render
