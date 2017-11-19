desc "Premio de los ganadores"
task :reseteo => :environment do
	offset = rand(Coin.count)
	# Seleciona la moneda ganadora
	ganadora = Coin.offset(offset).first.id
	resultado = Result.new(:coin => Coin.offset(offset).first, :fecha => Time.now.strftime("%R"))
	resultado.save
	#Ganadora es la moneda ganadora
	lista = Bet.where(coin_id: ganadora).load
	for i in(lista)
    	premio = i.cantidad * 25
    	i.user.update(:saldo => premio + i.user.saldo)
	end
	Bet.delete_all
end




