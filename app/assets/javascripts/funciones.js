$(document).ready(function(){

	var botones = $('.imagenCrypto');
	var seleccion = false;
	var moneda_actual;

	botones.on("click",function(){
		if ( seleccion ){
			moneda_actual.css({
				"background": "none"
			});
			var nombreMoneda = $(this).attr("alt");
			if ( nombreMoneda == moneda_actual.attr("alt") ){
				seleccion = false;
				$("#campoMoneda").val("");
			}
			else{
				moneda_actual = $(this);
				$("#campoMoneda").val(nombreMoneda);
				$(this).css({
				"background": "yellow" 
				});
			}
		}
		else{
			var nombreMoneda = $(this).attr("alt");
			moneda_actual = $(this);
			seleccion = true;
			$("#campoMoneda").val(nombreMoneda);
			$(this).css({
			"background": "yellow" 
			});
		}	
	});
})
