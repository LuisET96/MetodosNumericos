require "dentaku"
Calc = Dentaku::Calculator.new

class Biseccion
  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    @x = {"a": "", "c": ""}
    @y = {"b": "", "d": ""}
    @coeficientes = []
    @diferencia = 0.001
    @funcion = obtener_ecuacion
    @x[:a] = obtener_valor_a(@coeficientes.length - 1)
    @y[:b] = evaluar_ecuacion(@x[:a])
    @x[:c] = obtener_valor_c(@x[:a])
    @y[:d] = evaluar_ecuacion(@x[:c])
    # imprime_datos
  end

  def obtener_ecuacion
    grado = ""

    loop do
      print "Ingresa el grado de tu polinomio: "
      grado = gets.to_i
      puts "\n\nDebes ingresar un grado mayor a 0." if grado <= 0
      break if grado.positive?
    end

    funcion = ""
    for i in (0...grado) do
      print "Ingresa coeficiente elevado a la potencia #{grado - i}: "
      coeficiente = gets.to_f

      funcion += coeficiente >= 0 ? "+#{coeficiente}" : "#{coeficiente}"
      funcion += "*x^#{grado - i}"

      @coeficientes.push(coeficiente)
    end

    print "Ingresa constantea: "
    constante = gets.to_f
    funcion += constante >= 0 ? "+#{constante}" : "#{constante}"
    funcion = funcion[1...funcion.length]
    @coeficientes.push(constante)

    puts "\nTu función es:"
    puts "f(x) = #{funcion}\n"

    return funcion
  end

  def obtener_valor_a(grado)
      factor = @coeficientes.last > 0 ? -1 : 1
      exponente = (1/(@coeficientes.length.to_f - 1))
      a = (@coeficientes.last.abs/@coeficientes.first.abs)
      a = (a ** exponente).floor * factor

      return a
  end

  def evaluar_ecuacion(x)
    Calc.evaluate(@funcion, :x => x)
  end

  def obtener_valor_c(a)
    a_aux = a
    b = evaluar_ecuacion(a)
    puts "b = #{b}"
    loop do
      if a.positive? then a_aux+=1 else a_aux-=1 end
      d = evaluar_ecuacion(a_aux)
      puts "d = #{d}"
      break if b.positive? != d.positive?
    end
    return a_aux
  end

  def imprime_datos
    puts "\n\n****************************************"
    print "Diferencia: |Xi - Xi+1|: #{@diferencia}"
    puts
    print "Array de coeficientes: #{@coeficientes}"
    puts
    print "Funcion es: #{@funcion}"
    puts
    print "Valor de A: #{@x[:a]}"
    puts
    print "Valor de C: #{@x[:c]}"
    puts
    print "Valor de B: #{@y[:b]}"
    puts
    print "Valor de D: #{@y[:d]}"
    puts "\n****************************************"
  end
end

biseccion = Biseccion.new
