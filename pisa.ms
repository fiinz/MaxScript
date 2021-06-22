
max select all
max delete

function torre  cx cy cz raio altura_andar n_andares n_pilares =
(

raiocoluna = raio*0.10
alturabase = altura_andar*0.1666
passo = 360/n_pilares
raio2 = raio*0.75
corb = (color (random 0 255) (random 0 255) (random 0 255))
corc = (color (random 0 255) (random 0 255) (random 0 255))


for i=0 to n_andares-1 do 
(
	cz=i*altura_andar
	
	--base
	base = cylinder height:alturabase radius:raio 
	base.pos=[cx,cy,cz]	
	base.wireColor=corb
	for ang=0 to 360 by passo do 
	(
	
		ax = cx+raio2*cos(ang)
		ay = cy+raio2*sin(ang)

		--colunas
		colunas = cylinder height:altura_andar radius:raiocoluna 
		colunas.pos=[ax,ay,cz]	
	    colunas.wireColor=corc	
		
	
	)
)
	topo = cylinder height:alturabase radius:raio 
	topo.pos=[cx,cy,cz+altura_andar]	
	topo.wireColor=corb
)

for y =1 to 3 do (
	dist=y*150
	torre dist 0 0 50 50 y 5 
)









