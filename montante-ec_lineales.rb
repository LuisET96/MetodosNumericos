class Montante

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    @matriz = obtener_matriz
    @pivote = ""
    imprimir_matriz(@matriz)
  end

  def obtener_matriz
    matriz = dimenciones_matriz

    puts = "Ingresa los coeficientes y el resultado de cada ecuación involucrada."
    matriz.each_with_index do |ecuacion, i|
      ecuacion.each_with_index do |coeficiente, j|
        coeficiente = "Ingresa el valor [#{i + 1}, #{j + 1}]: "
        resultado = "Ingresa resultado: "
        print (j + 1) != ecuacion.length ? coeficiente : resultado
        matriz[i][j] = gets.to_i
      end
      puts "\n"
    end

    return matriz
  end

  def dimenciones_matriz
    print "Cantidad de variables: "
    c = gets.to_i + 1
    print "Cantidad de ecuaciones: "
    f = gets.to_i

    matriz = Array.new(f) { Array.new(c,1) }
  end

  def imprimir_matriz(mat)
    mat.each do |f|
      f.each do |c|
        print "[#{c}\t]"
      end
      puts
    end
  end

end

montante = Montante.new
