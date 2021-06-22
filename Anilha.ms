function anilha cx cy cz raioE raioI esp n_sulcos cor =
(
 --ZONA DE TRABALHO
 
 passo=(raioE-raioI)/(n_sulcos*2.0+1.0)
 s=esp/3.0
 anilha_s=splineshape()
 addnewspline anilha_s
 
 addKnot anilha_s 1 #corner #line [raioI,0,0]
 addKnot anilha_s 1 #corner #line [raioE,0,0]
 addKnot anilha_s 1 #corner #line [raioE,esp,0]
 
for i=1 to n_sulcos do
 (
  n=(i-1)*2.0+1.0;
  addknot anilha_s 1 #corner #line [raioE-passo*n,esp,0]
  addknot anilha_s 1 #corner #line [raioE-passo*n,s,0]
  addknot anilha_s 1 #corner #line [raioE-passo*(n+1),s,0]
  addknot anilha_s 1 #corner #line [raioE-passo*(n+1),esp,0]
 )
 
 addknot anilha_s 1 #corner #line [raioI,esp,0]

 close anilha_s 1 
 updateshape anilha_s 
 addModifier anilha_s(lathe segs:32)
 anilha_s.wireColor = cor
 rot_anilha_s=eulerangles 90.0 0.0 0.0
 rotate anilha_s rot_anilha_s
 anilha_s.pos=[cx,cy,cz]
 anilha_s.wireColor=cor
)

backgroundColor=white

max select all
max delete $

for x=0 to 0 do
(
 cor = (color (random 0 255) (random 0 255) (random 0 255))
 anilha (x*300) 0 0 100 50 30 (x+1) cor
)
max quick render
