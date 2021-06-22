function estrela_ninja cx cy raio n_picos espessura cor =
(
 --ZONA DE TRABALHO
 

 raio3 = raio*0.50
 passo=360.0/(n_picos*3)

 rosa = splineshape()
 
 addnewspline rosa

 for ang=0 to 360-passo*3+.1 by passo*3 do
 (
  ax = cx+ raio*cos(ang)
  ay = cy + raio*sin(ang)
  addknot rosa 1 #corner #line [ax,ay,0]
  dx = cx + raio3*cos(ang+passo)
  dy = cy + raio3*sin(ang+passo)
  addknot rosa 1 #corner #line [dx,dy,0] 

  fx = cx + raio3*cos(ang+passo*2)
  fy = cy + raio3*sin(ang+passo*2)
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
 for n=1 to (n_picos*3) do
 (

  if ((mod n 3)==1) then (

	 meshop.moveVert rosa (n) [0,0,(espessura*0.5)]
	 	 meshop.moveVert rosa (n+(n_picos*3)) [0,0,(-espessura*0.5)]
 
 )
  
 
 )
 
 meshop.setMapSupport rosa 0 true
 update rosa
 max create mode
 
)

-- Estrelas Ninja
-- (c) Jose' F. Martins 
-- 2005


i=3
backgroundColor=white

max select all
max delete $

for y=0 to 2 do
 for x=0 to 4 do
 (
  cor = green
  estrela_ninja (x*250.0) (-y*250.0) 100.0 i 50.0 cor
  i+=1
 )
 
max quick render
