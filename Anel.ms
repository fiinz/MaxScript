
max select all
max delete

function anel cx cy raio n_lados cor1 cor2 =
(
--Zona de Trabalho

passo=180.0/n_lados

for ang1=0.0 to 130 by passo do 

(
	x = cx+raio*cos(ang1)
	y = cy+raio*sin(ang1)
	dx = cx+raio*cos(ang1+passo)
	dy = cy+raio*sin(ang1+passo)
	
	tamanho= sqrt(((dx-x)^2)+((dy-y)^2))

	
		
	esf = sphere radius:15 smooth:true
	esf.pos=[x,y,0]	
	esf.wireColor = cor1
	
	cil = cylinder radius:8 height:tamanho	
	cil.wireColor = cor2
	op= passo	
	teste= ang1-passo/2	
	angulo = eulerAngles 90 0 teste	
   	rotate cil angulo 	
    cil.pos=[x,y,0]

)


)



-- Os Aneis
-- (c) Jose' F. Martins 
-- 2004


i=3
backgroundColor=white

 for x=0 to 4 do
 (
  cor1 = (color (random 0 255) (random 0 255) (random 0 255))
  cor2 = (color (random 0 255) (random 0 255) (random 0 255))
  anel (x*300.0) 0.0 100.0 i cor1 cor2
  i+=1
 )
 
max quick render