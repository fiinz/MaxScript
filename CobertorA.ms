function cobertor ox oy oz dx dy dz n_div =
(


  plano=plane length:dx width:dy
  
  plano.lengthsegs=n_div 
  plano.widthsegs=n_div  
  
  
  passo = (360)/(n_div)
  
  convertToMesh plano 
  
  max modify mode
  select plano
  subObjectLevel=1 
  v=1
   for ang=0 to (360) by passo do
 (
 	 for  ang2=0 to (360) by passo do
  
	 (
		meshop.moveVert plano (v) [0,0,(cos(ang2)*sin(ang)*dz)]	
		v+=1
 )
 	
 )
 	update plano
	plano.pos=[ox,oy,oz]
	max create mode
 --ZONA DE TRABALHO
)

-- O Cobertor dos Pobrezinhos
-- (c) Jose' F. Martins 
-- 2005

backgroundColor=white

max select all
max delete $

cobertor 0 0 0 100 100 20 20
 