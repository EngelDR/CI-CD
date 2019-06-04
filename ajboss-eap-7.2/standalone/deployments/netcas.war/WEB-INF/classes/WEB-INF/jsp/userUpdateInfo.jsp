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
							NetCAS
						</div>
					</h1>
				</div>
			</div>
		</div>

		<div class='row'>
			<div class='col-lg-12'>
				<form id="formUserUpdateInfo">
					<fieldset class='text-center'>
						<legend> <spring:message code="name.system.description" /> </legend>
						<p id="encabezado"></p>
						<div class="form-group text-left">
							<label for="Correo" class="control-label" style=""><spring:message code="language.tags.0010"/>:</label>
							<input type="email" class="form-control" id="Correo" value="${MiArreglo[4]}" placeholder='<spring:message code="language.tags.0010"/>'  maxlength="40" required oninvalid="setCustomValidity('<spring:message code="language.tags.0011"/>')" oninput="setCustomValidity('')">
						</div>
						<div class="form-group text-left">
							<label for="Tel" class="control-label"><spring:message code="language.tags.0028.10"/>:</label>
							<input type="text" pattern="\d*" class="form-control" id="Tel" value="${MiArreglo[5]}" maxlength="10" placeholder='<spring:message code="language.tags.0028.11"/>' required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.12"/>')" oninput="setCustomValidity('')">
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
			$("#Correo").focus();
			$("#encabezado").html("Información necesaria para su perfil");
		});

		$("#formUserUpdateInfo").submit(function(e) {		
			e.preventDefault();
			fActualizarInfo();
		});

	    function fActualizarInfo(){
	        var sMessage, sSuccess, sWarning, sError, sErrorError, sUrl, dData;
	        var idUser		=	'${MiArreglo[0]}';
	        var nombre		=	'${MiArreglo[1]}'; 
	        var apellidoP	=	'${MiArreglo[2]}'; 
 	        var apellidoM	=	'${MiArreglo[3]}'; 
	        var correo 		= 	 $("#Correo").val();
			var celular 	= 	 $("#Tel").val();
	        sMessage 	= '<spring:message code="language.tags.0037.27"/>';
		    sUrl 		= '${pageContext.request.contextPath}/userUpdateInfoOne.htm';
		    dData 		= {idUser:idUser, nombre:nombre, apellidoP:apellidoP, apellidoM:apellidoM, correo:correo, celular:celular};
		    sSuccess 	= '<spring:message code="language.tags.0029.13"/>';
		    sWarning 	= '<spring:message code="language.tags.0037.24"/>';
		    sError 		= '<spring:message code="language.tags.0037.28"/>';
		    sErrorError = '<spring:message code="language.tags.0037.29"/>';
			bootbox.confirm({
				message:sMessage,
				buttons : {
					cancel : {
						label : '<spring:message code="language.tags.0029.11"/>',
						className : 'btn btn-secondary'
					},
					confirm : {
						label : '<spring:message code="language.tags.0029.10"/>',
						className : 'btn btn-primary'
					}
				},
				callback : function(result) {
					if (result == true) {
						$.blockUI({message: '<span class="spinner"/>',
				 			css: {border:'none', backgroundColor:'transparent'}
						});
						$.ajax({
				        	url: sUrl,
				           	type: 'POST',
				           	data: dData,
				           	timeout: 15000,
							success: function (json) {
					      		var respuesta = json;
				    	   		if(respuesta == 1){
				       				toastr.success(sSuccess); 	
				               	} else if(respuesta == 2) {
									toastr.warning(sWarning);
								} else {
									toastr.error(sError);
								} 
				          		$.unblockUI();
							},
					   		error: function(jqXHR, textStatus, errorThrown) {   
						  		$.unblockUI();
								if(textStatus === "timeout") {
									toastr.error('<spring:message code="language.tags.0029.17"/>');                        
								} else {
									toastr.error(sErrorError +' <spring:message code="language.tags.0029.18"/>');
								}
							}
						});
					} else {
						$.unblockUI();
					}
				}
			});	 
	    }
	</script>

</body>
</html>
