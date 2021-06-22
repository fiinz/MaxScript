function bicos ox oy oz dx dy dz n_div =
(
 --ZONA DE TRABALHO
  
  plano=plane length:dx width:dy
  plano.lengthsegs=n_div
  plano.widthsegs=n_div  
  plano.pos=[ox,oy,oz]
  
  convertToMesh plano 
  max modify mode
  select plano
  subObjectLevel=1  
  i=1
  for x=0 to n_div do
  (
    for y=0 to n_div do
  	(  
  		if(((mod x 2)==0) and ((mod y 2)==0)) then 
		(
			  meshop.moveVert plano (i) [0,0,dz]	   
			  r = random 1 255
			  g = random 1 255
			  b = random 1 255	  
			  meshop.setVertColor plano 0 (i) (Color r g b)	  
		)
		else
		(
			meshop.setVertColor plano 0 (i) white
		)
  	   i+=1	    
    )	
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

bicos 0 0 0 100 100 20 11
 