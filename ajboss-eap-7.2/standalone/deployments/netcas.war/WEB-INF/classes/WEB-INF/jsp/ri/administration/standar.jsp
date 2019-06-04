<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h3 class=n-titles><spring:message code="language.tags.0039.02.01"/></h3>
      	<table class='table table-striped table-bordered table-hover table-full-width small' id="tblCommands">
			<thead>
				<tr>
					<th width="10%"><spring:message code="language.tags.0029.02"/></th>
					<th width="25%"><spring:message code="language.tags.0029.03"/></th>
					<th width="25%"><spring:message code="language.tags.0038.02"/></th>
					<th width="20%"><spring:message code="language.tags.0038.01.09"/></th>
					<th width="10%"><spring:message code="language.tags.0037.05"/></th>
					<th width="10%"><spring:message code="language.tags.0037.07"/></th>
				</tr>
			</thead>
		</table>
		<div class="modal-footer">
			<sec:authorize access="hasAuthority('${applicationScope.rol_Administrador}')">
				<button id="btnNewCommand" class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> <spring:message code="language.tags.0038.02.02"/>
				</button>
			</sec:authorize>
		</div>
		
		<!--  start: MODAL ALTA || EDITAR & ELIMINAR COMANDO -->
		<div class="modal fade" id="modalCommands" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<a href=""                                 class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitle"><spring:message code="language.tags.0038.02.03"/></h4>
					</div>
					<form class="formCommands" id="formCommands">
						<div class="modal-body">
							<div class="form-content">
								<div class="form-group">
									<div class="row">
										<div class="form-group col-sm-6">
											<input type="hidden" id="idCommand">
											<label for="Nombre" class="control-label"><spring:message code="language.tags.0029.02"/>:</label>
											<input type="text" class="form-control" id="Nombre" pattern="[A-z]{1,15}" 
											placeholder='<spring:message code="language.tags.0038.02.04"/>' maxlength="15" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0038.02.05"/>")' oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="Descripcion" class="control-label"><spring:message code="language.tags.0029.03"/>:</label>
											<input type="text" class="form-control" id="Descripcion" 
											placeholder='<spring:message code="language.tags.0029.03"/>' maxlength="40" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0038.02.06"/>")' oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="txtCommand" class="control-label"><spring:message code="language.tags.0038.02"/>:</label>
											<input type="text" class="form-control" id="txtCommand" pattern="[A-z]{1,15}" 
											placeholder='<spring:message code="language.tags.0038.02"/>' maxlength="40" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0038.02.07"/>")' oninput="setCustomValidity('')">
										</div>
										<div class="form-group col-sm-6">
											<label for="SelectTipo" class="control-label"><spring:message code="language.tags.0038.01.09"/>:</label> 
											<select class="form-control" id="SelectTipo" 
											data-placeholder='<spring:message code="language.tags.0038.01.34"/>' class="form-control chosen-select" required 
											oninvalid='setCustomValidity("<spring:message code="language.tags.0038.01.35"/>")' oninput="setCustomValidity('')"></select> 
						 				</div>
										<div class="form-group col-sm-12">
											<label for="SelectEstatus" class="control-label"><spring:message code="language.tags.0037.05"/>:</label> 
						 					<select class="form-control" id="SelectEstatus" 
						 					data-placeholder='<spring:message code="language.tags.0037.14"/>' class="form-control chosen-select" required 
						 					oninvalid='setCustomValidity("<spring:message code="language.tags.0037.15"/>")' oninput="setCustomValidity('')"></select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div id="newButtons">
								<button onclick="mCommand('new');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/> </button>
							</div>
							<div id="editButtons">
								<button onclick="mCommand('delete');" class="btn btn-secondary"> <span class="glyphicon glyphicon-remove"></span> <spring:message code="language.tags.0037.20"/> </button>
								<button onclick="mCommand('edit');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/> </button>
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
	
	var Role = 'AdminRi';
	$(document).ready(function() {
		$.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		loadSelects();
		$('#tblCommands').DataTable({
			"columns" : [	 
						 {className : "dt-body-center","width" : "10%", orderable : true},
			             {className : "dt-body-center","width" : "25%", orderable : true},
			             {className : "dt-body-center","width" : "25%", orderable : true},
			             {className : "dt-body-center","width" : "20%", orderable : true},
			             {className : "dt-body-center","width" : "10%", orderable : false},
			             {className : "dt-body-center","width" : "10%", orderable : false},
						],
			    "aaSorting": [[ 3, "asc" ],[ 0, "asc" ]],
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
					"sEmptyTable" : '<spring:message code="language.tags.0029.23"/>',
					"sSearch" : '<spring:message code="language.tags.0029.12"/>',
					"sLengthMenu" : '<spring:message code="language.tags.0029.21"/>',
					"sZeroRecords": '<spring:message code="language.tags.0029.22"/>'
				}
	    }).ajax.url('${pageContext.request.contextPath}/command/getAll?Role='+Role).load().on( 'draw.dt', function (){ $.unblockUI();});

		if (gbPlatformNode) {gsTable = $('#tblCommands');	gsEntity = '<spring:message code="language.tags.0038.02.08"/>';}
		
	    $("#btnNewCommand").click(function(e){
	    	gsPanel = $(this).attr("id");
			formPlataformaCmd();
			gbPlatformNode = true;		gsTable = $('#tblCommands');	gsEntity = '<spring:message code="language.tags.0038.02.08"/>';
			if ('btnNewCommand' == gsPanel ) { $("#modalCommands").modal('show'); }
		});
	});
	
	$("#formCommands").submit(function(e) {			
		e.preventDefault();
		AccionesARealizar();
	});
	
    function mCommand(psButton){
    	if ('new' == psButton) { giAction = 10; } 
    	else if ('delete' == psButton) { giAction = 12; } 
    	else if ('edit' == psButton) { giAction = 11; }
    }
    
    function AccionesARealizar(){
        var sMessage, sSuccess, sWarning, sError, sErrorError, sUrl, dData;
		var id = $("#idCommand").val();
		var nombre = $("#Nombre").val();
		var descripcion = $("#Descripcion").val();
		var command = $("#txtCommand").val();
		var SelectTipo = $("#SelectTipo").val();
		var selectEstatus = $("#SelectEstatus").val();
		
		switch (giAction) {
		    case 10:
		    	sMessage = '<spring:message code="language.tags.0038.02.09"/>';
			    sUrl = '${pageContext.request.contextPath}/command/save';
			    dData = {nombre:nombre, descripcion:descripcion, command:command, selectTipo:SelectTipo, selectEstatus:selectEstatus};
			    sSuccess = '<spring:message code="language.tags.0037.23"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0038.02.10"/>';
			    sError = '<spring:message code="language.tags.0037.25"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.26"/> ' + gsEntity;
		        break;
		    case 11:
		        sMessage = '<spring:message code="language.tags.0038.02.11"/>';
			    sUrl = '${pageContext.request.contextPath}/command/update';
			    dData = {id:id, nombre:nombre, descripcion:descripcion, command:command, selectTipo:SelectTipo, selectEstatus:selectEstatus};
			    sSuccess = '<spring:message code="language.tags.0029.13"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0038.02.10"/>';
			    sError = '<spring:message code="language.tags.0037.28"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.29"/> ' + gsEntity;
		        break;
		    case 12:
		        sMessage = '<spring:message code="language.tags.0038.02.12"/>';
			    sUrl = '${pageContext.request.contextPath}/command/delete';
			    dData = {id:id, nombre:nombre};
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
			                    $("#modalCommands").modal('hide');
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

    function editCommand(pidCommand) {
    	if (pidCommand !== '') {
            var sUrl;
                sUrl = "${pageContext.request.contextPath}/command/getOne?pidCommand=" + pidCommand;
            
            $.blockUI({message: '<span class="spinner"/>',
     			css: {border:'none', backgroundColor:'transparent'}
            });
            $.ajax({
                type : "POST",
                url : sUrl,
                success : function(data) {
                    if (data != true) {
                    		formPlataformaCmd();
							$("#idCommand")			.val(data.id);
							$("#Nombre")			.val(data.nombre);
							$("#Descripcion")		.val(data.descripcion);
							$("#txtCommand")		.val(data.comando);
							$("#SelectTipo")		.val(data.id_c01tipo);
							$("#SelectEstatus")		.val(data.id_cestatus);
							$("#modalCommands")		.modal('show');
	                        $("#newButtons")		.hide();
	                        $("#editButtons")		.show();
                    }
                    $.unblockUI();
                }
            });
        } else {
            toastr.error('<spring:message code="language.tags.0038.01.51"/> ' + gsEntity + ' <spring:message code="language.tags.0038.01.52"/>');
        }
    }

	function formPlataformaCmd() {
        document.getElementById("allTitle").innerHTML = '<spring:message code="language.tags.0038.02.03"/>';
		$("#idCommand")			.val('');
		$("#Nombre")			.val('');
		$("#Descripcion")		.val('');
		$("#txtCommand")		.val('');
		$("#SelectTipo")		.val('');
		$("#SelectEstatus")		.val('');
        $("#newButtons")		.show();
        $("#editButtons")		.hide();
    }
	
    function loadSelects() {
        $.ajaxSetup({ cache : false });
        var options = $("#SelectTipo");
        $.ajax({
			type : 'GET',
			url: '${pageContext.request.contextPath}/consult/getJSONListC01Tipo',
			dataType : 'json',
			success : function(result) {
		    	arrayTipes = result;
		    	console.log("result >>>> " + result);
				options.append($("<option />").val('').text('<spring:message code="language.tags.0038.01.34"/>'));
				$.each(result, function(key, value) {
		    	    options.append('<option value="'+value.id+'">'+value.nombre+'</option>' );
					});
				$('#SelectTipo').trigger('chosen:updated');
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
            var idUso = 3;
            var options = $("#SelectEstatus");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONCEstatus?idUso=c04comando",
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
	}
	
</script>