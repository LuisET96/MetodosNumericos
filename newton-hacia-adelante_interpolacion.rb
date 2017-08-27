# Creando metodo de la clase Array para ordenar los valores
# de array por metodo quick sort
class Array
	def quick_sort
		return self if length <= 1
		pivote = self[length / 2]
		find_all { |i| i < pivote }.quick_sort +
		find_all { |i| i == pivote } +
		find_all { |i| i > pivote }.quick_sort
	end
end

class NewtonHaciaAdelante
	def initialize
		puts "José Luis Eguía Téllez\t1791916"
		puts "Metodos Numericos"
		puts "Hora: M1\tSalón: 2105"
		puts "****************************************\n\n"

		@x = Array.new
		@y = Array.new

		print "Valor X0: "
		@x0 = gets.to_f
		obtener_datos_x()
	end

	#Obteniendo valores de X
	def obtener_datos_x
		cantidad_datos = 0
		loop do
			print "Cantidad de datos a capturar: "
			cantidad_datos = gets.to_i

			if cantidad_datos <= 0
				puts "\nDebes agregar una cantidad mayo a 0."
				de_nuevo = true
			else
				de_nuevo = false
			end

			break if !de_nuevo
		end

		puts
		puts "Valores de X..."
		cantidad_datos.times do
			print "Ingresa valor para Xi: "
			val = gets.to_f
			@x << val
		end

		resultado = valida_valor_h(cantidad_datos)
		if resultado
			puts
			puts "Los valores tienen la misma separación.\nEl valor para h es:\nh = #{@h}"
			obtener_datos_y(cantidad_datos)
		else
			puts "Los valores de X deben tener la misma separación.\nEl problema no se puede hacer."
		end
	end

	#Obteniendo valores de Y
	def obtener_datos_y(cd)
		puts
		puts "Valores de Y..."
		cd.times do
			print "Ingresa valor para Y: "
			val = gets.to_f
			@y << val
		end
		@y = @y.quick_sort
		obtener_deltas()
	end

	# Revisa si la separacion de los valores en X
	# es la misma y obtiene valor de h
	def valida_valor_h(cd)
		resultado = false
		iteraciones = @x.length
		@h = (@x[1] - @x[0]).abs

		if @h != 0
			for i in (0...iteraciones - 1) do
				#puts @x[i + 1] - @x[i]
				if @x[i + 1] - @x[i] == @h
					resultado = true
				else
					return false
				end
			end
		end

		return resultado
	end

	# Obtiene valores de los delta
	def obtener_deltas
		@deltas = Array.new
		@deltas = [[@y[0]]]

		delta = []
		for i in (0...@y.length - 1) do
			delta << @y[i + 1] - @y[i]
		end
		@deltas << delta

		(@y.length - 2).times do
			delta = obtener_mas_deltas
			@deltas << delta
		end
		redondear_valores()
		parametro_desviacion()
	end

	# Obtiene valores de los deltas
	def obtener_mas_deltas
	  ultimo_delta = @deltas.length - 1
		delta = []

		if @deltas[ultimo_delta].length == 2
			delta << @deltas[ultimo_delta][1] - @deltas[ultimo_delta][0]
		else
			for i in (0...@deltas[ultimo_delta].length - 1) do
				delta << @deltas[ultimo_delta][i + 1] - @deltas[ultimo_delta][i]
			end
		end

		return delta
	end

	# Redondea los valores de delta
	def redondear_valores
	  for i in (0...@deltas.length) do
	  	for j in (0...@deltas[i].length) do
	  		@deltas[i][j] = @deltas[i][j].round(2)
	  	end
	  end
	end

	# Obtiene el parametro de desviacion
	def parametro_desviacion
	  s = ((@x0 - @x[0])/@h).abs

		obtener_desviaciones(s)
		obtener_solucion()
	end

	# Obtiene y calcula los valores de desviacion
	def obtener_desviaciones(s)
	  @s = []
		@s << 1
		for i in (0...@deltas.length - 1) do
			desviacion = s - i
			@s << desviacion
		end
	end

	# Calcula la sumatoria del resultado
	def obtener_solucion
	  @deltas = primer_nivel()
		gx = 0

		@deltas.each_with_index do |delta,index|
			gx += (delta * multiplica_factor(index)).round(4)
		end
		puts
		puts "Obteniendo resultado por metodo Newton Hacia Adelante:"
		puts "g(x) = #{gx}"
		puts
	end

	# Obtiene primer nivel de deltas
	def primer_nivel
		array_primer_nivel = []
		@deltas.each do |s|
			array_primer_nivel << s[0]
		end

		return array_primer_nivel
	end

	# Calcula factor usado en la sumatoria
	def multiplica_factor(i)
		if i < 2
			factor = @s[i]
		else
			factor2 = 1
			for j in (0..i) do
				factor2 *= @s[j]
			end
			factor = factor2 / factorial(i)
		end

	  return factor
	end

	# Calcula factorial que divide la sumatoria
	def factorial(n)
	  if n == 0
			return 1
		else
			return n * factorial(n - 1)
		end
	end
end

nhd = NewtonHaciaAdelante.new
