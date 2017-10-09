require "dentaku"

class Raphson
  DK = Dentaku::Calculator.new
  SIGNO = ["+1", "+1", "-1"]

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    obtener_ecuacion
    # evaluar_funcion(3)
    # metodo_biseccion
  end

  def obtener_ecuacion
    @ecuacion = Array.new()

    print "Ingresa el grado de la ecuación: "
    @grado = gets.to_i

    for i in (0..@grado) do
      cadena = @grado - i != 0 ? "Ingresa valor de coeficiente para la potencia #{@grado - i}: " : "Ingresa el valor de la constante: "
      print cadena
      @ecuacion << gets.to_i
    end

    puts "\n\nSu ecuacion es:"
    c = ""
    @ecuacion.each_with_index do |ec,i|
      c += ec >= 0 ? "+#{ec}x^#{@grado - i}" : "#{ec}x^#{@grado - i}"
    end
    puts "f(x) = #{c[1, c.length]}"
  end

  def metodo_biseccion
    i = 0
    c_ant = 0
    c_act = 0

    # Valor inicial de A
    # factor = @ecuacion.last.to_i.positive? ? 1 : -1
    factor = SIGNO[@ecuacion.last <=> 0]
    a = ((@ecuacion.last.to_i.abs / @ecuacion.first.to_i.abs) ** (1.0/@grado)).to_i * factor;
    obtiene_valor_b(a)

    loop do
      c_ant = c_act

    end
  end

  def obtiene_valor_b(a)
    factor = [1,-1]
    signo_inicial = SIGNO[a <=> 0].to_i
    funcion_evaluada = evaluar_funcion(a)
    # signo_obtenido = funcion_evaluada.positive? ? -1 : 1
    signo_obtenido = SIGNO[a <=> 0].to_i
  end

  def evaluar_funcion(x)
    ecuacion = ""

    for i in (0...@ecuacion.length) do
      ecuacion += @ecuacion[i] >= 0 ? "+#{@ecuacion[i]}*x^#{@grado - i}" : "#{@ecuacion[i]}*x^#{@grado - i}"
    end

    if @ecuacion[0] >= 0
      ecuacion = ecuacion[1, ecuacion.length]
    end

    return DK.evaluate(ecuacion, x: x)

  end

end

raphson = Raphson.new
