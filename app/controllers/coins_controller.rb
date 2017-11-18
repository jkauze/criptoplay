class CoinsController < ApplicationController
	before_action :set_coin, except:[:new,:create,:index]
	def index

		#Va a ser el index de mi paginas de articulos
		#Article.all devuelve un objeto con el que puedo iterar y obtener cada uno
		#de mis articulos
		@arreglo_de_monedas = Coin.all

	end

	def show 
		#Va a ser la pagina de cada uno de mis articulos
		#puedo obtener mi articulo con Article.find para agregarle estilos
		#@mi_articulo = Article.find(params[:id])
	end

	def new

		#aqui instancio mi articulo nuevo vacio
		#para luego en la vista anadirle propiedades
		@nueva_moneda = Coin.new
	end

	def create

		#Aqui finalmente creo mi articulo propiamente dicho
		#con los datos que mande de post de nuevo_articulo

		@nueva_moneda = Coin.new(coin_params)

		#Aqui guardo finalmente mi articulo en mi tabla de la base de datos

		if @nueva_moneda.save
			redirect_to @nueva_moneda

		else
			render :new
		end


		#hago un redireccionamiento a mi la pagina de mi articulo
		
	end

	def destroy
		@nueva_moneda.destroy
		redirect_to articles_path
	end

	def edit
	end

	def update
		if @nueva_moneda.update(article_params)
			redirect_to @nueva_moneda
		else
			render :edit
		end
	end

	#STRONG_PARAM

	private

	def coin_params
		params.require(:coin).permit(:nombre)
	end


	def set_coin
		@nueva_moneda = Coin.find(params[:id])
end
end