class CpController < ApplicationController
	#Pagina principal para apostar
	load_and_authorize_resource
	def jugar
		hora
		@respuesta = nil;
		if request.post?
			@respuesta = false;
      		@info = {
      			:monto => params[:monto].to_f,
         		:moneda => params[:moneda]
         		};
  				if current_user.saldo >= @info[:monto]	
	  				@respuesta = true
	  				current_user.update(:saldo => current_user.saldo - @info[:monto])
			  		moneda = Coin.find_by(nombre: params[:moneda])
			  		@bet = Bet.new(:user => current_user, :coin => moneda, :cantidad => @info[:monto])
			  		@bet.save
			  	end
		end
	end

	#Pagina principal para recargar y ver saldo
	def saldo
		hora
		if request.post?

			@saldo1 ={
				:saldo => params[:saldo_a_enviar].to_f/100
				} 
			@usuario = current_user
			@saldo_actual = current_user.saldo
			@nuevo_saldo = @saldo_actual + @saldo1[:saldo]
			@usuario = current_user.update(:saldo => @nuevo_saldo)

		end

	end

	#Pagina para modificar y ver perfil
	def perfil
		hora
	end

	#Pagina con los resultados del dia
	def resultados
		hora
		@arreglo_de_resultados = Result.all
		@contador=0
	end

end
