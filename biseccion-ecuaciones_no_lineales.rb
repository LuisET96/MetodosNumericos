require "dentaku"
Calc = Dentaku::Calculator.new

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

    funcion = ""
    for i in (0...grado) do
      print "Ingresa coeficiente elevado a la potencia #{grado - i}: "
      coeficiente = gets().to_f()

      funcion += coeficiente >= 0 ? "+#{coeficiente}" : "#{coeficiente}"
      funcion += "*x^#{grado - i}"

      @y.push(coeficiente)
    end

    print "Ingresa constantea: "
    constante = gets().to_f()
    funcion += constante >= 0 ? "+#{constante}" : "#{constante}"
    funcion = funcion[1...funcion.length]
    @y.push(constante)

    obtener_valor_a(grado)

    puts "\nTu función es:"
    puts "f(x) = #{funcion}\n"

    puts Calc.evaluate(funcion, :x => 2)
  end

  def obtener_valor_a(grado)
      factor = @y.last > 0 ? -1 : 1
      exponente = (1/(@y.length.to_f - 1))
      @a = (@y.last.abs/@y.first.abs)
      @a = (@a ** exponente).floor * factor
  end

  def evaluar_ecuacion(x)
    valor_y = 0
    for i in (0...@y.length - 1) do
      valor_y += @y[i] * x ** (@y.length - 1 - i)
    end
    valor_y += @y.last
    return valor_y
  end

  def imprime_datos
    puts "\n\n****************************************"
    print "Diferencia: |Xi - Xi+1| = #{@diferencia}"
    puts
    print "Array de coeficientes: #{@y}"
    puts
    print "Valor de A = #{@a}"
    puts
    # print "Valor de Fx = #{evaluar_ecuacion(@a)}\n"
    puts "****************************************"
  end
end

biseccion = Biseccion.new
