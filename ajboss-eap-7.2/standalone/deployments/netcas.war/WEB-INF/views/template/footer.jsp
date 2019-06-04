<%@ include file="/WEB-INF/include.jsp"%>
</div>
</div>
</div>
<footer class="container-fluid">
	<p>
		<spring:message code="view.foot.template" />
	</p>
</footer>

<script	src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrap.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/data-tables-1.10.16/js/jquery.dataTables.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/data-tables-1.10.16/js/dataTables.bootstrap.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/js/dataTables.buttons.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/js/buttons.bootstrap.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/js-zip-2.5.0/jszip.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/pdfmake-0.1.32/pdfmake.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/pdfmake-0.1.32/vfs_fonts.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/js/buttons.html5.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/js/buttons.print.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/buttons-1.5.1/js/buttons.colVis.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-tables/data-tables-1.10.16/js/dataTables.select.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootstrap-switch.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/bootstrap-3.3.7/js/bootbox.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/toastr/toastr.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/jquery-3.3.1/jquery.blockUI.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/chosen/chosen.jquery.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-range-picker/js/moment.min.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/data-range-picker/js/daterangepicker.js" />"></script>

<!-- Amcharts Gráfica -->
<script	src="<c:url value="/resources/theme/lib/amcharts/amcharts.js" />"></script>
<script src="<c:url value="/resources/theme/lib/amcharts/pie.js" />"></script>
<script src="<c:url value="/resources/theme/lib/amcharts/serial.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/amcharts/plugins/export/export.min.js" />"></script>
<link href="<c:url value="/resources/theme/lib/amcharts/plugins/export/export.css" />" rel="stylesheet" media="screen">
<script	src="<c:url value="/resources/theme/lib/amcharts/themes/light.js" />"></script>
<script	src="<c:url value="/resources/theme/lib/amcharts/themes/black.js" />"></script>
<script src="<c:url value="/resources/theme/js/application.js" />"></script>
<script src="<c:url value="/resources/theme/lib/tail.select-master/js/tail.select.min.js" />"></script>
<script src="<c:url value="/resources/theme/lib/tail.select-master/langs/tail.select-all.js" />"></script>

<!-- File Validations JS -->
<script src="<c:url value="/resources/theme/system/validations.js" />"></script>
<script>
	$(document).ready(function (){
    	document.oncontextmenu = function(){return false;}
    });

	$(function() {
	    $('.chosen-select').chosen();
	//     $('.chosen-select-deselect').chosen({ allow_single_deselect: true });
	  });
	
	
	$("#form-editUserProfile").submit(function(e) {
		e.preventDefault();
		
		var idUser			= ${sessionScope.tUsuario.id};
		var nombre 			= $("#nombreSession")			.val();
		var apellidoP 		= $("#apellidoPSession")		.val();
		var apellidoM		= $("#apellidoMSession")		.val();
		var user 			= $("#userSession")				.val();
		var correo 			= $("#correoSession")			.val();
		var celular 		= $("#telSession")				.val();
		var status 			= ${sessionScope.tUsuario.id_cestatus};
// 		var password 		= $("#passSession")				.val();
		var selectProfile 	= ${sessionScope.tUsuario.id_cperfil};
		
		var poUserChanges = {
				id : idUser,
				nombre : nombre, 
				a_paterno : apellidoP,
				a_materno : apellidoM,
				usuario : user,
				correo : correo, 
				telefono : celular,
				id_cestatus : status, 
// 				contrasena : password, 
				id_cperfil : selectProfile,
				};		
		
		var sMessage = '<spring:message code="language.tags.0028.14"/>';
	    var sUrl = '${pageContext.request.contextPath}/profile/update';
	    var sSuccess = '<spring:message code="language.tags.0028.15"/>';
	    var sWarning = '<spring:message code="language.tags.0028.16"/>';
	    var sError = '<spring:message code="language.tags.0028.17"/>';
		
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
			           	data: poUserChanges,
			           	timeout: 15000,
						success: function (json) {	     
				      		var respuesta = json;
			    	   		if(respuesta == 1){
			       				toastr.success(sSuccess);
			       				if($("#tblUser").length>0){
			       					gsTable.DataTable().ajax.reload();
			       				}
			       				$("#userProfileName strong").text((nombre + " " + apellidoP + " " + apellidoM).toUpperCase());
			                    $("#modalEditProfile").modal('hide');
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
								toastr.error(textStatus +' <spring:message code="language.tags.0029.18"/>');
							}
						}
					});
				} else {
					$.unblockUI();
				}
			}
		});
		
	});

	function activaTab(tab){
		$('.nav-tabs a[href="#' + tab + '"]').tab('show');
		$("#msj2").html("");
		$("#msj1").html("");	
		$("#password1").prop("disabled", false);
		$("#password2").prop("disabled", false);
	};
	
	function getUserProfile() {
		activaTab("form1");
		$.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/profile/load",
			success : function(data) {
				if (data != true) {
					$("#nombreSession")			.val(data.nombre);
					$("#apellidoPSession")		.val(data.a_paterno);
					$("#apellidoMSession")		.val(data.a_materno);
					$("#userSession")			.val(data.usuario);
					$("#correoSession")			.val(data.correo);
					$("#telSession")			.val(data.telefono);
// 					$("#passSession")			.val(data.contrasena); 
					$("#passBeforeSession")		.val(data.contrasena); // agregar value password in input 
					$("#password1")		.val(""); // agregar value password in input 
					$("#password2")	.val(""); // agregar value password in input 
	                $("#modalEditProfile")		.modal('show');
	                
	            }
				$.unblockUI();
			},
			error: function(jqXHR, textStatus, errorThrown) {   
				$.unblockUI();
				if(textStatus === "timeout") {
					toastr.error('<spring:message code="language.tags.0029.17"/>');  
				} else {
					toastr.error('<spring:message code="language.tags.0028.18"/>');
				}
			}			
		});
    }

	var Role = 'AdminCor';
	function getDataCParameters() {
		gsTable = $('#tblParameters');
		
		$.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		$('#tblParameters').DataTable({
			"columns" : [	 
							 {className : "dt-body-center","width" : "30%", orderable : false},
	    		             {className : "dt-body-center","width" : "60%", orderable : false},
	    		             {className : "dt-body-center","width" : "10%", orderable : false},
	    		        ],
	    		"order" : false,
	    		"bAutoWidth" : false,
				"info" : false,
				"retrieve" : true,
				"bFilter" : true,
				"bLengthChange" : false,
				"oLanguage" : {
					"oPaginate" : {
						"sPrevious" : "<i class='fa fa-arrow-left'></i>",
						"sNext" : "<i class='fa fa-arrow-right'></i>"
					},
					"sLoadingRecords" : '<spring:message code="language.tags.0029.20"/>',
					"sEmptyTable" : '<spring:message code="language.tags.0029.21"/>',
					"sSearch" : '<spring:message code="language.tags.0029.12"/>',
					"sLengthMenu": '<spring:message code="language.tags.0029.22"/>',
				}
	    }).ajax.url('${pageContext.request.contextPath}/parameters/getAll?Role='+Role).load().on( 'draw.dt', function (){ $.unblockUI();});
		$("#modalParameters").modal('show');
	};
	
    function editParameters(pidParameter) {
    	if (pidParameter !== '') {
            var sUrl;
                sUrl = "${pageContext.request.contextPath}/parameters/getOne?pidParameter=" + pidParameter;
            
            $.blockUI({message: '<span class="spinner"/>',
     			css: {border:'none', backgroundColor:'transparent'}
            });
            $.ajax({
                type : "POST",
                url : sUrl,
                success : function(data) {
                    if (data != true) {
							$("#idParameter")				.val(data.id);
							$("#NombreParameter")			.val(data.nombre);
							$("#ValorParameter")			.val(data.valor);
							$("#modalEditParametros")		.modal('show');
                    }
                    $.unblockUI();
                }
            });
        } else {
            toastr.error('<spring:message code="language.tags.0029.19"/>');
        }
    }
    
	$("#modalEditParametros").submit(function(e) {
		e.preventDefault();

        var sMessage, sSuccess, sWarning, sError, sErrorError, sUrl, dData;
		var idParameter 		= $("#idParameter")			.val();
		var nombreParameter 	= $("#NombreParameter")		.val();
		var valorParameter	 	= $("#ValorParameter")		.val();
        
		sMessage 	= '<spring:message code="language.tags.0029.09"/>';
		sUrl 		= '${pageContext.request.contextPath}/parameters/update';
		dData 		= {id:idParameter, nombre:nombreParameter, valor:valorParameter};
		sSuccess 	= '<spring:message code="language.tags.0029.13"/> ';
		sWarning 	= '<spring:message code="language.tags.0029.14"/>';
		sError 		= '<spring:message code="language.tags.0029.15"/>';
		sErrorError = '<spring:message code="language.tags.0029.16"/> ';

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
			       				$("#modalEditParametros").modal('hide');
			       				gsTable.DataTable().ajax.reload();
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
								toastr.error(sErrorError +'<spring:message code="language.tags.0029.18"/>');
							}
						}
					});
				} else {
					$.unblockUI();
				}
			}
		});	 
   
	});
    
	</script>
</body>

</html>