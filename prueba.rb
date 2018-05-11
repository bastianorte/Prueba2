lineas = 0
sumas = 0
linea = []
opcion = 0
file = File.open('alumnos.csv', 'r')
data = file.readlines
file.close
while opcion !=4
  puts "1 permite generar un archivo con el nombre de cada alumno y el promedio de sus notas."
  puts "2 Debe contar la cantidad de inasistencias totales y mostrarlas en pantalla."
  puts "3 mostrar los nombres de los alumnos aprobados"
  puts "4 termina el programa."

  opcion = gets.chomp.to_i
  case opcion
  when 1
    puts "1 permite generar un archivo con el nombre de cada alumno y el promedio de sus notas."
    data.each do |x|
    lineas = []
    lineas = x.split(", ").map(&:chomp)
    divisor = lineas.length-1
    sumas = lineas.map{|x| x.to_i}.sum
    promedio = sumas.to_f/divisor
    puts "#{lineas[0]} tiene un promedio de #{promedio}"
    file = File.open('alumnosv2.csv', 'a')
    file.puts "#{lineas[0]} tiene un promedio de #{promedio}"
    file.close
    end
  when 2
    puts "2 Debe contar la cantidad de inasistencias totales y mostrarlas en pantalla."
    data.each do |x|
    linea = x.split(", ").map(&:chomp)
    linea.each do |y|
    puts "#{linea[0]} tiene #{linea.count("A")} inasistencia" if y == "A"
    end
    end
  when 3
    puts "3 mostrar los nombres de los alumnos aprobados"
    def promedio(z, nota = 5.0)
      z.each do |x|
        lineas = x.split(", ").map(&:chomp)
        divisor = lineas.length-1
        sumas = lineas.map{|x| x.to_i}.sum
        promedio = sumas.to_f/divisor
        puts "#{lineas[0]} aprueba con un promedio de #{promedio}" if promedio > nota
    end
  end
  puts "Digite el promedio de nota para aprobar"
  z = data
  nota = gets.chomp.to_i
  nota2 = nota
  nota = 5 if [1,2,3,4,5,6,7,8,9,10].include?(nota2) == false
  promedio(z,nota)
else
  puts "La opcion es invalida" if opcion !=4 
  end
end
