<%@ include file="/WEB-INF/include.jsp" %>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div id="page4" class="main-container inner">				
			<!-- start: PAGE CONTENT -->
			<div class="row">
				<div class="col-md-12">
					<!-- start: DYNAMIC TABLE PANEL -->
					<div class="panel panel-white">
<!-- 						<div class="panel-heading"> -->
							<h3 class="n-titles">Prueba de Conexión a Equipos</h3>							
<!-- 						</div> -->
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-6 col-md-6 col-sm-12 required">
									<label for="selectPlataforma" class="control-label">Plataforma:</label>
								 	<select disabled id="selectPlataforma"  name="selectPlataforma" 
								 		data-placeholder="Seleccione plataforma..." class="form-control chosen-select" >
									</select>				
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12">
									<label for="selectEstatus" class="control-label">Estatus de conexión:</label>
								 	<select disabled id="selectEstatus"  name="selectEstatus" 
								 		data-placeholder="Seleccione estatus..." class="form-control chosen-select" >
									</select>			
								</div>
							</div>									
						</div>
						<div class="form-group">
								<div class="col-lg-6 col-md-6 col-sm-12 required">
<!-- 									<label for="crqNameInput" class="control-label">Numero de CRQ:</label> -->
<!-- 									<input type="text" name="crqNameInput" id="crqNameInput"  class="form-control"  -->
<!-- 										placeholder="Introduzca un número de CRQ valido..." > -->
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 required">
									<div class="modal-footer">
										<button id = "btnPrepareTest" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> Iniciar</button>
									</div>
								</div>
						</div>		
						
						<div class="panel-body table-responsive">
							<table class='table table-striped table-bordered table-hover  table-full-width small' id="tblTestResult">
								<thead>
									<tr> 
										<th> </th>
										<th>Plataforma</th> 
										<th>Nombre</th> 
										<th>Usuario</th> 
										<th>Ip primaria</th>
										<th>Ip secundaria</th>
										<th>Estatus</th>
									</tr> 
								</thead>
							</table>
						</div>
					</div>
					<!-- end: DYNAMIC TABLE PANEL -->
				</div>
			</div>
			
			<!-- inicio: Modal Tabla de conexiones -->
			<div id="modalTestConnection" class="modal fade bd-example-modal-lg">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
							<h4 class="modal-title" id="allTitle">Indique la/las plataformas a probar.</h4>
						</div>
						<div class='modal-body panel-body table-responsive'>										
							<table id='tblListConnection'class='table table-striped table-bordered table-hover table-full-width small'>
								<thead>
									<tr> 										
										<th>Plataforma</th> 
										<th>Nombre</th> 
										<th>Usuario</th> 
										<th>Ip primaria</th>
										<th>Ip secundaria</th>
									</tr> 
								</thead>
							</table>									
						</div>						
						<div class="modal-footer">
							<button id="btnTestAll" class="btn btn-secondary"> <span class="glyphicon glyphicon-play"></span> Todas </button>		
							<button id="btnTestSelected" class="btn btn-primary"> <span class="glyphicon glyphicon-ok-circle"></span> Seleccion </button>
						</div>
					</div>
				</div>
			</div>
			<!--Fin: Modal Tabla de conexiones -->
		
		</div>	

	</tiles:putAttribute>
</tiles:insertDefinition>
<script>
	var tblTestResult;	
	var selectPlatforms = $("#selectPlataforma");
	var selectStatus = $("#selectEstatus");
	var btnPrepareTest = $("#btnPrepareTest");
	
	var tblListConnection;
	var selectModalPlatforms = $("#selectModalPlatforms");
	var btnTestAll = $("#btnTestAll");
	var btnTestSelected = $("#btnTestSelected");
	
	$(document).ready(function(){
		//Configuracion inicial de la tabla de resultados
		tblTestResultConfig();
		
		//Carga eventos de la columna de detalles
		detailEvent();
		
		//Eventos de filtrado
		selectPlatforms.on('change', function() {			
    		filterColumn(tblTestResult,1, this.value);
    	});		
    	selectStatus.on('change', function() {    		
    		filterColumn(tblTestResult,6, this.value);
    	});
    	
    	//Muestra el modal y Carga los datos
    	btnPrepareTest.click(function(e)  {     		
    		e.preventDefault();	
    		$("#modalTestConnection").modal('show');
    		loadModalTblConnection();  		
    	} );
    	
    	//Realiza el test de todas las plataformas
    	btnTestAll.click(function(e){
    		e.preventDefault();    		
    		bootbox.confirm({
				message : "Se realizara un test de conexiones a todas las plataformas de acceso.",
				size : 'small',
				buttons : {
					cancel : {
						label : 'Cancelar',
						className : 'btn-default-g'
					},
					confirm : {
						label : 'Confirmar',
						className : 'btn btn-primary'
					}
				},
				callback : function(result) {
					if(result){
						$("#modalTestConnection").modal('hide');
						executeTestAll();
					}
				}
			});						
    	});
    	
    	//Realiza el test de las plataformas seleccionadas
    	btnTestSelected.click(function(e){
    		e.preventDefault();
    		$("#modalTestConnection").modal('hide');
    		var tblSelected = tblListConnection.rows( { selected: true } );
    		var message = "";
    		$.each(tblSelected.data(), function( index, value ){
    			var connection = value;
    			message = message +"<br>" + connection.ip;
    		});
			bootbox.confirm({
				message : "Se realizara un test de conexiones a las siguientes ip's: <br>"+"<b>"+message+"</b>",
				size : 'small',
				buttons : {
					cancel : {
						label : 'Cancelar',
						className : 'btn btn-secondary'
					},
					confirm : {
						label : 'Confirmar',
						className : 'btn btn-primary'
					}
				},
				callback : function(result) {
					if(result){
						$("#modalTestConnection").modal('hide');
						executeTestSelected();
					}
				}
			});		
    	});
    	
	});
	
	//Funcion que ejecuta el test de todas las conexiones del usuario
	function executeTestAll(){	
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
       	});
		$.ajax({
			type : "post",
			url : '${pageContext.request.contextPath}/testing/testAllConnection',
			dataType : "json",
			success : function(data) {
				loadTblResultByData(data);
				loadSelectByDataTable(tblTestResult,1,selectPlatforms);           
	        	$.unblockUI();
			},
			error : function(jqXHR, textStatus, errorThrown) {	
				$.unblockUI();
				if (textStatus === "timeout") {
					toastr.error('Error... tiempo de consulta ha excedido. Favor de intentar más tarde.');
				} else {
					toastr.error(jqXHR.responseText);
				}				
			}
		});
	}
	var equipos;
	//Funcion que ejecuta el test de las filas seleccionadas
	function executeTestSelected(){
		dataSelected = tblListConnection.rows( { selected: true } ).data()
		var dataResult = [];
        loadSelectByAjax(selectStatus);
        loadTblResultByData(dataSelected)
        btnPrepareTest.prop("disabled", true);
        equipos = "";
		executeTestList(dataSelected, 0,null);
	}
	
	//Funcion que ejecuta el test de una lista de conexiones
	function executeTestList(dataSelected,index,lastConnection){
		var connection;
		if(index < dataSelected.length){
			connection = dataSelected[index];
			equipos+=", "+connection.nombre;
		}else{
			finishListExecution();
			btnPrepareTest.prop("disabled", false);
			return 0;
		}
		if(lastConnection != null && lastConnection.ip == connection.ip){
			dataSelected[index].detalle = lastConnection.detalle;
			dataSelected[index].status = lastConnection.status;
			loadTblResultByData(dataSelected);
			executeTestList(dataSelected,index+1,connection);
		}else{
			$.ajax({
				type : "post",
				url : '${pageContext.request.contextPath}/testing/testConnection',
				dataType : "json",
				data : connection,
				success : function(data) {
					dataSelected[index].detalle = data.detalle;
					dataSelected[index].status = data.status;
					loadTblResultByData(dataSelected);
					executeTestList(dataSelected,index+1,connection);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					dataSelected[index].detalle = "Error en tiempo de consulta";
					dataSelected[index].status = "ERROR";
					loadTblResultByData(dataSelected);
					executeTestList(dataSelected,index+1,connection);				
				}
			});
		}		
	}

	function finishListExecution(){
		var url = '${pageContext.request.contextPath}/testing/finishTestList?equipos='+equipos
		$.ajax({
			url : url,
			success : function(data) {
			},
			error : function(jqXHR, textStatus, errorThrown) {	
				console.log("finishTestList error");
			}
		});
	}
	
	function loadTblResultByData(dataSelected){
		tblTestResult.clear();
		tblTestResult.rows.add(dataSelected);
		tblTestResult.draw();
		loadSelectByDataTable(tblTestResult,1,selectPlatforms);
	}
	
	//Funciones que carga datos en los select desde columnas de una tabla
	function loadSelectByDataTable(table, columnPosition, select) {
		select.find('option').remove().end();    	
		select.prop("disabled", false);
		select.append($("<option />").val('').text("..."));
		table.column( columnPosition ).data().unique().sort().each( 
				function ( value, index ) {
					select.append($("<option />").val(value).text(value));
					} 
				);
		select.trigger('chosen:updated')
	}	
	
	//Funcion que carga datos en los select desde una llamada ajax
	function loadSelectByAjax(select){
		select.find('option').remove().end();    	
		select.prop("disabled", false);
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/testing/getPossibleStatusList', 
		    dataType: "json",
		    success: function(data){
		    	select.append($("<option />").val('').text('...'));
		      	$.each(data,function(key, registro) {
		    	  select.append( '<option value="'+registro+'">'+registro+'</option>' );
		      	}); 
		      select.trigger('chosen:updated');
		    },
		    error: function(xhr) {
		    	alert(xhr.statusText + xhr.responseText);
		    }
		});
	}
	
	//Funcion que activa el filtro de los select
	function filterColumn(table, columnPosition, value) {
		table.column(columnPosition).search( value ? '^'+value+'$':'',true,false)
		.draw();		
	}
	
	//Funcion que activa el evento de la columna detalles
	function detailEvent(){
		 $('#tblTestResult tbody').on( 'click', 'tr td.details-control', function () {			 
             var tr = $(this).closest('tr');
             var row = tblTestResult.row( tr );
             var detalle = tblTestResult.data()[row.index()].detalle;
			 if(detalle == null)
				 detalle="Sin información adicional.";			 
             if ( row.child.isShown() ) {
                 tr.removeClass( 'details' );
                 row.child.hide();
             }
             else {
                 tr.addClass( 'details' );
                 row.child(detalle).show();	 
             }
         } );
	}
	
	//Funcion que contiene la configuracion de la tabla de resultados
	function tblTestResultConfig(){
		tblTestResult = $("#tblTestResult").DataTable( {
	        "columns": [
	        	{
	                "class":          "details-control",
	                "orderable":      false,
	                "data":           null,
	                "defaultContent": ""
	            },
	            { "data": "tipo_conexion" },
	            { "data": "nombre" },
	            { "data": "usuario" },
	            { "data": "ip" },
	            { "data": "ipAux" },
	            { "data": "status" ,
	              "defaultContent":"<i class='fa fa-refresh fa-spin-custom'></i>En proceso..."
	            }
	        ],
	        "dom": 'Bfrtip',
	        "buttons":[ 'copy', 'excel', 'pdf', 'colvis' ],
	        "info" : false,
	        "oLanguage" : {
				"oPaginate" : {
					"sPrevious" : "<i class='fa fa-arrow-left'></i>",
					"sNext" : "<i class='fa fa-arrow-right'></i>"
				},
				"sLoadingRecords" : "Cargando datos...",
				"sEmptyTable" : "No existen registros para mostrar",
				"sSearch" : "Buscar",
				"sLengthMenu":     "Mostrar _MENU_ registros",
			}
	    });
	}
	
	//Funcion que carga las conexiones que se pueden testear
	function loadModalTblConnection(){		
		if(tblListConnection!=null){
			tblListConnection.destroy();
		}
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'},
			baseZ: 2000
       	});	
		tblListConnection = $('#tblListConnection').DataTable( {
	        "ajax": {
	            "url": '${pageContext.request.contextPath}/testing/getAllConnection',
	            "dataSrc": "",
	            "error" : function(jqXHR, textStatus, errorThrown) {
					$.unblockUI();
					toastr.error('Ha ocurrido un error, intente mas tarde.');
				}	            
	        },
	        "columns": [
	            { "data": "tipo_conexion" },
	            { "data": "nombre" },
	            { "data": "usuario" },
	            { "data": "ip" },
	            { "data": "ipAux" },
	        ],
	        "order": false,
	        "dom": 'Bfrtip',
	        "select": {
	            style: 'multi'
	        },
	        "buttons":[ 'copy', 'excel', 'pdf', 'colvis' ],
	        "initComplete": function(settings, json) {
	        	loadSelectByDataTable(tblListConnection,0,selectModalPlatforms); 
	        	selectModalPlatforms.trigger('chosen:updated');	        	
	        	$.unblockUI();
	          },
	        "info" : false,
	        "oLanguage" : {
				"oPaginate" : {
					"sPrevious" : "<i class='fa fa-arrow-left'></i>",
					"sNext" : "<i class='fa fa-arrow-right'></i>"
				},
				"sLoadingRecords" : "Cargando datos...",
				"sEmptyTable" : "No existen registros para mostrar",
				"sSearch" : "Buscar",
				"sLengthMenu":     "Mostrar _MENU_ registros",
			}
			
	    });
	}
</script>