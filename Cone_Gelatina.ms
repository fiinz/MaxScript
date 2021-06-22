function cone_gelatina cx cy raio altura n_ondas cor =
(
 --ZONA DE TRABALHO
 con = cone radius1:raio radius2:1 height:altura
 con.pos=[cx,cy,0]
 passo=360/n_ondas
 convertToMesh rosa
 max modify mode
 select rosa
 subObjectLevel=1
 n=0
 for ang=0 to 360*n_ondas by passo do(
 n+=1
  meshop.moveVert rosa (n)) [0,0,(-espessura*0.5)]
 
 
 )
 
)

-- Cone de Gelatina
-- (c) Jose' F. Martins 
-- 2005


i=3
backgroundColor=white

max select all
max delete $

for x=0 to 4 do
(
 cor = green
 cone_gelatina (x*250.0) 0.0 50.0 150.0 i cor
 i+=1
)
 
max quick render
