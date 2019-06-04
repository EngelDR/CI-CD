<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h3 class=n-titles><spring:message code="language.tags.0037.01"/></h3>
      	<table class='table table-striped table-bordered table-hover table-full-width small' id="tblUser">
			<thead>
				<tr>
					<th width="20%"><spring:message code="language.tags.0029.02"/></th>
					<th width="10%"><spring:message code="language.tags.0028.07"/></th>
					<th width="20%"><spring:message code="language.tags.0037.02"/></th>
					<th width="10%"><spring:message code="language.tags.0037.03"/></th>
					<th width="10%"><spring:message code="language.tags.0037.04"/></th>
					<th width="10%"><spring:message code="language.tags.0037.05"/></th>
					<th width="10%"><spring:message code="language.tags.0037.06"/></th>
					<th width="10%"><spring:message code="language.tags.0037.07"/></th>
				</tr>
			</thead>
		</table>
		<div class="modal-footer">
			<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
				<button id="btnNuevoUsuario" class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> <spring:message code="language.tags.0037.08"/>
				</button>
			</sec:authorize>
		</div>
		
		<!--  start: MODAL ALTA || EDITAR & ELIMINAR USUARIO -->
		<div class="modal fade" id="modalUsuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<a href=""                                 class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitle"><spring:message code="language.tags.0037.09"/></h4>
					</div>
					<form class="formUsers" id="formUsers">
						<div class="modal-body">
							<div class="form-content">
								<div class="form-group">
									<div class="row">
										<div class="form-group col-sm-6">
											<input type="hidden" id="idUser">
											<label for="Nombre" class="control-label"><spring:message code="language.tags.0029.02"/>:</label>
											<input type="text" class="form-control" id="Nombre" pattern="[A-z]{1,15}" placeholder="<spring:message code="language.tags.0028.01"/>" maxlength="15" required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.10"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="ApellidoP" class="control-label"><spring:message code="language.tags.0028.03"/>:</label>
											<input type="text" class="form-control" id="ApellidoP" pattern="[A-z]{1,15}" placeholder='<spring:message code="language.tags.0028.03"/>' maxlength="12" required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.11"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="ApellidoM" class="control-label"><spring:message code="language.tags.0028.05"/>:</label>
											<input type="text" class="form-control" id="ApellidoM" pattern="[A-z]{1,15}" placeholder='<spring:message code="language.tags.0028.05"/>' maxlength="12" required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.12"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="Correo" class="control-label"><spring:message code="language.tags.0010"/>:</label>
											<input type="email" class="form-control" id="Correo" placeholder='<spring:message code="language.tags.0010"/>'  maxlength="40" required oninvalid="setCustomValidity('<spring:message code="language.tags.0011"/>')" oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="User" class="control-label"><spring:message code="language.tags.0028.07"/>:</label>
											<input type="text" class="form-control" id="User" placeholder='<spring:message code="language.tags.0028.08"/>' maxlength="10" required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.13"/>')" oninput="setCustomValidity('')">
										</div>		
										<div class="form-group col-sm-6">
											<label for="Tel" class="control-label"><spring:message code="language.tags.0028.10"/>:</label>
											<input type="text" pattern="\d*" class="form-control" id="Tel" maxlength="10" placeholder='<spring:message code="language.tags.0028.11"/>' required oninvalid="setCustomValidity('<spring:message code="language.tags.0028.12"/>')" oninput="setCustomValidity('')">
										</div>							            
										<div class="form-group col-sm-6" id="status">
												<label for="SelectEstatus" class="control-label"><spring:message code="language.tags.0037.05"/>:</label> 
							 					<select id="SelectEstatus" data-placeholder='<spring:message code="language.tags.0037.14"/>' class="form-control chosen-select"  oninvalid="setCustomValidity('<spring:message code="language.tags.0037.15"/>')" oninput="setCustomValidity('')"></select> 
										</div>
										<div class="form-group col-sm-6 required">
											<label for="SelectProfile" class="control-label"><spring:message code="language.tags.0037.04"/>:</label> 
											<select id="SelectProfile"    data-placeholder='<spring:message code="language.tags.0037.16"/>' class="form-control chosen-select"   required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.17"/>')"    oninput="setCustomValidity('')"></select> 
										</div>
										<div class="form-group col-sm-6 required">
											<label for="SelectFlow" class="control-label"><spring:message code="language.tags.0037.06"/>:</label> 
											<select id="SelectFlow" data-placeholder='<spring:message code="language.tags.0037.18"/>' class="form-control chosen-select"   required oninvalid="setCustomValidity('<spring:message code="language.tags.0037.19"/>')"    oninput="setCustomValidity('')"></select> 
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div id="newButtons">
								<button onclick="mUsuario('new');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/> </button>
							</div>
							<div id="editButtons">
								<button onclick="mUsuario('delete');" class="btn btn-secondary"> <span class="glyphicon glyphicon-remove"></span> <spring:message code="language.tags.0037.20"/> </button>
								<button onclick="mUsuario('edit');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/> </button>
							</div>	
						</div>		
					</form>
				</div>
			</div>			
		</div>		<!-- end: MODAL ALTA || EDITAR & ELIMINAR USUARIO -->
	</tiles:putAttribute>
</tiles:insertDefinition>

<script>
	// TRUE = Platforms		FALSE = Node
	var gbPlatformNode = true;
	var gsTable, gsPanel, gsEntity;
	var giAction = 0;
	var tblUser = $('#tblUser');
	
	
	$(document).ready(function() {
	   $.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		$("[name='Administrator']").bootstrapSwitch();
		profilesLoad();
	
		tblUser.DataTable({
			"columns" : [{className : "dt-body-center","width" : "15%", orderable : true},
				         {className : "dt-body-center","width" : "5%",  orderable : true },
				         {className : "dt-body-center","width" : "15%", orderable : true },
				         {className : "dt-body-center","width" : "10%", orderable : true },
				         {className : "dt-body-center","width" : "20%", orderable : true },
				         {className : "dt-body-center","width" : "5%", orderable : true },
				         {className : "dt-body-center","width" : "25%", orderable : true },
				         {className : "dt-body-center","width" : "5%",  orderable : false}],
			 	"aaSorting": [[ 5, "asc" ], [ 0, "asc" ]],
	    		"bAutoWidth" : true,
				"info" : false,
				"retrieve" : true,
				"bFilter" : true,
				"bLengthChange" : false,
				"oLanguage" : {
					"oPaginate" : {
						"sPrevious" : "<i class='fa fa-arrow-left'></i>",
						"sNext" : "<i class='fa fa-arrow-right'></i>"
					},
					"sEmptyTable" : '<spring:message code="language.tags.0029.20"/>',
					"sSearch" : '<spring:message code="language.tags.0029.12"/>',
					"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
					"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
				}
		 
	    }).ajax.url('${pageContext.request.contextPath}/users/getAll').load().on( 'draw.dt', function (){ $.unblockUI(); });

		if (gbPlatformNode) {gsTable = $('#tblUser');	gsEntity = '<spring:message code="language.tags.0037.21"/>';}
		
	    $("#btnNuevoUsuario").click(function(e){
	    	gsPanel = $(this).attr("id");
			formPlataforma();
			$("#status").hide();
			gbPlatformNode = true;		gsTable = $('#tblUser');	gsEntity = '<spring:message code="language.tags.0037.21"/>';
			if ('btnNuevoUsuario' == gsPanel ) { $("#modalUsuario").modal('show'); }
		});	  
	  changeWidthModalChossenSelect();//Forsozo para modal que contengan select
	});
	
	$("#formUsers").submit(function(e) {			
		e.preventDefault();
		AccionesARealizar();
	});
	
    function mUsuario(psButton){
    	if ('new' == psButton) { giAction = 10; } 
    	else if ('delete' == psButton) { giAction = 12; } 
    	else if ('edit' == psButton) { giAction = 11; }
    }
    
    function AccionesARealizar(){
        var sMessage, sSuccess, sWarning, sError, sErrorError, sUrl, dData;
		var idUser = $("#idUser").val();
		var nombre = $("#Nombre").val();
		var apellidoP = $("#ApellidoP").val();
		var apellidoM = $("#ApellidoM").val();
		var user = $("#User").val();
		var correo = $("#Correo").val();
		var celular = $("#Tel").val();
		var selectEstatus = $("#SelectEstatus").val();
		var selectProfile = $("#SelectProfile").val();
		var selectFlow = $("#SelectFlow").val();
        
		switch (giAction) {
		    case 10:
		        sMessage = '<spring:message code="language.tags.0037.22"/>';
			    sUrl = '${pageContext.request.contextPath}/users/save';
			    dData = {nombre:nombre, apellidoP:apellidoP, apellidoM:apellidoM, user:user, correo:correo, celular:celular, selectProfile:selectProfile, selectFlow:selectFlow};
			    sSuccess = '<spring:message code="language.tags.0037.23"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0037.24"/>';
			    sError = '<spring:message code="language.tags.0037.25"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.26"/> ' + gsEntity;
		        break;
		    case 11:
		        sMessage = '<spring:message code="language.tags.0037.27"/>';
			    sUrl = '${pageContext.request.contextPath}/users/update';
			    dData = {idUser:idUser, nombre:nombre, apellidoP:apellidoP, apellidoM:apellidoM, user:user, correo:correo, celular:celular, selectEstatus:selectEstatus, selectProfile:selectProfile, selectFlow:selectFlow};
			    sSuccess = '<spring:message code="language.tags.0029.13"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0037.24"/>';
			    sError = '<spring:message code="language.tags.0037.28"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.29"/> ' + gsEntity;
		        break;
		    case 12:
		        sMessage = '<spring:message code="language.tags.0037.30"/>';
			    sUrl = '${pageContext.request.contextPath}/users/delete';
			    dData = {idUser:idUser, nombre:nombre, apellidoP:apellidoP, apellidoM:apellidoM};
			    sSuccess = '<spring:message code="language.tags.0037.31"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0037.32"/> ' + gsEntity;
			    sError = '<spring:message code="language.tags.0037.33"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.34"/> ' + gsEntity;
		        break;
		}
	    
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
//					        		$.unblockUI();	     
				      		var respuesta = json;
			    	   		if(respuesta == 1){
			       				toastr.success(sSuccess); 	
			       				gsTable.DataTable().ajax.reload();
			                    $("#modalUsuario").modal('hide');
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

    function editUser(pidUsuario) {
    	if (pidUsuario !== '') {
            var sUrl;
                sUrl = "${pageContext.request.contextPath}/users/getOne?idUser=" + pidUsuario;
            
            $.blockUI({message: '<span class="spinner"/>',
     			css: {border:'none', backgroundColor:'transparent'}
            });
            $.ajax({
                type : "POST",
                url : sUrl,
                success : function(data) {
                    if (data != true) {
                    		formPlataforma();
							$("#idUser")			.val(data.id);
							$("#Nombre")			.val(data.nombre);
							$("#ApellidoP")			.val(data.a_paterno);
							$("#ApellidoM")			.val(data.a_materno);
							$("#User")				.val(data.usuario);
							$("#Correo")			.val(data.correo);
							$("#Tel")				.val(data.telefono);
							$("#SelectEstatus")		.val(data.id_cestatus);
							$("#SelectProfile")		.val(data.id_cperfil);
							$("#SelectFlow")		.val(data.id_c00flujo);
	                        $("#modalUsuario")		.modal('show');
	                        $("#newButtons")		.hide();
	                        $("#editButtons")		.show();
	                        $("#status").show();
                    }
                    $('select').trigger("chosen:updated");
                    $.unblockUI();
                }
            });
        } else {
            toastr.error('<spring:message code="language.tags.0029.19"/>');
        }
    }

	function formPlataforma() {
        document.getElementById("allTitle").innerHTML = '<spring:message code="language.tags.0037.09"/>';
		$("#idUser")		.val('');
		$("#Nombre")		.val('');
		$("#ApellidoP")		.val('');
		$("#ApellidoM")		.val('');
		$("#User")			.val('');
		$("#Correo")		.val('');
		$("#Tel")			.val('');
		$("#SelectProfile")	.val('');
		$("#SelectFlow")	.val('');
        $("#newButtons")	.show();
        $("#editButtons")	.hide();
    	$('select').trigger("chosen:updated");
    }
	
    function profilesLoad() {
        $.ajaxSetup({ cache : false });
        var options = $("#SelectProfile");
        $.ajax({
			type : 'GET',
			dataType : 'json',
			url : "${pageContext.request.contextPath}/consult/getJSONCPerfil",
			beforeSend : function() { },
			success : function(result) {
				options.empty();
				options.append($("<option />").val('').text('<spring:message code="language.tags.0037.16"/>'));
				$.each(result, function(key, value) {
					options.append($("<option />").val(key).text(value));
				});
				$('#SelectProfile').trigger('chosen:updated');
			},
			error : function(xhr) { // if error occured
				alert('<spring:message code="language.tags.0037.35"/>');
				alert(xhr.statusText + xhr.responseText);
			},
			complete : function() { },
		});
        
      	//Función que carga el estatus
        statusLoad();
        function statusLoad() {
            $.ajaxSetup({ cache : false });
            var idUso = 2;
            var options = $("#SelectEstatus");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONCEstatus?idUso=tusuario",
				data : { idUso : idUso  },
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0037.14"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#SelectEstatus').trigger('chosen:updated');
				},
				error : function(xhr) { // if error occured
					alert('<spring:message code="language.tags.0037.35"/>');
					alert(xhr.statusText + xhr.responseText);
				},
				complete : function() { },
			});
        }
        
        //Función que carga los Flujos
        flowLoad();
        function flowLoad() {
            $.ajaxSetup({ cache : false });
            var options = $("#SelectFlow");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONC00Flujo",
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0037.18"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#SelectFlow').trigger('chosen:updated');
				},
				error : function(xhr) { // if error occured
					alert('<spring:message code="language.tags.0037.35"/>');
					alert(xhr.statusText + xhr.responseText);
				},
				complete : function() { },
			});
        }
        
	}
	
</script>