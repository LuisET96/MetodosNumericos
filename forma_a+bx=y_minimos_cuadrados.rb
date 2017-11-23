class MinimosCuadrados
  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    n = 0
    loop do
      print "Cantidad de valores de x: "
      n = gets.to_i

      if n < 0
        print "Ingresa un numero mayor a 0\n\n"
      end

      break if n > 0
    end

    puts "Valores en X:"
    x = obtener_valores_x(n)

    puts "\nValores en Y"
    y = obtener_valores_y(n)

    crear_matris(x,y)
  end

  def obtener_valores_x(n)
    valores_x = Array.new(n)

    for i in (0...n) do
      print "Ingresa valor #{i + 1} de la escala de X: "
      valores_x[i] = gets.to_f
    end

    return valores_x
  end

  def obtener_valores_y(n)
    valores_y = Array.new(n)

    for i in (0...n) do
      print "Ingresa valor #{i + 1} de la escala de Y: "
      valores_y[i] = gets.to_f
    end

    return valores_y
  end

  def crear_matris(x, y)
    n = x.length
    sum_x = sumatoria(x)
    sum_x_cuadrado = sumatoria(x, nil, true)
    sum_y = sumatoria(y)
    sum_xy = sumatoria(x, y)

    matriz = [[n, sum_x, sum_y], [sum_x, sum_x_cuadrado, sum_xy]]

    imprimir_matriz(n, matriz)

    imprimir_ecuacion_final(n, sum_x, sum_x_cuadrado, sum_y, sum_xy)
  end

  def sumatoria(array1, array2 = nil, cuadrado = false)
    resultado = 0
    if !cuadrado
      if array2 != nil
        for i in (0...array1.length) do
          resultado += array1[i] * array2[i]
        end
      else
        array1.each { |x| resultado += x }
      end
    else
      array1.each { |x| resultado += (x ** 2) }
    end

    return resultado
  end

  def imprimir_matriz(n, matriz)
    puts "\nMatriz resultante:"
    print "#{matriz[0]}\n"
    print "#{matriz[1]}\n"
  end

  def imprimir_ecuacion_final(n, sx, sxx, sy, sxy)
    a = ((sxx * sy - sx * sxy)/(n * sxx - sx * sx))
    b = ((n * sxy - sx * sy)/(n * sxx - sx * sx))

    puts "\nEcuación resultante:"
    puts "#{a} + #{b}x = y"
  end
end

mc = MinimosCuadrados.new()
