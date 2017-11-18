class CpController < ApplicationController

	#Pagina principal para apostar
	def jugar
		@respuesta = false;
		if request.post?
      		@usuario = {
      			:monto => params[:monto],
         		:moneda => params[:moneda]
         		};
  		end
		#usuario = User.current_user
		#usuario.update(params[:monto])
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
