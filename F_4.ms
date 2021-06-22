function bicos ox oy oz dx dy dz n_div =
(
 --ZONA DE TRABALHO
  --por jaime fins
  plano=plane length:dx width:dy
  plano.lengthsegs=n_div
  plano.widthsegs=n_div  
  plano.pos=[ox,oy,oz]
  
  convertToMesh plano 
  max modify mode
  select plano
  subObjectLevel=1  
  i=1
  passo=(360.0)/(n_div+1.0)
  passov=(n_div/2.0)+2
  for ang=0.0 to (360.0) by passo do
  (
  nvert=((n_div/2.0)*sin(ang))
  meshop.moveVert plano (passov+nvert)[0,0,dz]	
  passov+=(n_div+1)
    
  )
	meshop.setMapSupport plano 0 true
	update plano
	max create mode
	
)

-- A Casa dos Bicos
-- (c) Jose' F. Martins 
-- 2005

backgroundColor=white

max select all
max delete $

bicos 0 0 0 100 100 20 50
 