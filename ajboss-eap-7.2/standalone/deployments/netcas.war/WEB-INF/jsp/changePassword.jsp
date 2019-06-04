<%@ include file="/WEB-INF/include.jsp"%>
<!DOCTYPE html>
<html class='no-js' lang='en'>
<head>

<title>NetCAS</title>

<meta charset='utf-8'>
<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
<link rel="shortcut icon" href="<c:url value="/resources/theme/img/telcel.ico" />" />
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/toastr/toastr.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/bootstrap-3.3.7/css/bootstrapValidator.min.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/particles.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/css/login.css" />">
<link rel="stylesheet" media="screen" href="<c:url value="/resources/theme/lib/font-awesome-4.7.0/css/font-awesome.min.css" />" />

</head>
<body class='login'>
	<div class='wrapper'>
		<div class='row'>
			<div class='col-lg-12'>
				<div class='brand text-center'>
					<h1>
						<div class="logo-icon">
							<i class='fa fa-rebel'></i>
						</div>
						NetCAS
					</h1>
				</div>
			</div>
		</div>

		<div class='row'>
			<div class='col-lg-12'>
				<form id="passwordForm">
					<fieldset class='text-center'>
						<p id="encabezado"></p>
						<div class='form-group'>
							<input class="form-control" id="password1" placeholder="Nueva contraseña" type='password'>
						</div>
						<div>
							<FONT SIZE="1"><label style="text-align: left; color: #C0392B; line-height: 10pt;"id="msj1"></label></FONT>
						</div>
						<div class='form-group'>
							<input class='form-control' id='password2' placeholder='Repita su contraseña' type='password'>
						</div>
						<div class='text-left'>
							<FONT SIZE="1"><label style="color: #C0392B; line-height: 10pt;" id="msj2"></label></FONT>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="reset" onclick="location.href = '${pageContext.request.contextPath}/logout.htm';" value="Cancelar" id='cancelButton' class="btn btn-secondary"><br>
							</div>
							<div style="text-align: right; margin-right: 17px;">
								<input type="submit" value="Guardar cambios" id='changeButton' class="btn btn-default"><br>
						</div>
						</div>
					</fieldset>
				</form>
				<div class='text-center'>
					<a id="iniciarSesion" href='${pageContext.request.contextPath}/logout.htm' hidden="hidden">Iniciar sesion</a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="particles-js"></div>

	<!-- Scripts -->
	<script src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery.blockUI.js" />"></script>
	<script src="<c:url value="/resources/theme/js/particles.min.js" />"></script>
	<script src="<c:url value="/resources/theme/js/modernizr.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrapValidator.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootbox.min.js" />"></script>
	<script src="<c:url value="/resources/theme/lib/toastr/toastr.min.js" />"></script>
	
	<!-- File Validations JS -->
	<script src="<c:url value="/resources/theme/system/validations.js" />"></script>
	
	<script>
		$(document).ready(function() {
			document.oncontextmenu = function(){return false}
			$("#password1").focus();
			if("${firstAccess}"!=""){
				$("#encabezado").html("Esta ingresando por primera vez. Para continuar debe cambiar su contraseña.");
			}else{
				$("#encabezado").html("Use el siguiente formulario para cambiar su contraseña.");
			}
		});

		$("#passwordForm").submit(function(e) {		
			e.preventDefault();			
			$("#msj2").html("");
			$("#msj1").html("");				
			var mensaje1 = validaPassword();
			if (mensaje1.length == 0) {
				var mensaje2 = passwordMatch();
				if (mensaje2.length == 0) {
					$.blockUI({
						message: '<span class="spinner"/>',
			 			css: {border:'none', backgroundColor:'transparent'}
					});
					var newpassword = $("#password2").val();
					var id = "${id}";
					var recoveryKey = "${recoveryKey}";
					sendPassword(id,newpassword, recoveryKey);
				} else {
					$("#msj2").html(mensaje2);
					$("#password1").focus();
				}
			} else {
				$("#password1").focus();
				if(mensaje1 != 1){
				$("#msj1").html("Su contraseña no cumple con almenos" +mensaje1+".");
				}
			}
		});


		function sendPassword(id, newpassword, recoveryKey) {
			$.ajaxSetup({
				cache : false
			});	
			$.ajax({
					url : '${pageContext.request.contextPath}/restore/changePass',
					type : 'POST',
					data : {
						id : id,
						newpassword : newpassword,
						recoveryKey: recoveryKey
					},
					success : function(json) {
						if (json == 1) {
							toastr.success('Su contraseña ha sido cambiada.');
							$("#changeButton").prop("disabled", true);
							$("#password2").prop("disabled", true);
							$("#password1").prop("disabled", true);
							$("#iniciarSesion").show();
						} else {
							toastr
									.error('Ha ocurrido un error. Favor de intentar más tarde.');
								var val = json;
								validationPasswordBack(val);
							
						}
						$.unblockUI();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						if (textStatus === "timeout") {
							toastr
									.error('Error... tiempo de consulta ha excedido. Favor de intentar más tarde.');
						} else {
							toastr
									.error('Ha ocurrido un error. Favor de intentar más tarde.');
						}
						$.unblockUI();
					}
				});
			;
		}

	</script>

</body>
</html>
