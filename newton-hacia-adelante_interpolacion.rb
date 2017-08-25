class NewtonHaciaAdelante
	def initialize
		@x = Array.new
		@y = Array.new

		print "Valor X0: "
		@x0 = gets.to_f
		obtener_datos_x()
	end

	def obtener_datos_x
		cantidad_datos = 0
		loop do
			print "Cantidad de datos a capturar: "
			cantidad_datos = gets.to_i

			if cantidad_datos <= 0
				puts "\nDebes agregar una cantidad mayo a 0"
				de_nuevo = true
			else
				de_nuevo = false
			end

			break if !de_nuevo
		end

		puts
		puts "Valores de X..."
		cantidad_datos.times do
			print "Ingresa vlor para Xi: "
			val = gets.to_f
			@x << val
		end

		resultado = valida_valor_h(cantidad_datos)
		if resultado
			obtener_datos_y(cantidad_datos)
		else
			puts "Los valores de X deben tener la misma separación.\nEl problema no se puede hacer."
		end
	end

	def obtener_datos_y(cd)
		puts
		puts "Valores de Y..."
		cd.times do
			print "Ingresa valor para Y: "
			val = gets.to_f
			@y << val
		end
	end

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

		print @deltas
		puts
		puts "****************************************"
	end

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

	def redondear_valores
	  for i in (0...@deltas.length) do
	  	for j in (0...@deltas[i].length) do
	  		@deltas[i][j] = @deltas[i][j].round(2)
	  	end
	  end
	end
end

nhd = NewtonHaciaAdelante.new
nhd.obtener_deltas
