class Biseccion
  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    @y = []
    @diferencia = 0.001
    obtener_ecuacion()
    imprime_datos()
  end

  def obtener_ecuacion
    grado = ""

    loop do
      print "Ingresa el grado de tu polinomio: "
      grado = gets().to_i()
      puts "\n\nDebes ingresar un grado mayor a 0." if grado <= 0
      break if grado.positive?
    end

    funcion = "f(x) = "
    for i in (0...grado) do
      print "Ingresa coeficiente elebado a la potencia #{grado - i}: "
      coeficiente = gets().to_f()

      funcion += coeficiente > 0 ? " +#{coeficiente}" : " #{coeficiente}"
      funcion += "x^#{grado - i}"

      @y.push(coeficiente)
    end

    print "Ingresa constante: "
    constante = gets().to_f()
    funcion += constante > 0 ? " +#{constante}" : " #{constante}"
    @y.push(constante)

    obtener_valor_a(grado)

    puts "\nTu función es:"
    puts "#{funcion}\n"
  end

  def obtener_valor_a(grado)
      factor = @y.last > 0 ? -1 : 1
      exponente = (1/(@y.length.to_f - 1))
      @a = (@y.last.abs/@y.first.abs)
      @a = (@a ** exponente).floor * factor
  end

  def imprime_datos
    puts "\n\n****************************************"
    print "Diferencia: |Xi - Xi+1| = #{@diferencia}"
    puts
    print "Array de coeficientes: #{@y}"
    puts
    print "Valor de A = #{@a}\n"
    puts "****************************************"
  end
end

biseccion = Biseccion.new
