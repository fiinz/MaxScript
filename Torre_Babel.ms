function torre_babel cx cy cz raio altura n_andares cor =
(
 -- ZONA DE TRABALHO
 
 passo_a=altura/n_andares
 passo_r=raio/n_andares
 
 torre = splineshape()
 addnewspline torre
 
 addknot torre 1 #corner #line [0,0,0]

 r=raio
 a=0
 for i=1 to n_andares do
 (
  addknot torre 1 #corner #line [r,a,0]
  addknot torre 1 #corner #line [r*.9,a+passo_a,0]
 r-=passo_r
  a+=passo_a 
 )
 
 addknot torre 1 #corner #line [0,altura,0]

 close torre 1 
 updateshape torre 
 addModifier torre (lathe segs:32)
 torre.wireColor = cor
 rot_torre=eulerangles 90.0 0.0 0.0
 rotate torre rot_torre
 torre.pos=[cx,cy,cz]

)
backgroundColor=white

max select all
max delete $

for x=1 to 4 do
(
 cor = (color (random 0 255) (random 0 255) (random 0 255))
 torre_babel (x*300) 0 0 100 (100*x) x cor
)


max quick render
