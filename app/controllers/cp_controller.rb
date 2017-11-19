class CpController < ApplicationController

	#Pagina principal para apostar
	def jugar
		hora
		@respuesta = false;
		if request.post?
      		@info = {
      			:monto => params[:monto],
         		:moneda => params[:moneda]
         		};
  		
		  		moneda = Coin.find_by(nombre: params[:moneda])
		  		@bet = Bet.new(:user => current_user, :coin => moneda, :cantidad => :monto)
		end
	end
	#Pagina principal para recargar y ver saldo
	def saldo
	end

	#Pagina para modificar y ver perfil
	def perfil
	end

	#Pagina con los resultados del dia
	def resultados
	end

end
