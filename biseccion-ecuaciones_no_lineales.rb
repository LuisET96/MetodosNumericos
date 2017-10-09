require "dentaku"

class Raphson
  DK = Dentaku::Calculator.new

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    obtener_ecuacion
    resultado = metodo_biseccion

    puts "Numero de iteraciones: #{resultado.last}"
    puts "Diferencias: #{resultado.first.round(5)}, #{resultado[1].round(5)}"
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

    puts "\nSu ecuacion es:"
    c = ""
    @ecuacion.each_with_index do |ec,i|
      c += ec >= 0 ? "+#{ec}x^#{@grado - i}" : "#{ec}x^#{@grado - i}"
    end
    puts "f(x) = #{c[1, c.length]}"
    puts
  end

  def metodo_biseccion
    i = 0
    c_ant = 0
    c_act = 0

    # Valor inicial de A
    # factor = @ecuacion.last.to_i.positive? ? 1 : -1
    factor = get_signo(@ecuacion.last.to_i) * -1
    a = ((@ecuacion.last.to_i.abs / @ecuacion.first.to_i.abs) ** (1.0/@grado)).to_i * factor;
    b = obtiene_valor_b(a)
    resultado = false

    loop do
      i += 1
      c_ant = c_act
      c_act = (a + b)/2.0

      if evaluar_funcion(c_act) >= 0
        a = c_act
      else
        b = c_act
      end

      if (c_act - c_ant).abs <= 0.001
        resultado = [c_ant, c_act, i]
      end

      break if (c_act - c_ant).abs <= 0.001
    end
    return resultado
  end

  def obtiene_valor_b(a)
    signo1 = get_signo(evaluar_funcion(a))
    return get_signo(evaluar_funcion(a - 1)) != signo1 ? a - 1 : a + 1
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

  def get_signo(x)
    return ["+1", "+1", "-1"][x <=> 0].to_i
  end

end

raphson = Raphson.new
