require "dentaku"

class EulerAdelante
  DK = Dentaku::Calculator.new

  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    datos_iniciales
    valor_buscado = calcular_siguiente_y

    puts "\nEl valor buscado es:"
    print "y#{@y.count - 1}: #{@y.last}\n\n"
  end

  def datos_iniciales
    puts "Ingrese el despeje de y' de su ecuación diferencial"
    puts "Por Ejemplo. y' = ((3*y^2 - 2)/(4*cos(t)))"
    puts "-- Escribir todo en minusculas y separar las multiplicaciones con un asterisco (*) --"
    print "y' = "
    @ecuacion = gets.chomp

    print "\nIngresa el valor de y0: "
    @y = [gets.to_f]

    print "\nIngrea el valor de h: "
    @h = gets.to_f

    print "\nNumero de repeticiones: "
    @y_objetivo = gets.to_i

    @t = [0]
  end

  def calcular_siguiente_y
    for i in (0...@y_objetivo)
      siguiente_valor = @y.last + @h * (DK.evaluate(@ecuacion, y: @y.last, t: @t.last).to_f)
      @y << siguiente_valor
      @t << @t.last + @h
    end
  end

end

euler = EulerAdelante.new
