class CpController < ApplicationController

	#Pagina principal para apostar
	def jugar
		@respuesta = false;
		if request.post?
      		@info = {
      			:monto => params[:monto],
         		:moneda => params[:moneda]
         		};
  				
  				current_user.update(:saldo => current_user.saldo - @info[:monto].to_f)
		  		moneda = Coin.find_by(nombre: params[:moneda])
		  		@bet = Bet.new(:user => current_user, :coin => moneda, :cantidad => @info[:monto])
		  		@bet.save
		end
	end

	#Pagina principal para recargar y ver saldo
	def saldo
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
	end

	#Pagina con los resultados del dia
	def resultados
	end

end
