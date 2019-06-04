<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
<tiles:putAttribute name="body">                 
				<!-- start: DYNAMIC TABLE PANEL -->
				<div class="panel panel-white">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" id="p1" class="active"><a href="#tabla1" aria-controls="tabla1" role="tab" data-toggle="tab"><spring:message code="language.tags.0038.01.01"/></a></li>
						<li style="color: #148f77"role="presentation" id="p2"><a href="#tabla2" aria-controls="tabla2" role="tab" data-toggle="tab"><spring:message code="language.tags.0038.01.02"/></a></li>
					</ul>
					<br>
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- TABLA 1-->
						<div role="tabpanel" class="tab-pane active" id="tabla1">
							<table class='table table-striped table-bordered table-hover table-full-width small' id="tblplataform">
								<thead>
									<tr>                
										<th><spring:message code="language.tags.0029.02"/></th>
										<th><spring:message code="language.tags.0028.07"/></th>
										<th><spring:message code="language.tags.0038.01.03"/></th>
										<th><spring:message code="language.tags.0038.01.05"/></th>
										<th><spring:message code="language.tags.0038.01.08"/></th>
										<th><spring:message code="language.tags.0037.05"/></th>
										<th><spring:message code="language.tags.0038.01.04"/></th>
										<th><spring:message code="language.tags.0037.07"/></th>
									</tr>
								</thead>
							</table>
							<div class="modal-footer">
								<button id="newPlatform" class="btn btn-primary">
 									<span class="glyphicon glyphicon-plus"></span> <spring:message code="language.tags.0038.01.10"/>			<%-- Nueva Plataforma --%>
								</button>
							</div>
						</div>
						<!-- TABLA 2 -->
						<div role="tabpanel" class="tab-pane" id="tabla2">
							<table class='table table-striped table-bordered table-hover table-full-width small' id="tblNode">
								<thead>
									<tr>
										<th><spring:message code="language.tags.0038.01.06"/></th>
										<th><spring:message code="language.tags.0029.02"/></th>
										<th><spring:message code="language.tags.0038.01.03"/></th>
										<th><spring:message code="language.tags.0028.07"/></th>
										<th><spring:message code="language.tags.0037.05"/></th>
										<th><spring:message code="language.tags.0038.01"/></th>
										<th><spring:message code="language.tags.0038.01.11"/></th>
										<th><spring:message code="language.tags.0038.01.07"/></th>
										<th><spring:message code="language.tags.0037.07"/></th>										
									</tr>
								</thead>
							</table>
							<div class="modal-footer">
								<button id="newNode" class="btn btn-primary">
									<span class="glyphicon glyphicon-plus"></span> <spring:message code="language.tags.0038.01.12"/>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end: DYNAMIC TABLE PANEL -->

                
				<!--  start: MODAL NUEVA PLATAFORMA/NODE -->
				<div id="modalPlataformNode" class="modal fade">			
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
								<h4 class="modal-title" id="allTitle"><spring:message code="language.tags.0038.01.13"/></h4>
							</div>
							<form role="form" id="formPlatforms">
							<div class="modal-body">							
								<div class="form-content">
									<div class="form-group">
										<div class="row">
											<div >
												<input type="hidden" id="IdPlatformNode">
												<div class="form-group col-sm-6" id= "allNombres">
													<label for="Nombre" class="control-label"><spring:message code="language.tags.0029.02"/>:</label>
													<input type="text" class="form-control" id="Nombre" placeholder='<spring:message code="language.tags.0038.01.14"/>' maxlength="15" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.15"/>')" oninput="setCustomValidity('')">
												</div>
											</div>
											<div class="form-group col-sm-6" id= "allRegiones">
												<label for="selectRegion" class="control-label"><spring:message code="language.tags.0038.01.06"/>:</label>
												<select id="selectRegion" data-placeholder='<spring:message code="language.tags.0038.01.16"/>' class="form-control chosen-select" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.17"/>')" oninput="setCustomValidity('')"></select>											
											</div>
											<div class="form-group col-sm-6" id="allTipoNombres">
										    	<label for="TipoNombre" class="control-label"><spring:message code="language.tags.0038.01.54"/>:</label>
										    	<input type="text" class="form-control" id="TipoNombre" placeholder='<spring:message code="language.tags.0038.01.55"/>'  maxlength="50" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.19"/>')" oninput="setCustomValidity('')">
									   		</div>
											<div class="form-group col-sm-6" id="allTipoEquipos">
										    	<label for="TipoEquipo" class="control-label"><spring:message code="language.tags.0038.01.56"/>:</label>
										    	<input type="text" class="form-control" id="TipoEquipo" placeholder='<spring:message code="language.tags.0038.01.57"/>'  maxlength="50" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.19"/>')" oninput="setCustomValidity('')">
									   		</div>
											<div class="form-group col-sm-12" id="allTipoDescripciones">
										    	<label for="TipoDescripcion" class="control-label"><spring:message code="language.tags.0038.01.58"/>:</label>
										    	<input type="text" class="form-control" id="TipoDescripcion" placeholder='<spring:message code="language.tags.0038.01.59"/>'  maxlength="80" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.19"/>')" oninput="setCustomValidity('')">
									   		</div>
											<div class="form-group col-sm-6" id="allIP">
									        	<label for="IP" class="control-label"><spring:message code="language.tags.0038.01.03"/>:</label>
									            <input type="text" class="form-control" id="IP" placeholder='<spring:message code="language.tags.0038.01.20"/>' maxlength="20" pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$|NA" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.21"/>')" oninput="setCustomValidity('')">
											</div>
									      	<div class="form-group col-sm-6" id="allUsuarios">
										    	<label for="Usuario" class="control-label"><spring:message code="language.tags.0028.07"/>:</label>
										    	<input type="text" class="form-control" id="Usuario" placeholder='<spring:message code="language.tags.0038.01.23"/>' maxlength="40" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.24"/>')" oninput="setCustomValidity('')">
									   		</div>
											<div class="form-group col-sm-6"  id="allContrasenas">
												<label for="Contrasena" class="control-label"><spring:message code="language.tags.0028.09"/>:</label>
												<input type="password" class="form-control" id="Contrasena" placeholder='<spring:message code="language.tags.0038.01.25"/>'	maxlength="15" oninvalid="setCustomValidity('<spring:message code="language.tags.0007"/>')" oninput="setCustomValidity('')">
											</div>
											<div class="form-group col-sm-6" id="allPuerto">
										    	<label for="Puerto" class="control-label"><spring:message code="language.tags.0038.01.05"/>:</label>
										    	<input type="text" class="form-control" id="Puerto" placeholder='<spring:message code="language.tags.0038.01.26"/>' maxlength="2" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.27"/>')" oninput="setCustomValidity('')">
									   		</div>
											<div class="form-group col-sm-6" id="allConexiones">
												<label for="selectConexion" class="control-label"><spring:message code="language.tags.0038.01.07"/></label> 
												<select id="selectConexion" data-placeholder='<spring:message code="language.tags.0038.01.28"/>' class="form-control chosen-select" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.29"/>')" oninput="setCustomValidity('')"></select> 
											</div>
											<div class="form-group col-sm-6" id ="allPlataformas">
												<label for="selectPlataforma" class="control-label"><spring:message code="language.tags.0038.01"/>:</label> 
												<select id="selectPlataforma" data-placeholder='<spring:message code="language.tags.0038.01.30"/>' class="form-control chosen-select" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.31"/>')" oninput="setCustomValidity('')"></select> 
											</div>
											<div class="form-group col-sm-6" id="allPool">
									           	<label for="Pool"><spring:message code="language.tags.0038.01.11"/>:</label><br>
												<input id="Pool" type="checkbox" data-on-text="<i class='fa fa-check'>" data-off-text="<i class='fa fa-times'>"> 
											</div>
											<div class="form-group col-sm-6" id="allTecnologias">
												<label for="selectTecnologia" class="control-label"><spring:message code="language.tags.0038.01.08"/>:</label> 
												<select id="selectTecnologia" data-placeholder='<spring:message code="language.tags.0038.01.32"/>' class="form-control chosen-select" oninvalid="setCustomValidity('<spring:message code="language.tags.0038.01.33"/>')" oninput="setCustomValidity('')"></select> 
											</div>
											<div class="form-group col-sm-6" id="allselectEstatus">
												<label for="selectEstatus" class="control-label"><spring:message code="language.tags.0037.05"/>:</label> 
							 					<select id="selectEstatus" data-placeholder='<spring:message code="language.tags.0037.14"/>' class="form-control chosen-select"  oninvalid="setCustomValidity('<spring:message code="language.tags.0037.15"/>')" oninput="setCustomValidity('')"></select> 
											</div>
											<div class="form-group col-sm-6" id="allUrlXml">
												<label for="UrlXml" class="control-label"><spring:message code="language.tags.0038.01.36"/>:</label>
												<input type="text" class="form-control" id="UrlXml" placeholder='<spring:message code="language.tags.0038.01.37"/>'>
											</div>
											<div class="form-group col-sm-6" id="allUrlLog">
												<label for="UrlLog" class="control-label"><spring:message code="language.tags.0038.01.38"/>:</label>
												<input type="text" class="form-control" id="UrlLog" placeholder='<spring:message code="language.tags.0038.01.37"/>'>
											</div>
											<div class="form-group col-sm-6" id="allUrlFisica">
												<label for="UrlFisica" class="control-label"><spring:message code="language.tags.0038.01.39"/>:</label>
												<input type="text" class="form-control" id="UrlFisica" placeholder='<spring:message code="language.tags.0038.01.37"/>'>
											</div>
										</div>
									</div>
								</div>
							</div>	
							<div class="modal-footer">
								<div id="goAheadButtons">
									<button onclick="mPlataformNode('next');" class="btn btn-primary"> <span class="glyphicon glyphicon-chevron-right"></span> <spring:message code="language.tags.0038.01.60"/> </button>	
								</div>
								<div id="backButtons" class="col-sm-2" style="padding: 0px;">
									<button onclick="mPlataformNode('back');" class="btn btn-primary"> <span class="glyphicon glyphicon-chevron-left"></span> <spring:message code="language.tags.0038.01.61"/> </button>	
								</div>
								<div id="saveButtons" class="col-sm-10" style="padding-right: 0px;">
									<button onclick="mPlataformNode('save');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/></button>		<%-- Guardar --%>
								</div>
								<div id="editButtons">
									<button onclick="mPlataformNode('delete');" class="btn btn-secondary"> <span class="glyphicon glyphicon-remove"></span> <spring:message code="language.tags.0037.20"/> </button>		
									<button onclick="mPlataformNode('edit');" class="btn btn-primary"> <span class="glyphicon glyphicon-ok"></span> <spring:message code="language.tags.0029.06"/></button>		
								</div>	
							</div>
							</form>	
						</div>
					</div>			
				</div>
			<!-- end: MODAL NUEVA PLATAFORMA -->

</tiles:putAttribute>
</tiles:insertDefinition>
<script>
	var gbPlatformNode = true;					// TRUE = Platforms		FALSE = Node
	var gbRegreso = false;
	var gbEdicion = false;
	var gsTable, gsPanel, gsEntity;
	var giFlow = 1;
	var giAction = 0;

	$(document).ready(function() {
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
       	});
	    $("[id='Pool']").bootstrapSwitch();
		$("[id='Pool']").bootstrapSwitch('state', false);
		regionLoad();
		
		var Role = 'AdminCor';
		var table1 = $('#tblplataform').css("width","100%").DataTable({	
		    "columns" : [{className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : false}
    		             ],
    		"aaSorting": [[ 0, "asc" ]],
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

	    }).ajax.url('${pageContext.request.contextPath}/platforms/getAll?Role='+Role).load().on( 'draw.dt', function (){$.unblockUI();});
		table1.buttons().container().appendTo( '#tblplataform_wrapper .col-sm-6:eq(0)' );
		
		var table2 = $('#tblNode').css("width","100%").DataTable({
		    "columns" : [{className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : true},
    		             {className : "dt-body-center", orderable : false}
    		             ],
    		"aaSorting": [[ 5, "asc" ],[ 0, "asc" ]],
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

	    }).ajax.url('${pageContext.request.contextPath}/node/getAll?Role='+Role).load().on( 'draw.dt', function (){ $.unblockUI();});
		table2.buttons().container().appendTo( '#tblNode_wrapper .col-sm-6:eq(0)' );
		
		if (gbPlatformNode) {gsTable = $('#tblplataform');	gsEntity = '<spring:message code="language.tags.0038.01.40"/>';}
		
	    $("#p1,#newPlatform").click(function(e){
	        gsPanel = $(this).attr("id");
			formPlataforma();
			gbPlatformNode = true;		gsTable = $('#tblplataform');	gsEntity = '<spring:message code="language.tags.0038.01.40"/>';
			if ('newPlatform' == gsPanel ) { $("#modalPlataformNode").modal('show'); }
		});

	    $("#p2,#newNode").click(function(e) {
	        gsPanel = $(this).attr("id");
	        formNode();
	        gbPlatformNode = false;		gsTable = $('#tblNode');	gsEntity = '<spring:message code="language.tags.0038.01.41"/>';
	        if ('newNode' == gsPanel ) { $("#modalPlataformNode").modal('show'); }
		}); 
	    changeWidthModalChossenSelect();
	});	
	
	$("#formPlatforms").submit(function(e){				//Ventana modal y cualquier evento submit
		e.preventDefault();
        mPlataformNodeAction();							//Función que Guarda, Actualiza ó Elimina la Nueva Plataforma o el Nuevo Node
     });

	function mPlataformNode(psButton){
		if ('save' == psButton) {
			if (gbPlatformNode) { validacionTipo(); giAction = 10; } else { giAction = 20; }		// 10 = Alta de plataforma		20 = Alta de nodo
       	} else if ('delete' == psButton) {
           if (gbPlatformNode) { giAction = 12; } else { giAction = 22; }		// 12 = Eliminar platafroma		22 = Eliminar nodo
       	} else if ('edit' == psButton) {
           if (gbPlatformNode) { giAction = 11; } else { giAction = 21; }		// 11 = Editar plataforma		21 = Editar nodo
       	}else if('next' == psButton){
			if (gbPlatformNode) { giAction = 30; }								// 30 = Boton con el identificador SIGUIENTE de la ventana Modal del alta de PLATAFORMA.
		}else if('back' == psButton){
			if (gbPlatformNode) { giAction = 40; }								// 40 = Boton con el identificador REGRESA de la ventana Modal del alta de PLATAFORMA.
		}
	}
	
    function mPlataformNodeAction() {        
    	var sMessage, sSuccess, sWarning, sWarning01, sWarning02, sError, sErrorError, sUrl, dData;
		var idPlatformNode = $("#IdPlatformNode").val();
		var nombre = $("#Nombre").val();
		var selectRegion = $("#selectRegion option:selected").text();
		var tipoNombre = $("#TipoNombre").val();
		var tipoEquipo = $("#TipoEquipo").val();
		var tipoDescripcion = $("#TipoDescripcion").val();
		var ip = $("#IP").val();
		var ipAux = $("#IPaux").val();
		var usuario = $("#Usuario").val();
		var contrasena = $("#Contrasena").val();
		var puerto = $("#Puerto").val();
		var selectConexion = $("#selectConexion").val();
		var selectPlataforma = $("#selectPlataforma").val();
		var pool = $("#Pool").bootstrapSwitch('state');
		var selectTecnologia = $("#selectTecnologia").val();
		var selectEstatus = $("#selectEstatus").val();
		var urlXml = $("#UrlXml").val();
		var urlLog = $("#UrlLog").val();
		var urlFisica = $("#UrlFisica").val();
		var Role = 'AdminCor';
		
		switch (giAction) {
		    case 10:
		        sMessage = '<spring:message code="language.tags.0038.01.42"/>';
			    sUrl = '${pageContext.request.contextPath}/platforms/save';
			    dData = {nombre:nombre, ip:ip, usuario:usuario, contrasena:contrasena, puerto:puerto, selectTecnologia:selectTecnologia, 
					    selectEstatus:selectEstatus, urlXml:urlXml, urlLog:urlLog, urlFisica:urlFisica, 
					    tipoNombre:tipoNombre, tipoEquipo:tipoEquipo, tipoDescripcion: tipoDescripcion, giFlow:giFlow, Role:Role};
			    sSuccess = '<spring:message code="language.tags.0037.23"/> ' + gsEntity;	// Se guardó correctamente
			    sWarning = '<spring:message code="language.tags.0038.01.43"/>';    			// Ya existe una plataforma con NOMBRE igual a los que intenta registrar, favor de verificar.
			    sWarning01 = '<spring:message code="language.tags.0038.01.62"/>';			// El nombre de el TIPO ya existe, favor de verificar.
			    sWarning02 = '<spring:message code="language.tags.0038.01.63"/>';			// Por causas ajenas al sistema tenemos un evento inesperado al insertar el registro.
			    sError = '<spring:message code="language.tags.0037.25"/> ' + gsEntity;		// No se pudo generar el registro de
			    sErrorError = '<spring:message code="language.tags.0037.26"/> ' + gsEntity;	// Error al guardar el registro de
		        break;
		    case 11:
		        sMessage = '<spring:message code="language.tags.0038.01.44"/>';
			    sUrl = '${pageContext.request.contextPath}/platforms/update';
			    dData = {idPlatformNode:idPlatformNode, nombre:nombre, ip:ip, usuario:usuario, contrasena:contrasena, puerto:puerto, 
					    selectTecnologia:selectTecnologia, selectEstatus:selectEstatus, urlXml:urlXml, urlLog:urlLog, urlFisica:urlFisica};
			    sSuccess = '<spring:message code="language.tags.0029.13"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0038.01.43"/>';
			    sError = '<spring:message code="language.tags.0037.28"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.29"/> ' + gsEntity;
		        break;
		    case 12:
		        sMessage = '<spring:message code="language.tags.0038.01.45"/>';
			    sUrl = '${pageContext.request.contextPath}/platforms/delete';
			    dData = {idPlatformNode:idPlatformNode, nombre:nombre};
			    sSuccess = '<spring:message code="language.tags.0037.31"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0037.32"/> ' + gsEntity;
			    sError = '<spring:message code="language.tags.0037.33"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.34"/> ' + gsEntity;
		        break;
		    case 20:
		        sMessage = '<spring:message code="language.tags.0038.01.46"/>';
			    sUrl = '${pageContext.request.contextPath}/node/save';
			    dData = {nombre:nombre, region:selectRegion, ip:ip, usuario:usuario, contrasena:contrasena, selectEstatus:selectEstatus, 
					    selectPlataforma:selectPlataforma, pool:pool, selectConexion:selectConexion};
			    sSuccess = '<spring:message code="language.tags.0037.23"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0038.01.47"/>';
				sError = '<spring:message code="language.tags.0037.25"/> ' + gsEntity;
		        break;
		    case 21:
		        sMessage = '<spring:message code="language.tags.0038.01.48"/>';
			    sUrl = '${pageContext.request.contextPath}/node/update';
			    dData = {idPlatformNode:idPlatformNode, nombre:nombre, region:selectRegion, ip:ip, usuario:usuario, contrasena:contrasena, 
					    selectEstatus:selectEstatus, selectPlataforma:selectPlataforma, pool:pool, selectConexion:selectConexion};
			    sSuccess = '<spring:message code="language.tags.0029.13"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0038.01.49"/>';
			    sError = '<spring:message code="language.tags.0037.28"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.29"/> ' + gsEntity;
		        break;
		    case 22:
		        sMessage = '<spring:message code="language.tags.0038.01.50"/>';
			    sUrl = '${pageContext.request.contextPath}/node/delete';
			    dData = {idPlatformNode:idPlatformNode, nombre:nombre};
			    sSuccess = '<spring:message code="language.tags.0037.31"/> ' + gsEntity;
			    sWarning = '<spring:message code="language.tags.0037.32"/> ' + gsEntity;
			    sError = '<spring:message code="language.tags.0037.33"/> ' + gsEntity;
			    sErrorError = '<spring:message code="language.tags.0037.34"/> ' + gsEntity;
		        break;
		    case 30:
		    	sMessage = '';
		    	formPlataformaTipo();		// Botón SIGUIENTE de Plataforma
		    	break;
		    case 40:
		    	sMessage = '';
		    	formPlataformaBack();		// Botón REGRESAR de TIPO a la Plataforma
		    	break;
		}

	    if(sMessage!=''){
			bootbox.confirm({
				message: sMessage,
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
					$.blockUI({
						message: '<span class="spinner"/>',
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
				       				gsTable.DataTable().ajax.reload();
				                    $("#modalPlataformNode").modal('hide');
				               	} else if(respuesta == 2) {
									toastr.warning(sWarning);
								} else if(respuesta == 3) {
									toastr.warning(sWarning01);
								} else if(respuesta == 4) {
									toastr.warning(sWarning02);
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
    }
    
    function editPlataformNode(pidPlatformNode) {
        if (pidPlatformNode !== '') {
            var sUrl;
            if (gbPlatformNode) {
                sUrl = "${pageContext.request.contextPath}/platforms/getOne?idPlatformNode=" + pidPlatformNode;
            } else {
                sUrl = "${pageContext.request.contextPath}/node/getOne?idPlatformNode=" + pidPlatformNode;
            }
    		$.blockUI({
    			message: '<span class="spinner"/>',
     			css: {border:'none', backgroundColor:'transparent'}
           	});
            $.ajax({
                type : "POST",
                url : sUrl,
                success : function(data) {
                    if (data != true) {
                        if (gbPlatformNode) {
                            gbEdicion=true;
                            formPlataforma();
                            $("#IdPlatformNode").val(data.id);
                            $("#Nombre").val(data.nombre);
                            $("#IP").val(data.ip);
                            $("#Usuario").val(data.usuario);
                            $("#Contrasena").val(data.contrasena);
                            $("#Puerto").val(data.puerto);
                            $("#selectTecnologia").val(data.id_ctecnologia);
                            $("#selectEstatus").val(data.id_cestatus);
                            $("#UrlXml").val(data.urlxml);
                            $("#UrlLog").val(data.urllog);
                            $("#UrlFisica").val(data.urlfisica);
                        } else {
                            gbEdicion=true;
                            formNode();
                            $("#IdPlatformNode").val(data.id);
                            $("#selectRegion").val(data.id_cregion);
                            $("#Nombre").val(data.nombre);
                            $("#IP").val(data.ip);
                            $("#Usuario").val(data.usuario);
                            $("#Contrasena").val(data.contrasena);
                            $("#selectConexion").val(data.id_cconexion);
                            $("#selectEstatus").val(data.id_cestatus);
                            $("#selectPlataforma").val(data.id_c02plataforma);
                            $("[id='Pool']").bootstrapSwitch('state', (data.pool == 1) ? true : false);
                        }
                        
                        $("#modalPlataformNode").modal('show');
                        $("#goAheadButtons").hide();
                        $("#saveButtons").hide();
                        $("#editButtons").show();
                        $('select').trigger("chosen:updated");
                    }
                    $.unblockUI();
                }
            });
        } else {
            toastr.error('<spring:message code="language.tags.0038.01.51"/> ' + gsEntity + ' <spring:message code="language.tags.0038.01.52"/>');
        }
    }

    function formPlataforma() {
			var sEdicion;
			if(gbEdicion){ sEdicion='<spring:message code="language.tags.0038.01.64"/>'; gbEdicion=false; } else{ sEdicion='<spring:message code="language.tags.0038.01.13"/>';}
			document.getElementById("allTitle").innerHTML = sEdicion;				//Modal que despliega elementos para 
 	        $("#Nombre").val('');													//Agregar nueva plataforma
	        $("#IP").val('');
	        $("#Usuario").val('');			
	        $("#Contrasena").val('');		
	        $("#Puerto").val('');
	        $("#selectTecnologia").val('');
	        $("#selectEstatus").val('');
	        $("#UrlXml").val('');
	        $("#UrlLog").val('');
	        $("#UrlFisica").val('');

	        $("#allNombres").show();		$("#Nombre").show().prop('required', true);
	        $("#allIP").show();				$("#IP").show().prop('required', true);
	        $("#allUsuarios").show();		$("#Usuario").show().prop('required', true);
	        $("#allContrasenas").show();	$("#Contrasena").show().prop('required', true);
	        $("#allselectEstatus").show();	$("#selectEstatus").prop('required', true);
	        $("#allTecnologias").show();	$("#selectTecnologia").prop('required', true);
	        $("#allUrlXml").show();			$("#UrlXml").show().prop('required', true);
	        $("#allUrlLog").show();			$("#UrlLog").show().prop('required', true);
	        $("#allUrlFisica").show();		$("#UrlFisica").show().prop('required', true);
	        $("#allPuerto").show();			$("#Puerto").show().prop('required', true);

	        $("#allTipoNombres").hide();
	        $("#allTipoEquipos").hide();
	        $("#allTipoDescripciones").hide();
		        
	        $("#allRegiones").hide();		$("#selectRegion").prop('required', false);
	        $("#allConexiones").hide();		$("#selectConexion").prop('required', false);
	        $("#allPlataformas").hide();	$("#selectPlataforma").prop('required', false);
	        $("#allPool").hide();			$("#Pool").hide().prop('required', false);

	        $("#goAheadButtons").show();
	        $("#saveButtons").hide();
	        $("#editButtons").hide();
	        $("#backButtons").hide();
 	        $('select').trigger("chosen:updated");    
	        gbRegreso=false;
    }

    function formPlataformaTipo() {
		document.getElementById("allTitle").innerHTML = '<spring:message code="language.tags.0038.01.66"/>';	//Modal que despliega elementos para Agregar un nuevo tipo
		if(!gbRegreso){
	        $("#TipoNombre").val('');
	        $("#TipoEquipo").val('');
	        $("#TipoDescripcion").val('');
		}else{
	        $("#TipoNombre").val();
	        $("#TipoEquipo").val();
	        $("#TipoDescripcion").val();
		}
	
        $("#allTipoNombres").show();
        $("#allTipoEquipos").show();
        $("#allTipoDescripciones").show();
        
        $("#allNombres").hide();		$("#Nombre").hide().prop('required', false);
        $("#allIP").hide();				$("#IP").hide().prop('required', false);
        $("#allUsuarios").hide();		$("#Usuario").hide().prop('required', false);
        $("#allContrasenas").hide();	$("#Contrasena").hide().prop('required', false);
        $("#allselectEstatus").hide();	$("#selectEstatus").prop('required', false);

        $("#allPuerto").hide();			$("#Puerto").hide().prop('required', false);
        $("#allConexiones").hide();		$("#selectConexion").prop('required', false);
        $("#allTecnologias").hide();	$("#selectTecnologia").prop('required', false);
        $("#allUrlXml").hide();			$("#UrlXml").hide().prop('required', false);
        $("#allUrlLog").hide();			$("#UrlLog").hide().prop('required', false);
        $("#allUrlFisica").hide();		$("#UrlFisica").hide().prop('required', false);

        $("#allRegiones").hide();		$("#selectRegion").prop('required', false);
        $("#allConexiones").hide();		$("#selectConexion").prop('required', false);

        $("#allPlataformas").hide();	$("#selectPlataforma").prop('required', false);
        $("#allPool").hide();			$("#Pool").hide().prop('required', false);

        $("#saveButtons").show();
        $("#backButtons").show();
        $("#goAheadButtons").hide();
        $("#editButtons").hide();
        $('select').trigger("chosen:updated");    
	}

    function formPlataformaBack() {
        gbRegreso = true;
		document.getElementById("allTitle").innerHTML = '<spring:message code="language.tags.0038.01.13"/>';			//Modal que despliega elementos para 
        $("#Nombre").val();																								//Agregar nueva plataforma
        $("#IP").val();				
        $("#Usuario").val();			
        $("#Contrasena").val();		
        $("#Puerto").val();
        $("#selectTecnologia").val();
        $("#selectEstatus").val();
        $("#UrlXml").val();
        $("#UrlLog").val();
        $("#UrlFisica").val();
        $("#TipoNombre").val();
        $("#TipoEquipo").val();
        $("#TipoDescripcion").val();

        $("#allNombres").show();		$("#Nombre").show().prop('required', true);
        $("#allIP").show();				$("#IP").show().prop('required', true);
        $("#allUsuarios").show();		$("#Usuario").show().prop('required', true);
        $("#allContrasenas").show();	$("#Contrasena").show().prop('required', true);
        $("#allselectEstatus").show();	$("#selectEstatus").prop('required', true);
        $("#allTecnologias").show();	$("#selectTecnologia").prop('required', true);
        $("#allUrlXml").show();			$("#UrlXml").show().prop('required', true);
        $("#allUrlLog").show();			$("#UrlLog").show().prop('required', true);
        $("#allUrlFisica").show();		$("#UrlFisica").show().prop('required', true);
        $("#allPuerto").show();			$("#Puerto").show().prop('required', true);

        $("#allTipoNombres").hide();	$("#TipoNombre").show().prop('required', false);
        $("#allTipoEquipos").hide();	$("#TipoEquipo").show().prop('required', false);
        $("#allTipoDescripciones").hide();	$("#TipoDescripcion").show().prop('required', false);
	        
        $("#allRegiones").hide();		$("#selectRegion").prop('required', false);
        $("#allConexiones").hide();		$("#selectConexion").prop('required', false);
        $("#allPlataformas").hide();	$("#selectPlataforma").prop('required', false);
        $("#allPool").hide();			$("#Pool").hide().prop('required', false);

        $("#goAheadButtons").show();
        $("#backButtons").hide();
        $("#saveButtons").hide();
        $("#editButtons").hide();
	    $('select').trigger("chosen:updated");    
	}

	function validacionTipo(){
		$("#TipoNombre").show().prop('required', true);
		$("#TipoEquipo").show().prop('required', true);
		$("#TipoDescripcion").show().prop('required', true);
	}
    
    function formNode() {
    	var sEdicion;
		if(gbEdicion){ sEdicion='<spring:message code="language.tags.0038.01.65"/>'; gbEdicion=false; } else{ sEdicion='<spring:message code="language.tags.0038.01.53"/>';}
		document.getElementById("allTitle").innerHTML = sEdicion; 
        $("#selectRegion").val('');
        $("#Nombre").val('');
        $("#IP").val('');				
        $("#Usuario").val('');
        $("#Contrasena").val('');
        $("#selectEstatus").val('');
        $("#selectPlataforma").val('');
        $("#Pool").val('');
        $("#selectConexion").val('');

        $("#allRegiones").show();		$("#selectRegion").prop('required', true);
        $("allNombres").show();			$("#Nombre").show().prop('required', true);
        $("allIP").show();				$("#IP").show().prop('required', true);
        $("#allPlataformas").show();	$("#selectPlataforma").prop('required', true);
        $("#allPool").show();	
        $("#allConexiones").show();		$("#selectConexion").prop('required', true);
        		
        $("#allTipoNombres").hide();
        $("#allTipoEquipos").hide();
        $("#allTipoDescripciones").hide();
        
        $("#allIPaux").hide();			$("#IPaux").hide().prop('required', false);
        $("#allPuerto").hide();			$("#Puerto").hide().prop('required', false);        
        $("#allTecnologias").hide();	$("#selectTecnologia").prop('required', false);
        $("#allUrlXml").hide();			$("#UrlXml").hide().prop('required', false);
        $("#allUrlLog").hide();			$("#UrlLog").hide().prop('required', false);
        $("#allUrlFisica").hide();		$("#UrlFisica").hide().prop('required', false);
        
        $('select').trigger("chosen:updated");
        $("#saveButtons").show();
        $("#backButtons").hide();
        $("#editButtons").hide();
        $("#goAheadButtons").hide();
    }


    // Función que carga todas las regiones
    function regionLoad() {
        $.ajaxSetup({ cache : false });
        var options = $("#selectRegion");
        $.ajax({
			type : 'GET',
			dataType : 'json',
			url : "${pageContext.request.contextPath}/consult/getJSONCRegion",
			beforeSend : function() { },
			success : function(result) {
				options.empty();
				options.append($("<option />").val('').text('<spring:message code="language.tags.0038.01.16"/>'));
				$.each(result, function(key, value) {
					options.append($("<option />").val(key).text(value));
				});
				$('#selectRegion').trigger('chosen:updated');
			},
			error : function(xhr) { // if error occured
				alert('<spring:message code="language.tags.0037.35"/>');
				alert(xhr.statusText + xhr.responseText);
			},
			complete : function() { },
		});

        // Función que carga las conexiones
        connectionLoad();
        function connectionLoad() {
            $.ajaxSetup({ cache : false });
            var options = $("#selectConexion");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONCConexion",
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0038.01.28"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#selectConexion').trigger('chosen:updated');
				},
				error : function(xhr) { // if error occured
					alert('<spring:message code="language.tags.0037.35"/>');
					alert(xhr.statusText + xhr.responseText);
				},
				complete : function() { },
			});
        }

        // Función que carga las tecnologías 
        technologyLoad();
        function technologyLoad() {
            $.ajaxSetup({ cache : false });
            var options = $("#selectTecnologia");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONCTecnologia",
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0038.01.32"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#selectTecnologia').trigger('chosen:updated');
				},
				error : function(xhr) { // if error occured
					alert('<spring:message code="language.tags.0037.35"/>');
					alert(xhr.statusText + xhr.responseText);
				},
				complete : function() { },
			});
        }

        //Función que carga el estatus
        statusLoad();
        function statusLoad() {
            $.ajaxSetup({ cache : false });
            var idUso = 3;
            var options = $("#selectEstatus");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONCEstatus?idUso=c02plataforma",
				data : { idUso : idUso  },
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0037.14"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#selectEstatus').trigger('chosen:updated');
				},
				error : function(xhr) { // if error occured
					alert('<spring:message code="language.tags.0037.35"/>');
					alert(xhr.statusText + xhr.responseText);
				},
				complete : function() { },
			});
        }
         
        //Función que carga plataformas
        platformLoad();
        function platformLoad() {
            $.ajaxSetup({ cache : false });
            var options = $("#selectPlataforma");
            $.ajax({
				type : 'GET',
				dataType : 'json',
				url : "${pageContext.request.contextPath}/consult/getJSONC02Plataforma",
				beforeSend : function() { },
				success : function(result) {
					options.empty();
					options.append($("<option />").val('').text('<spring:message code="language.tags.0038.01.30"/>'));
					$.each(result, function(key, value) {
						options.append($("<option />").val(key).text(value));
					});
					$('#selectPlataforma').trigger('chosen:updated');
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
	
	