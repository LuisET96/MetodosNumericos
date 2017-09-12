class Biseccion
  def initialize
    puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

    obtener_ecuacion
  end

  def obtener_ecuacion
    print "Ingresa tu incogniota: "
    incognita = gets().chomp()

    print "Ingresa el grado de tu polinomio: "
    grado = gets().to_i()

    funcion = "y = "
    for i in (0...grado) do
      print "Ingresa coeficiente: "
      coeficiente = gets().to_i()

      funcion += coeficiente > 0 ? "+#{coeficiente}" : "#{coeficiente}"
      funcion += "#{incognita}^#{grado - i}"
    end

    puts "\nTu función es:"
    puts "#{funcion}\n"
  end
end

biseccion = Biseccion.new
