function onda ox oy oz dx dy dz n_div n_ondas =
(

  plano=plane length:dx width:dy
  
  plano.lengthsegs=1
  plano.widthsegs=n_div  
  
  
  passo = (360.0*n_ondas)/(n_div)
  
  convertToMesh plano 
  
  max modify mode
  select plano
  subObjectLevel=1 
  
 v=1
 for ang=0.0 to (360.0*n_ondas) by passo do
 (
	meshop.moveVert plano (v) [0,0,(sin(ang)*dz)]	
	meshop.moveVert plano (v+n_div+1) [0,0,(sin(ang)*dz)]
	v+=1
 )

	update plano
	plano.pos=[ox,oy,oz]
	max create mode

)
  
 --ZONA DE TRABALHO


-- As Ondas
-- (c) Jose' F. Martins 
-- 2005

backgroundColor=white

max select all
max delete $

n=1
for o=0 to 3 do
(
 onda 0 (50.0*o) 0 20 100 20 (n*20) n
 n+=1
)
 