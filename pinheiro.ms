max select all
max delete

function pinheiro cx cy cz altura raio n_bolas =
(


base1= raio*0.3 
base2= raio*0.6
alturavaso=altura*0.20
alturatronco=altura*0.05
alturaarvore=altura*0.65
raiocil=raio*0.2


vaso = cone height:alturavaso radius1:base1 radius2:base2
vaso.pos=[cx,cy,cz]
vaso.wirecolor=(color 237 28 36)

tronco = cylinder height:alturatronco radius:raiocil
tronco.pos=[cx,cy,cz+alturavaso]
tronco.wirecolor=(color 96 57 19)

arvore = cone height:alturaarvore radius1:raio radius2:1
arvore.pos=[cx,cy,cz+alturavaso+alturatronco]
arvore.wirecolor=(color 0 166 8)
cor = color 255 242 0

rosa_ventos cx cy (cz+alturavaso+alturatronco+alturaarvore+raio*0.1) 4 3 (raio*0.05) cor 0
rosa_ventos cx cy (cz+alturavaso+alturatronco+alturaarvore+raio*0.1) 4 3 (raio*0.05) cor 90

for i = 0 to n_bolas do
(
	angulo = random 0.0 360.0
	t= (alturavaso+alturatronco+alturaarvore-raio*0.025)-(alturavaso+alturatronco+raio*0.025)
	
	posicaoa = random 0.0 t
	raioi = (posicaoa*raio)/(alturavaso+alturatronco+alturaarvore-(alturavaso+alturatronco+raio*0.025))
	ax = cx+raioi*cos(angulo)
	ay = cy+raioi*sin(angulo)	
	raiobola=raio*0.05
	bola = sphere radius:raiobola
	bola.pos=[ax,ay,-posicaoa+((alturavaso+alturatronco+alturaarvore-raio*0.025))]
	corbolas= (color (random 0 255) (random 0 255) (random 0 255))
	bola.wirecolor= corbolas
	
)

)

function rosa_ventos cx cy cz raio n_pontas espessura cor ang =
(

passo=360.0/(n_pontas*4.0)
raio2=raio*0.5
figura=splineshape()
addnewspline figura 

for ang=0.0 to 359.0 by passo*4.0 do (

figura.wirecolor=cor

ax=cx+raio*cos(ang)
ay=cy+raio*sin(ang)

dx=cx+raio2*cos(ang+passo)
dy=cy+raio2*sin(ang+passo)

ex=cx+raio*cos(ang+passo*2)
ey=cy+raio*sin(ang+passo*2)

fx=cx+raio2*cos(ang+passo*3)
fy=cy+raio2*sin(ang+passo*3)


addknot figura 1 #corner #line [ax,ay,0]
addknot figura 1 #corner #line [dx,dy,0]
addknot figura 1 #corner #line [ex,ey,0]
addknot figura 1 #corner #line [fx,fy,0]

)

close figura 1
addmodifier figura (extrude amount:espessura)
rotacao=eulerAngles 90 0 ang
rotate figura rotacao
figura.pos=[cx,cy+(espessura/2),cz]
updateshape figura

)


pinheiro 0.0 0.0 0.0 100.0 25.0 80.0


