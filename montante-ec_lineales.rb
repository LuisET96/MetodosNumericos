class Montante

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    matriz = obtener_matriz()
    matriz_montante = calcular(matriz)

    imprimir_matriz(matriz)
    puts "****************************************"
    # imprimir_matriz(matriz_montante)
  end

  def obtener_matriz
    matriz = dimenciones_matriz

    puts = "Ingresa los coeficientes y el resultado de cada ecuación involucrada."
    matriz.each_with_index do |ecuacion, i|
      ecuacion.each_with_index do |coeficiente, j|
        coeficiente = "Ingresa el valor del coeficiente [#{i},#{j}]: "
        resultado = "Ingresa resultado de la ecuación: "
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

    matriz = Array.new(f) { Array.new(c) }
  end

  def calcular(matC)
    pact = 0
    pant = 1
    matB = Array.new(matC.length) { Array.new(matC[0].length) }

    for i in (0...matC.length) do
      pact = matC[i][i]

      matC.each_with_index do |ecuacion,k|
        ecuacion.each_with_index do |valor,l|
          if k != i
            matB[k][l] = ((matC[i][i] * matC[k][l]) - (matC[k][i] * matC[i][l]))/pant
          else
            matB[i][l] = valor
          end
        end
      end

      # imprime la evolución del algoritmo
      # imprimir_matriz(matB)
      # puts

      matC.each_with_index do |ecuacion,s|
        ecuacion.each_with_index do |valor,t|
          matC[s][t] = matB[s][t]
        end
      end

      pact = pant
    end

    return matC
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
