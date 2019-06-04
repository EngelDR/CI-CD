<%@ include file="/WEB-INF/include.jsp"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
	<style>
		.n-body-content .page-wrapper {
		background-color: transparent;
		border-style: none;
		}
	</style>
	<div id="page1" class="container-fluid">
		<div class="container">
			<div class="row">
		      <div class="col-lg-3">
		        <div class="panel panel-info">
		          <div class="panel-heading">
		            <div class="row">
		              <div class="col-xs-6">
		                <i class="fa fa-assistive-listening-systems fa-5x"></i>
		              </div>
		              <div class="col-xs-6 text-right">
		                <p class="announcement-heading"></p>
		                <p class="announcement-text"><spring:message code="language.tags.0044.09"/></p>
		              </div>
		            </div>
		          </div>
<!-- 		          <a href="#" onclick='newCrqVLR()'> -->
		            <div class="panel-footer announcement-bottom">
		              <div class="row">
		                <div class="col-xs-6">
		                  <spring:message code="language.tags.0044.13"/>
		                </div>
		                <div class="col-xs-6 text-right">
		                  <i class="fa fa-arrow-circle-right"></i>
		                </div>
		              </div>
		            </div>
<!-- 		          </a> -->
		        </div>
		      </div>
		      <div class="col-lg-3">
		        <div class="panel panel-warning">
		          <div class="panel-heading">
		            <div class="row">
		              <div class="col-xs-6">
		                <i class="fa fa-database fa-5x"></i>
		              </div>
		              <div class="col-xs-6 text-right">
		                <p class="announcement-heading"></p>
		                <p class="announcement-text"><spring:message code="language.tags.0044.10"/></p>
		              </div>
		            </div>
		          </div>
		          <a href="#" onclick='newCrqImsiHss()'>
		            <div class="panel-footer announcement-bottom">
		              <div class="row">
		                <div class="col-xs-6">
		                  <spring:message code="language.tags.0044.13"/>
		                </div>
		                <div class="col-xs-6 text-right">
		                  <i class="fa fa-arrow-circle-right"></i>
		                </div>
		              </div>
		            </div>
		          </a>
		        </div>
		      </div>
		      <div class="col-lg-3">
		        <div class="panel panel-success">
		          <div class="panel-heading">
		            <div class="row">
		              <div class="col-xs-6">
		                <i class="fa fa-server fa-5x"></i>
		              </div>
		              <div class="col-xs-6 text-right">
		                <p class="announcement-heading"></p>
		                <p class="announcement-text"><spring:message code="language.tags.0044.11"/></p>
		              </div>
		            </div>
		          </div>
		          <a href="#" onclick="newCrqImsiMsc()">
		            <div class="panel-footer announcement-bottom">
		              <div class="row">
		                <div class="col-xs-6">
		                  <spring:message code="language.tags.0044.13"/>
		                </div>
		                <div class="col-xs-6 text-right">
		                  <i class="fa fa-arrow-circle-right"></i>
		                </div>
		              </div>
		            </div>
		          </a>
		        </div>
		      </div>
		      <div class="col-lg-3">
		        <div class="panel panel-danger">
		          <div class="panel-heading">
		            <div class="row">
		              <div class="col-xs-6">
		                <i class="fa fa-users fa-5x"></i>
		              </div>
		              <div class="col-xs-6 text-right">
		                <p class="announcement-heading"></p>
		                <p class="announcement-text"><spring:message code="language.tags.0044.12"/></p>
		              </div>
		            </div>
		          </div>
<!-- 		          <a href="#" onclick='newCrqExample()'> -->
		            <div class="panel-footer announcement-bottom">
		              <div class="row">
		                <div class="col-xs-6">
		                  <spring:message code="language.tags.0044.13"/>
		                </div>
		                <div class="col-xs-6 text-right">
		                  <i class="fa fa-arrow-circle-right"></i>
		                </div>
		              </div>
		            </div>
<!-- 		          </a> -->
		        </div>
		      </div>		      
		    </div><!-- /.row -->
	    </div>
		<div class="row"></div>
		<div class="row"></div>
	</div>

<!--  <form class="formProtocols" id="formProtocols" method="POST" action="upload" enctype="multipart/form-data" >File: -->
<!--     <input type="file" name="file" id="file" /> <br/>Destination: -->
<!--     <input type="text" value="/tmp" name="destination"/> -->
<!--     </br> -->
<!--     <input type="submit" value="Upload" name="upload" id="upload" /> -->
<!-- </form> -->

		<!--  start: MODAL -->
		<div class="modal fade" id="modalNewCrq" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitle"></h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-white">
							<br />				
							<div class="container" style="width: 100%">
						    <!-- File Upload From -->
							    <form  class="form-group" id="formUpload" action="fileUpload" method="post" enctype="multipart/form-data" onkeypress="return event.keyCode != 13;">
									
									<!-- ###Alta de VLR en HLR parametros -->
									<div class="n-input-group vlr" >
										<label class="control-label"><spring:message code="language.tags.0044.14"/>:</label>
										<input id = "inVlr" name="vlr" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.14"/>'  maxlength="10" pattern="\d*" oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.14"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									
									<!-- ###Alta de imsis en hss parametros-->
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.15"/>:</label>
										<input id ="vplmn"  name="vplmn" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.15"/>' oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.15"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.16"/>:</label>
										<input id ="apn" name="apn" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.16"/>' oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.16"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.17"/>:</label>
										<input id ="realm" name="realm" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.17"/>' oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.17"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.18"/>:</label>
										<input id ="mcc" name="mcc" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.18"/>' pattern="\d*" oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.18"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.19"/>:</label>
										<input id ="mnc" name="mnc" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.19"/>' pattern="\d*" oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.19"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>									
									<div class="n-input-group imsi-hss">
										<label class="control-label"><spring:message code="language.tags.0044.21"/>:</label>
										<div id = "divRequestTypeHss">
											<label class="radio-inline">
										      <input type="radio"  name="requestType" value="${imsiHss.open}"> <spring:message code="language.tags.0042.01.11"/></label>
										    <label class="radio-inline">
										      <input type="radio" name="requestType" value="${imsiHss.close}"> <spring:message code="language.tags.0042.01.13"/></label>
										</div>
									</div>		
																
									<!-- ###Alta de imsis en Msc parametros-->
									<div class="n-input-group imsi-msc">
										<label class="control-label"><spring:message code="language.tags.0044.24"/>:</label>
										<input name="imsi" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.24"/>' oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.24"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-msc">
										<label class="control-label"><spring:message code="language.tags.0044.21"/>:</label>
										<div id = "divRequestTypeMsc">
											<label class="radio-inline">
										      <input type="radio" name="requestType" value="${imsiMsc.open}" onclick="onChangeRequestType(1);"> <spring:message code="language.tags.0042.01.11"/></label>
										    <label class="radio-inline">
										      <input type="radio" name="requestType" value="${imsiMsc.close}" onclick="onChangeRequestType(0);"> <spring:message code="language.tags.0042.01.13"/></label>
										    <label class="radio-inline">
										      <input type="radio" name="requestType" value="${imsiMsc.redefine}" onclick="onChangeRequestType(1);"><spring:message code="language.tags.0044.25"/></label>
										</div>	
									</div>
									<div class="n-input-group imsi-msc hideable">
										<label class="control-label"><spring:message code="language.tags.0044.26"/>:</label>
										<input name="b" class="form-control" type="text" placeholder = '<spring:message code="language.tags.0044.20"/> <spring:message code="language.tags.0044.27"/>' oninvalid="setCustomValidity('<spring:message code="language.tags.0044.22"/> <spring:message code="language.tags.0044.27"/> <spring:message code="language.tags.0044.23"/>')" oninput="setCustomValidity('')">
									</div>
									<div class="n-input-group imsi-msc hideable">
										<label class="control-label"><spring:message code="language.tags.0044.28"/>:</label>
										<textarea id= "paramsMgi" name="paramsMsi" class="n-crq-text" placeholder='<spring:message code="language.tags.0044.29"/>' rows="5"></textarea>	
									</div>
																		
									<!-- ###Ejemplo Parametros-->
									<div class="n-input-group example">
										<label for="Nombre" class="control-label"><spring:message code="language.tags.0038.03.15"/>:</label>
										<input id = "inActivity" name="actividad"  class="form-control" type="text" placeholder='<spring:message code="language.tags.0044.30"/>' maxlength="10">
									</div>
									<div class="n-input-group example">
										<label for="Nombre" class="control-label"><spring:message code="language.tags.0044.31"/>:</label>
										<input id="inMop01" name="urlDocUsuario" class="form-control"  type="file" name="file">
									</div>				
														
									<!-- Nacional o Individual -->
									<div class="n-input-group execution-type">
										<label class="control-label"><spring:message code="language.tags.0045.01.02"/></label>
										<div id = "divExecutionType">
											<label class="radio-inline">
										      <input type="radio" checked name="executionType" value="${executionType.national}" onclick="onChangeExecutionType(1);"> <spring:message code="language.tags.0044.32"/></label>
										    <label class="radio-inline">
										      <input type="radio" name="executionType" value="${executionType.individual}" onclick="onChangeExecutionType(2);"> <spring:message code="language.tags.0044.33"/></label>
										</div>
									</div>							
									
									<!-- ###Seleccionar NODOS -->
									<div class="n-input-group select-nodes">
										<label class="control-label"><spring:message code="language.tags.0044.34"/>:</label>
										<select disabled id="selectNodes"  class="select mdb-select md-form" multiple data-placeholder='<spring:message code="language.tags.0044.35"/>'></select><br>
									</div>
									<br />	
														
									<!-- Boton crear solicitud -->
									<div align="center"  id="btnCreateCrq">										
										<button class="btn btn-primary" type="submit"><spring:message code="language.tags.0044.36"/></button>
									</div>	
																	
									<!-- Mensage -->
									<div id="alertMsg" style="color: red;font-size: 14px; font-weight:bold;"></div>
							    </form>
							    <div id="finishControl" align="center">
							    	<button class="btn btn-primary" hidden="hidden" id="retryCreationCrq" onclick ="retryCrqCreation()"><spring:message code="language.tags.0044.37"/></button>
									<button class="btn btn-secondary" hidden="hidden" id="cancelCreationCrq" onclick = "cancelCrqCreation()"><spring:message code="language.tags.0014"/></button>
									<button class="btn btn-secondary" hidden="hidden" id="acceptCreationCrq" onclick ="acceptCrqCreation()"><spring:message code="language.tags.0045.01.07"/></button>
							    </div>
							    
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>		
		<!-- end: MODAL -->
	</tiles:putAttribute>
</tiles:insertDefinition>
<script	src="<c:url value="/resources/theme/js/n.textarea.js" />"></script>
<script>
	const Types = {
			VLR : {
				id: 5,
				title: '<spring:message code="language.tags.0044.09"/>',
			},
			IMSI_HSS : {
				id: 6,
				title: '<spring:message code="language.tags.0044.10"/>',
			},
			IMSI_MSC : {
				id: 8,
				title: '<spring:message code="language.tags.0044.11"/>',
			},
			EXAMPLE : {
				id: 20,
				title: '<spring:message code="language.tags.0044.38"/>',
			}
	}	
	var currentCrq;
	var crqType;
	var selectNodesInstance;

	//########## Creación de un nuevo crq de tipo VLR
	function newCrqVLR(){
		crqType = Types.VLR;
		reloadModalNewCrqVlr();	
	}
	function reloadModalNewCrqVlr(){
		cleanForm()
		$('.n-input-group.vlr').show();
		$('.n-input-group.vlr input').prop("required", true);				
		loadSelectNodes();
		$("#modalNewCrq").modal('show');
	}
	function getFormDataVLR(){
		var formData = new FormData($('#formUpload')[0]);
		formData.append("id_c01tipo", crqType.id);
		formData.append("nodeIds", getSelectedNodes());		
		return formData;
	}
	
	//#########Creación de un nuevo crq de tipo IMSI-HSS
	function newCrqImsiHss(){
		crqType = Types.IMSI_HSS;
		reloadModalNewCrqImsiHss();	
	}
	function reloadModalNewCrqImsiHss(){
		cleanForm()		
		$('.n-input-group.imsi-hss').show();
		$('.n-input-group.imsi-hss input').prop("required", true);	
		loadSelectNodes();
		$("#modalNewCrq").modal('show');
	}
	function getFormDataImsiHss(){
		var formData = new FormData($('#formUpload')[0]);
		formData.append("id_c01tipo", crqType.id);
		formData.append("nodeIds", getSelectedNodes());
		return formData;
	}

	//#######Creación de un nuevo crq de tipo IMSI-MSC
	function newCrqImsiMsc(){
		crqType = Types.IMSI_MSC;
		reloadModalNewCrqImsiMsc();	
	}
	nTextArea($("#paramsMgi"));
	function reloadModalNewCrqImsiMsc(){
		cleanForm()
		$('.n-input-group.imsi-msc').show();
		$('.n-input-group.imsi-msc input').prop("required", true);
		loadSelectNodes();
		$("#modalNewCrq").modal('show');
	}
	function getFormDataImsiMsc(){
		var formData = new FormData($('#formUpload')[0]);
		formData.append("id_c01tipo", crqType.id);
		formData.append("nodeIds", getSelectedNodes());
		return formData;
	}
	
	function onChangeRequestType(option){
		if(option == 0){
			$('.n-input-group.hideable input').prop("required", false);
			$('.n-input-group.hideable').hide();
		}else if(option == 1){
			$('.n-input-group.hideable input').prop("required", true);
			$('.n-input-group.hideable').show();
		}
	}
	
	//#########Creación de un nuevo crq de prueba EXAMPLE
	function newCrqExample(){
		crqType = Types.EXAMPLE;
		reloadModalNewCrqExample();	
	}
	function reloadModalNewCrqExample(){
		cleanForm()
		$('.n-input-group.example').show();
		$('.n-input-group.example input').prop("required", true);
		$("#modalNewCrq").modal('show');
	}
	function getFormDataExample(){
		var formData = new FormData($('#formUpload')[0]);
		formData.append("id_c01tipo", crqType.id);		
		return formData;
	}
	
	//#########Limpia el formulario
	function cleanForm(){
		//reestablece configuración		
		$('#formUpload').trigger("reset");	
		$('#formUpload input').prop('disabled',false);
		$('#formUpload input').prop("required", false);		
		$('.n-input-group').hide();
		$('#finishControl button').hide();
		$('#btnCreateCrq').show();
		$('#alertMsg').text('').show();	
		$('#allTitle').text(crqType.title);
	}	
	
	//[ON CREAR SOLITUD]
	$("#formUpload").submit(function(e) {			
		e.preventDefault();	
		var msg;
		var formData;
		var url;
		if(crqType.id == Types.VLR.id){
			url = '${pageContext.request.contextPath}/ri/process/creation/vlr';
			formData = getFormDataVLR();
		}else if(crqType.id == Types.IMSI_HSS.id) {
			url = '${pageContext.request.contextPath}/ri/process/creation/imsi-hss';
			formData = getFormDataImsiHss();
		}else if(crqType.id == Types.IMSI_MSC.id) {
			url = '${pageContext.request.contextPath}/ri/process/creation/imsi-msc';
			formData = getFormDataImsiMsc();
			if((formData.get('requestType')=='${imsiMsc.open}' || formData.get('requestType')=='${imsiMsc.redefine}') && !formData.get('paramsMsi')){
				msg = "No ha definido los parametros a dar de alta."
			}
		}else if(crqType.id == Types.EXAMPLE.id) {
			url = '${pageContext.request.contextPath}/ri/process/creation/example';
			formData = getFormDataExample();
		}
		if(msg == null){
			sendForm(formData, url);
		}else{
			$('#alertMsg').text(msg);
		}
	});
	
	//Envia  los datos del formulario
	function sendForm(formData, url){
		console.log(formData);
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'},
 			baseZ: 2000
		});
		$.ajax({
			url : url,
			type : 'POST',
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success: function(data, status, jqXHR){
				$('#formUpload input').prop('disabled',true);
				currentCrq = data;
				if(jqXHR.status == 200){
					creationSuccess();
				}else if(jqXHR.status == 206){
					creationPartial();
				}			
				$.unblockUI();
			},
			error: function(xhr, desc, err) {
				var message;
				if(xhr.status == 500){
					message = '<spring:message code="language.tags.0047.01.15"/>'
				}else if(xhr.status == 400){
					message = xhr.responseText;
				}
				toastr.error(message);
				$('#alertMsg').text(message);
				$.unblockUI();
		    }
		});
		
	}
	
	//En caso de de una creación exitosa(aceptar)
	function creationSuccess(){
		toastr.success(currentCrq + ' '  + crqType.title +' <spring:message code="language.tags.0047.01.14"/>');
		$('#alertMsg').html(currentCrq + ' </br>'  + crqType.title +' </br><spring:message code="language.tags.0047.01.14"/>');
		$('#btnCreateCrq').hide();
		$("#retryCreationCrq").hide();
		$("#cancelCreationCrq").hide();
		$("#acceptCreationCrq").show();
	}
	
	//En caso de una creación parcial (cancelar, reintentar)
	function creationPartial(){
		$('#alertMsg').text('<spring:message code="language.tags.0044.39"/>');
		$('#btnCreateCrq').hide();
		$("#retryCreationCrq").show();
		$("#cancelCreationCrq").show();
		$("#acceptCreationCrq").hide();
	}
	
	
	//[ON ACEPTAR] cierra el modal (CRQ creado correctamente)
	function acceptCrqCreation(){
		$("#modalNewCrq").modal('hide');
	}
	
	//[ON REINTENTAR] retoma la creación de un CRQ creado PARCIALMENTE
	function retryCrqCreation(){
		if (currentCrq){
			console.log(currentCrq);
			$.blockUI({
				message: '<span class="spinner"/>',
	 			css: {border:'none', backgroundColor:'transparent'},
				baseZ: 2000
			});
			$.ajax({
			    type: "GET",
			    url: '${pageContext.request.contextPath}/ri/process/creation/retry?crq_name='+currentCrq, 
			    dataType: "json",
			    success : function(json) {
					$.unblockUI();
					var respuesta = json;
					if (respuesta == 1) {
						toastr.error('<spring:message code="language.tags.0044.40"/>');
						$('#alertMsg').text('<spring:message code="language.tags.0044.40"/>');
					} else if (respuesta == 2) {
						creationPartial();
					} else if (respuesta == 3) {
						creationSuccess();
					} else {
						toastr.error('<spring:message code="language.tags.0019"/>');
						$('#alertMsg').text('<spring:message code="language.tags.0019"/>');
					}
				},
			    error: function(xhr) {
			    	$.unblockUI();
			    	toastr.error(xhr.statusText + xhr.responseText);			    	
			    }
			});
		}
	}	
	
	//[ON CANCELAR] Cancela la creación de un CRQ (NETCAS: trata de cerrarlo automaticamente)
	function cancelCrqCreation(){
		if (currentCrq){
			closenningCrq = true;
			$.ajax({
			    type: "GET",
			    url: '${pageContext.request.contextPath}/ri/process/creation/cancel', 
			    dataType: "json",
			    success : function(json) {
					console.log(json);
					closenningCrq = false;
				},
			    error: function(xhr) {
			    	console.log(xhr);
			    	closenningCrq = false;
			    }
			});
		}
		$("#modalNewCrq").modal('hide');
	}		
	
	function loadSelectNodes(){
		$('.n-input-group.execution-type').show();
		$('.n-input-group.select-nodes').show();
		$("#selectNodes").find('option').remove().end();
		var select = $("#selectNodes");
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/ri/process/consult/nodes/' + crqType.id, 
		    dataType: "json",
		    success: function(data){
		      	$.each(data,function(key, nodo) {		      		
		    	  select.append( '<option value="'+nodo.id+'">'+nodo.nombre+'</option>' );
		      	}); 
		      	if(selectNodesInstance  == null ){
		      		selectNodesInstance = aplyTail(select);
				}else {
					selectNodesInstance.reload();
				}
		      	selectNodesInstance.config("disabled", true);
		    },
		    error: function(xhr) {
		    	alert(xhr.statusText + xhr.responseText);
		    }
		});
	}
	
	function getSelectedNodes(){
		var all = $('input[name=executionType]:checked').val()=="${executionType.national}";
		var select = $("#selectNodes")[0];
		var nodeIds = "-1";
		for (var i=0; i < select.options.length; i++){
			if(all){
				nodeIds += "," + select.options[i].value;
			}else if(!select.options[i].disabled && select.options[i].selected){
				nodeIds += "," + select.options[i].value;
			}
		}
		return nodeIds.substring(3);
	}
	
	function aplyTail(select){
		var instance = tail.select(select[0],{
			placeholder: null,
			search: true,
			disabled: true,
			locale: '${pageContext.response.locale}',
		});
		return instance;
	}
	
	function onChangeExecutionType(type){
		if(type==1){
			selectNodesInstance.config("disabled", true);
		}else if (2){
			selectNodesInstance.config("disabled", false);
		}
	}	
</script>