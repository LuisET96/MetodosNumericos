class Biseccion
  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    @y = []
    @diferencia = obtener_diferencia()
    obtener_ecuacion()
    imprime_datos
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
      print "Ingresa coeficiente: "
      coeficiente = gets().to_i()

      funcion += coeficiente > 0 ? " +#{coeficiente}" : " #{coeficiente}"
      funcion += "x^#{grado - i}"

      @y.push(coeficiente)
    end

    puts "\nTu función es:"
    puts "#{funcion}\n"
  end

  def obtener_diferencia
    dif = ""
    loop do
      loop do
        print "Ingresa cual es la diferencia buscada: "
        dif = gets().to_f()
        puts "\nDebes ingresar un valor mayor a 0.\n" if dif <= 0
        print dif
        break if dif.positive?
      end

      puts "\n\nLa diferencia buscada será:\n|Xi - Xi+1| = #{dif}"
      print "\n\n¿Es correcto? (Y/N): "
      respuesta = gets().chomp()
      puts
      break if respuesta == "Y" || respuesta == "y"
    end

    return dif
  end

  def imprime_datos
    puts
    puts
    puts "****************************************"
    print "Diferencia: |Xi - Xi+1| = #{@diferencia}"
    puts
    print "Array de coeficientes: #{@y}"
    puts "****************************************"
  end
end

biseccion = Biseccion.new
