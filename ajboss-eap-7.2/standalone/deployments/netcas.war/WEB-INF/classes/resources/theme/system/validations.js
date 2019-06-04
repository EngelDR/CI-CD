function validaPassword() {
		var text = "";
		var ucase = new RegExp("[A-Z]+");
		var lcase = new RegExp("[a-z]+");
		var num = new RegExp("[0-9]+");
		var activar = true;
		//agregar validacion de palabras comunes
		if ($("#password1").val().length < 8) {
			text = text + ", 8 Caracteres";
		}
		if (!ucase.test($("#password1").val())) {
			text = text + ", una letra mayúscula";
		}
		if (!lcase.test($("#password1").val())) {
			text = text + ", una letra minúscula";
		}
		if (!num.test($("#password1").val())) {
			text = text + ", un caracter númerico";
		}
		if ($("#password1").val().includes(" ")){
			text = 1;
			$("#msj1").html("La contraseña no debe tener espacios en blanco.");
		}
		if ($("#password1").val() == $("#userSession").val()) {
			text = 1;
			$("#msj1").html("La contraseña no puede ser igual al nombre del usuario.");
		}
		
		return text;
	};

	function validationPasswordBack(result){
		console.log("Entro a las validaciones back " + result);
		var text = "";
		if (result == 2) {
			text = 1;
			$("#msj1").html("La contraseña no debe tener espacios en blanco.");
		}
		if (result == 3) {
			text = text + ", 8 Caracteres";
		}
		if (result == 4) {
			text = text + ", una letra mayúscula";
		}
		if (result == 5) {
			text = text + ", una letra minúscula";
		}
		if (result == 6) {
			text = text + ", un caracter númerico";
		}
		if (result == 7) {
			text = 1;
			$("#msj1").html("Esta contraseña no puede tener palabras comunes.");
		}
		if (result == 8) {
			text = 1;
			$("#msj1").html("La contraseña no puede ser igual al nombre del usuario.");
		}
		if (result == 9) {
			text = 1;
			$("#msj1").html("Esta contraseña ya habia sido utilizada con anterioridad.");
		}
		$("#password1").focus();
		if(text!=1){
			$("#msj1").html("Su contraseña no cumple con almenos" +text+".");
		}
	}
	
	function passwordMatch() {
		var text = "";
		if ($("#password1").val() != $("#password2").val()) {
			text = "Las contraseñas no coinciden.";
		}
		return text;
	}