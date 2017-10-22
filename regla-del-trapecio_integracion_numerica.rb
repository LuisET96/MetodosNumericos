require "dentaku"

class ReglaTrapecio
  DK = Dentaku::Calculator.new

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    obtener_ecuacion
    h = calcula_intervalo
    obtener_solucion(obtiene_variables(h), h)
  end

  def obtener_ecuacion
    @limites = {a: "",b: ""}

    print "Ingresa el limite menor (a): "
    @limites[:a] = gets.to_i

    print "Ingresa el limite mayor (b): "
    @limites[:b] = gets.to_i

    define_ecuacion

    print "Ingresa valor de (n): "
    @n = gets.to_i
  end

  def define_ecuacion
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

  def calcula_intervalo
    h = (@limites[:b] - @limites[:a])/@n.to_f
    puts "valor h = #{h}\n\n"
    return h
  end

  def obtiene_variables(h)
    valores = [@limites[:a]]
    loop do
      valores << valores.last + h
      break if valores.last > @limites[:b]
    end
    valores.pop
    valores << (valores.last + h).to_i

    valores_aux = []
    valores.each do |valores|
      valores_aux << (evaluar_funcion(valores)).round(4).abs
    end
    # puts valores_aux
    return valores_aux
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

  def obtener_solucion(valores,h)
    factor_interno = calcula_factor_interno(valores)

    resultado = (h/2.0 * (valores.first + valores.last + factor_interno)).round(4)

    puts "I = #{resultado}"
  end

  def calcula_factor_interno(valores)
    factor_interno = 0
    for i in (1...valores.length - 1) do
      factor_interno += valores[i]
    end
    return 2 * factor_interno
  end

end

trapecio = ReglaTrapecio.new
