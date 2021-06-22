function bicos ox oy oz dx dy dz n_div =
(
 --ZONA DE TRABALHO
  --por jaime fins

	
  plano=plane length:dx width:dy
  plano.lengthsegs=n_div
  plano.widthsegs=n_div  
  plano.pos=[ox,oy,oz]
  
  plano2=plane length:(dx/2) width:(dy)
  plano2.lengthsegs=n_div
  plano2.widthsegs=n_div  
  
  plano3=plane length:(dx/2) width:(dy)
  plano3.lengthsegs=n_div
  plano3.widthsegs=n_div  
  
  plano4=plane length:(dx/2) width:(dy)
  plano4.lengthsegs=n_div
  plano4.widthsegs=n_div  
  
  
plano.wireColor=white
plano2.wireColor=white
plano3.wireColor=white
plano4.wireColor=white

   angulo = eulerAngles 90 0 0	
   angulo2 = eulerAngles 90 0 90	
   angulo3 = eulerAngles 90 0 270

    rotate plano2 angulo 
    rotate plano3 angulo2 
    rotate plano4 angulo3 
    plano2.pos=[ox,oy+dy/2,oz+dx/4]
	plano3.pos=[ox-dx/2,oy,oz+dx/4]
	plano4.pos=[ox+dx/2,oy,oz+dx/4]
	
  	passo=(360.0)/(dx-6)
	passobola=3

	esf = sphere radius:3 smooth:true
	esf.wireColor = red
	passobola=3
	time1=0
    esf.pos=[ox-(dx/2.0)+passobola,oy,3+(dx/4.0)]	

	for ang=90.0 to 360.0+90.0 by passo do (
	animate on ( 	
	at time time1 (esf.pos=[ox-(dx/2.0)+passobola,oy,3+abs(oz+(sin(ang)*(dx/4.0)))])	
	)
	time1+=1
	passobola+=1	

	)
	
	

)

-- A Casa dos Bicos
-- (c) Jose' F. Martins 
-- 2005

backgroundColor=white

max select all
max delete $

bicos 0 0 0 100 100 20 50
 