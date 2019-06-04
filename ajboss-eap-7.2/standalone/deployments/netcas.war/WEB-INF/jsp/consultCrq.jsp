<%@ include file="/WEB-INF/include.jsp" %>
<%@page import="mx.com.telcel.oym.netcas.constante.EConstante"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<!-- start: DYNAMIC TABLE PANEL -->
		<div id="page2" class="panel panel-white">
<!-- 			<div class="panel-heading"> -->
				<h3 class="n-titles"><spring:message code="language.tags.0045.01.01"/></h3>
<!-- 			</div> -->
			<div class="panel-body">
				<div class="form-group">									
					<div class="col-xs-6 required">
						<label for="selectTipoEjec" class="control-label"><spring:message code="language.tags.0045.01.02"/></label>
					 	<select id="selectTipoEjec"  name="selectTipoEjec" data-placeholder="Seleccione Tipo de Ejecución..." class="form-control chosen-select">
						</select>				
					</div>
					<div class="col-xs-6">
						<label for="daterange" class="control-label"><spring:message code="language.tags.0045.01.03"/></label>
					 	<input type="text" name="daterange" class="form-control"value=""/>			
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6 required">
						<label for="selectEstatus" class="control-label"><spring:message code="language.tags.0037.05"/>:</label>
					 	<select id="selectEstatus"  name="selectEstatus" data-placeholder='<spring:message code="language.tags.0037.14"/>' class="form-control chosen-select" >
						</select>				
					</div>								
					<div class="col-xs-6 required">
						<label for="crqNameInput" class="control-label"><spring:message code="language.tags.0045.01.04"/></label>
						<input type="text" name="crqNameInput" id="crqNameInput"  class="form-control" placeholder='<spring:message code="language.tags.0045.01.05"/>' >				
					</div>
				</div>	
				<div class="form-group">
					<div class="col-xs-6 required">
					</div>
					<div class="col-xs-6 required">
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"  onclick="searchCRQs()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> <spring:message code="language.tags.0029.12"/></button>
						</div>
					</div>
				</div>					
			</div>
			<div class="panel-body table-responsive">
				<table class='table table-striped table-bordered table-hover table-full-width small' id="tblListCRQ" name="tblCRQsWelcome">
					<thead>
						<tr> 
							<th> </th>
							<th><spring:message code="language.tags.0029.02"/></th> 
							<th><spring:message code="language.tags.0038.03.12"/></th> 
							<th><spring:message code="language.tags.0038.03.13"/></th> 
							<th><spring:message code="language.tags.0038.03.14"/></th>
							<th><spring:message code="language.tags.0038.01.09"/> <spring:message code="language.tags.0045"/></th>
<%-- 							<th><spring:message code="language.tags.0037.05"/></th> --%>
							<th><spring:message code="language.tags.0038.01"/></th> 
<%-- 							<th><spring:message code="language.tags.0045.01.06"/></th>  --%>
<%-- 							<th><spring:message code="language.tags.0038.03.15"/></th> --%>
						</tr> 
					</thead>
				</table>
			</div>
		</div>
		<!-- end: DYNAMIC TABLE PANEL -->

</tiles:putAttribute>
</tiles:insertDefinition>
<script>
	var startDateRange="";
	var endDateRange="";
	var table1;
	
	$(document).ready(function(){
		$.blockUI({ message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		
		$('input[name="daterange"]').daterangepicker({
			timePicker: true,
			timePicker24Hour: true,
			timePickerIncrement: 30,
			startDate: new Date()-1,
			endDate: new Date(),
			autoUpdateInput: false,
			locale: {
				format: 'DD/MM/YYYY h:mm A',
				applyLabel: '<spring:message code="language.tags.0045.01.07"/>',
				cancelLabel: '<spring:message code="language.tags.0014"/>',
				daysOfWeek: ['<spring:message code="language.tags.0045.01.08"/>', 
							 '<spring:message code="language.tags.0045.01.09"/>', 
							 '<spring:message code="language.tags.0045.01.10"/>', 
							 '<spring:message code="language.tags.0045.01.11"/>', 
							 '<spring:message code="language.tags.0045.01.12"/>', 
							 '<spring:message code="language.tags.0045.01.13"/>',
							 '<spring:message code="language.tags.0045.01.14"/>'],
				monthNames: ['<spring:message code="language.tags.0045.01.15"/>', 
							 '<spring:message code="language.tags.0045.01.16"/>', 
							 '<spring:message code="language.tags.0045.01.17"/>', 
							 '<spring:message code="language.tags.0045.01.18"/>', 
							 '<spring:message code="language.tags.0045.01.19"/>', 
							 '<spring:message code="language.tags.0045.01.20"/>', 
							 '<spring:message code="language.tags.0045.01.21"/>', 
							 '<spring:message code="language.tags.0045.01.22"/>', 
							 '<spring:message code="language.tags.0045.01.23"/>', 
							 '<spring:message code="language.tags.0045.01.24"/>', 
							 '<spring:message code="language.tags.0045.01.25"/>', 
							 '<spring:message code="language.tags.0045.01.26"/>']
			}
		},
			function(start, end, label) {
				startDateRange=start.format('DD/MM/YYYY HH:mm:ss');
				endDateRange= end.format('DD/MM/YYYY HH:mm:ss');
			}
		);
		
		$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
			$(this).val(picker.startDate.format('DD/MM/YYYY h:mm A') + ' - ' + picker.endDate.format('DD/MM/YYYY h:mm A'));
		});
		
		$('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
			startDateRange="";
			endDateRange="";
		});

		cargaEstatus();
		cargaTipoEjec();
		
		table1 = $('#tblListCRQ').css("width","100%").DataTable({
			buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
			"columns" : [
						{
			                "class":          "details-control",
			                "orderable":      false,
			                "data":           null,
			                "defaultContent": ""
			            },
						{className : "dt-body-center","width" : "15%","data": [0]},
						{className : "dt-body-center","width" : "18%","data": [1]},
						{className : "dt-body-center","width" : "10%","data": [2]},
						{className : "dt-body-center","width" : "15%","data": [3]},
						{className : "dt-body-center","width" : "27%","data": [4]},
						{className : "dt-body-center","width" : "27%","data": [6]}],
			"order": false,
			"pageLength": 20,
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
				},
		   "createdRow": function ( row, data, index ) {
	            if ( data != null) {
		            var arr = data[9];
	            	$('td', row).css({
		            	'background-color': arr[0],
 		            	'color':arr[1], 
		            	"border-top-width":"1px", 
		            	"border-right-color":"transparent",
	            		"border-left-color":"transparent"
	            	});
	            }
	        }
		}).ajax.url('${pageContext.request.contextPath}/consult/getJSONListCRQs').load().on( 'draw.dt', function (){ $.unblockUI();});
		table1.buttons().container().appendTo( '#tblListCRQ_wrapper .col-sm-6:eq(0)' );		
		
		$('#tblListCRQ tbody').on( 'click', 'tr td.details-control', function () {			 
	         var tr = $(this).closest('tr');
	         var row = table1.row( tr );
	         var detalle = "<label> <spring:message code="language.tags.0037.05"/>: </label> " +table1.data()[row.index()][5] + "</br>" +
	         				"<label> <spring:message code="language.tags.0045.01.06"/>: </label> "+table1.data()[row.index()][7] + "</br>" +
	         				"<label> <spring:message code="language.tags.0038.03.15"/>: </label> "+table1.data()[row.index()][8];		 
	         if ( row.child.isShown() ) {
	             tr.removeClass( 'details' );
	             row.child.hide();
	         } else {
	             tr.addClass( 'details' );
	             row.child(detalle).show();	 
	         }
	     } );
	});
	
	function cargaEstatus(){
		$.ajaxSetup({ cache: false });
		var options = $("#selectEstatus");
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url:"${pageContext.request.contextPath}/consult/getJSONCEstatus?idUso=tcrq",
			beforeSend : function() { },
			success : function(result) {
				options.empty();
				options.append($("<option />").val('').text('<spring:message code="language.tags.0037.14"/>'));
				$.each(result,
					function(key, value) {
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
	
	function cargaTipoEjec(){
		$.ajaxSetup({ cache: false });
		var options = $("#selectTipoEjec");
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url:"${pageContext.request.contextPath}/consult/getJSONTipoEjec",
			beforeSend : function() { },
			success : function(result) {
				options.empty();
				options.append($("<option />").val('').text('<spring:message code="language.tags.0045.01.27"/>'));
				$.each(result,
						function(key, value) {
							options.append($("<option />").val(key).text(value));
						});
				$('#selectTipoEjec').trigger('chosen:updated');	
			},
			error : function(xhr) { // if error occured
				alert('<spring:message code="language.tags.0037.35"/>');
				alert(xhr.statusText + xhr.responseText);
			},
			complete : function() { },
		});
	}
	
	function searchCRQs(){
		var idEstatus=$("#selectEstatus").val();
		var txtEstatus = $("#selectEstatus option:selected").text();
		var tipoEjec=$("#selectTipoEjec").val();
		var txtTipEjec = $("#selectTipoEjec option:selected").text();
		var numCRQ=$("#crqNameInput").val();

		if(idEstatus=="" &&  tipoEjec=="" && numCRQ=="" && startDateRange==""){
        	toastr.warning('<spring:message code="language.tags.0045.01.28"/>');
        	return;
		} else {
			$.blockUI({message: '<span class="spinner"/>',
	 			css: {border:'none', backgroundColor:'transparent'}
			});
			var table1 = $('#tblListCRQ').css("width","100%").DataTable({
				buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
				"columns" : [{className : "dt-body-center","width" : "15%"},
							{className : "dt-body-center","width" : "18%"},
							{className : "dt-body-center","width" : "10%"},
							{className : "dt-body-center","width" : "15%"},
							{className : "dt-body-center","width" : "27%"},
							{className : "dt-body-center","width" : "27%"},
							{className : "dt-body-center","width" : "27%"},
							{className : "dt-body-center","width" : "27%"},
							{className : "dt-body-center","width" : "15%"}],
				"order": false,
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
			}).ajax.url('${pageContext.request.contextPath}/consult/getListCRQsByFilter?'
			    	+"&idEstatus="+ idEstatus
			    	+"&tipoEjec="+tipoEjec
			    	+"&numCRQ="+numCRQ
			    	+"&startDate="+startDateRange
			    	+"&endDate="+endDateRange
			    	+"&txtEstatus="+txtEstatus
			    	+"&txtTipEjec="+txtTipEjec
			    	).load().on( 'draw.dt', function (){ 
			    	$.unblockUI();});
			table1.buttons().container().appendTo( '#tblListCRQ_wrapper .col-sm-6:eq(0)' );		  
		}
		
	}

</script>