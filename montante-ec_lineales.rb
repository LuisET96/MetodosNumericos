class Montante

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    matriz = obtener_matriz()
    puts "****************************************"
    puts "Matriz original:\n\n"
    imprimir_matriz(matriz)

    matriz = simplifica_matriz(matriz)
    puts "****************************************"
    puts "Matriz simplificada:\n\n"
    imprimir_matriz(matriz)
    puts "****************************************"
    puts "Resultado:\n\n"
    calcular_resultado(matriz)
  end

  # Obtiene matriz y sus dimenciones
  def obtener_matriz
    matriz = dimenciones_matriz

    puts = "Ingresa los coeficientes y el resultado de cada ecuación involucrada."

    # Itera la matriz pidiendo el valor de cada casilla.
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

  # Pregunta por la cantidad de ecuaciones que se manejarán en la matriz.
  # Ecuaciones = filas.
  # Ecuaciones + 1 = columnas; Se infiere que cada ecuación tendrá un resultado.
  def dimenciones_matriz
    print "Cantidad de ecuaciones: "
    f = gets.to_i

    # Se define la matriz como un Array de Arrays.
    matriz = Array.new(f) { Array.new(f + 1) }
  end

  # Calcula la matriz simplificada por metodo montante.
  def simplifica_matriz(matC)
    # Define el pivote actual y anterior.
    pact = 0
    pant = 1

    # Crea una copia de la matriz original.
    matB = Array.new(matC.length) { Array.new(matC[0].length) }

    # Se calcula la nueva matriz a partir de la original.
    for i in (0...matC.length) do
      # Se define el pivote actual como algún elemento de la diagonal principal.
      pact = matC[i][i]

      matC.each_with_index do |ecuacion,k|
        ecuacion.each_with_index do |valor,l|
          # Instrucción que previene que se calcule la fila del pivote.
          if k != i
            # Calculando valor de casilla en nueva matriz.
            matB[k][l] = ((matC[i][i] * matC[k][l]) - (matC[k][i] * matC[i][l]))/pant
          else
            # La primer fila se pasa igual.
            matB[i][l] = valor
          end
        end
      end

      # imprime la evolución del algoritmo
      # imprimir_matriz(matB)
      # puts

      # Reasignando nueva matriz en matriz original.
      matC.each_with_index do |ecuacion,s|
        ecuacion.each_with_index do |valor,t|
          matC[s][t] = matB[s][t]
        end
      end

      # Actualizando pivote.
      pact = pant
    end

    return matC
  end

  # Calcula los valores de cada variable según la matriz simplificada por montante.
  def calcular_resultado(matriz)
    resultado = []
    for i in (0...matriz.length) do
      #Calculando resutado de cada valor involucrado en la matriz.
      resultado << (matriz[i][matriz.length]).to_f / (matriz[i][i]).to_f
    end

    resultado.each_with_index do |valor,i|
      # Imprimiendo valores correspondientes.
      puts "Valor#{i + 1} = #{valor}"
    end
  end

  # Imprime matriz que se le pase como parametro.
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
