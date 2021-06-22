function rosa_ventos2 cx cy raio n_pontas espessura cor =
(
 raio2 = raio*0.75
 raio3 = raio*0.50
 passo=360.0/(n_pontas*4)

 rosa = splineshape()
 
 addnewspline rosa

 for ang=0 to 360-passo*4+.1 by passo*4 do
 (
  ax = cx + raio*cos(ang)
  ay = cy + raio*sin(ang)
  addknot rosa 1 #corner #line [ax,ay,0]
  dx = cx + raio3*cos(ang+passo)
  dy = cy + raio3*sin(ang+passo)
  addknot rosa 1 #corner #line [dx,dy,0] 
  ex = cx + raio2*cos(ang+passo*2)
  ey = cy + raio2*sin(ang+passo*2)
  addknot rosa 1 #corner #line [ex,ey,0] 
  fx = cx + raio3*cos(ang+passo*3)
  fy = cy + raio3*sin(ang+passo*3)
  addknot rosa 1 #corner #line [fx,fy,0]
 )

 close rosa 1 
 updateshape rosa
 
 addModifier rosa (extrude amount:espessura)
 rosa.wireColor = cor
 
 convertToMesh rosa
 max modify mode
 select rosa
 subObjectLevel=1
 v=1
 for n=0 to (n_pontas*4*2) do
 (
	if ((mod v 2)==0) then meshop.moveVert rosa (v) [0,0,-espessura]
  --if ((mod v 2)==0) then meshop.setVertColor rosa 0 (v) blue
  
  v+=1
  
 )
 meshop.setMapSupport rosa 0 true
 update rosa
 max create mode
)

-- As Rosas dos Ventos 2
-- (c) Jose' F. Martins 
-- 2004


i=3
backgroundColor=white

max select all
max delete $

for y=0 to 2 do
 for x=0 to 5 do
 (
  cor = (color (random 0 255) (random 0 255) (random 0 255))
  rosa_ventos2 (x*210.0) (-y*210.0) 100.0 i 25.0 cor
  i+=1
 )
 
max quick render
