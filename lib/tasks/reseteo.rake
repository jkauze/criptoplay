desc "Premio de los ganadores"
task :reseteo => :environment do
	#puts Coin.all
	offset = rand(Coin.count)
	# Seleciona la moneda ganadora
	ganadora = Coin.offset(offset).first.id
	puts ganadora
	# Ganadora es la moneda ganadora
	lista = Bet.where(coin_id: ganadora).load
	#puts lista
	for i in(lista)
    	puts i
    	puts "hola"
	end
end




