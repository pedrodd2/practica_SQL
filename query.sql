select t2.nombremodelo as Modelo,t3.nombremarca as marca,t4.nombregrupo as Grupo, t1.dt_compra as Fecha_de_Compra ,
t1.matricula , t5.nombrecolor as color, t1.totalkm , t6.nombreaseguradora as aseguradora, t1.numpoliza as Poliza
from car.coche t1 
	inner join car.modelo t2
		on t1.IdModelo = t2.idModelo 
	inner join car.marca t3
		on t2.idmarca  = t3.idmarca
	inner join car.grupo t4
		on t3.idgrupo  = t4.idgrupo
	inner join car.color t5
		on t1.idcolor  = t5.idcolor
	inner join car.aseguradora t6
		on t1.idaseguradora  = t6.idaseguradora
where t1.dt_baja = '4000-01-01';

		
		
		
		
		
		
		
		
		
		
		
		