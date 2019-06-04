<%@ include file="/WEB-INF/include.jsp"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div id="page2">
			<h3 class="n-titles"><spring:message code="language.tags.0045.02.01"/></h3>
			<div class="container">
				<form >
					<div class="row">						
						<div class="form-group">
							<div class="col-lg-6 col-md-6 col-sm-11 required">
								<label for="selectCrqType" class="control-label"><spring:message code="language.tags.0045.02.04"/></label>
							 	<select  id="selectCrqType"  name="selectCrqType" data-placeholder='<spring:message code="language.tags.0045.02.05"/>' class="form-control chosen-select" ></select>	
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<label class="control-label"></label>
								<div id = "idBCExcecution" hidden="hidden" >
									<label class="radio-inline">
								      <input type="radio" name="radioBC" checked value="TODO"><spring:message code="language.tags.0045.02.06"/>
								    </label>
								    <label class="radio-inline">
								      <input type="radio" name="radioBC" onclick = "loadModalSelectNodes()" value="NACIONAL"><spring:message code="language.tags.0045.02.07"/>
								    </label>
								    <label class="radio-inline">
								      <input type="radio" name="radioBC" value="LOCAL"><spring:message code="language.tags.0045.02.03"/>
								    </label>
								</div>										
							</div>
						</div>
					</div>
				</form>
				<form id="formCrqExcecution">
					<div class="form-group" >
						<br>						
						<label  for="crqTextArea"><spring:message code="language.tags.0045.02.08"/></label>					
						<div id="listCrqs" class="n-crq-list"></div>
						<textarea class="n-crq-text" rows="5" id="crqTextArea"></textarea>
						<label id="labelMsg"></label>
						<div class="float-left"><input type="submit" value='<spring:message code="language.tags.0045.02"/>' class="btn btn-primary" ></div>
					</div>
				</form>
			</div>
		</div>	
		
		<!--  start: MODAL -->
		<div class="modal fade" id="modalNewCrq" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<a href="" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></a>
						<h4 class="modal-title" id="allTitle">Sitios.</h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-white">			
							<div class="container" style="width: 100%">
							    <div  class="form-group">
									<!-- ###Seleccionar NODOS -->
									<label class="control-label">En que sitios quiere ejecutar el CRQ:</label>
									<div>
										<label class="radio-inline">
									      <input type="radio" name="executionType" value="ALL" onclick="onChangeExecutionType(1);" > Todos</label>
									    <label class="radio-inline">
									      <input type="radio" name="executionType" onclick="onChangeExecutionType(2);" >Solo en algunos</label>
									</div>	
									<div class="n-input-group select-nodes">
										<label class="control-label">Seleccione los sitios donde desea ejecutar los CRQ's:</label>
										<select disabled id="selectNodes"  class="select mdb-select md-form" multiple data-placeholder='Seleccione sitios ...'></select><br>
									</div>
									<br />																	
									<div id="finishControl" align="center">
										<button class="btn btn-secondary" hidden="hidden" id="acceptCreationCrq" onclick ="acceptSelection()">Aceptar</button>
								    </div>
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
<script>

	var selectCrqType = $("#selectCrqType");
	var radioGroup = $("#idBCExcecution");
	var arrayTipes;
	var crqType;
	var selectNodesInstance;
	
	$(document).ready(function (){
		loadSelectByAjax(selectCrqType);
		selectCrqType.on('change', function() {			
			crqType = this.value;
			if(crqType == 3){
				radioGroup.show();
			}else{
				radioGroup.hide();
			}
    	});	
	})
	
	var countKeyUp = 0;
	$("#crqTextArea").keydown(function (event) {
		$("#labelMsg").removeClass("parpadea");
		if (event.which == 13) {
			event.preventDefault();
			$("#labelMsg").html("");
			countKeyUp = 0;
			var crqName = $("#crqTextArea").val().toUpperCase();
			$.each(crqName.match(/\w+/g), function(index, value){
				addMessage(addCrq(value));
			});
												
		}else if(event.which == 38){
			event.preventDefault();
			var list = $(".n-crq-list > button");
			if(list.length>0 && countKeyUp>=0 && countKeyUp <list.length){
				countKeyUp++;				
				$("#crqTextArea").val(list[list.length -countKeyUp ].innerText);
			}else if(list.length == 0){
				$("#crqTextArea").val("CRQ000000000000");
			}
		}else if(event.which == 40){
			event.preventDefault();
			var list = $(".n-crq-list > button");
			if(list.length>0 && countKeyUp>1 && countKeyUp <=list.length){
				countKeyUp--;
				$("#crqTextArea").val(list[list.length -countKeyUp ].innerText);
			}
		}
		
	});
	
	function addCrq(crqName){
		var message ="";
		var crqRegex = new RegExp(/^CRQ\d{12}$/);
		if (crqRegex.test(crqName)) {			
			var isInList;
			$.each($(".n-crq-list > button"), function(index, value){
				if(value.innerText == crqName){
					isInList = true
				}
			});
			if(!crqType){
				addMessage('<spring:message code="language.tags.0045.02.13"/>');
			}else if($(".n-crq-list > button").length==10){
				message = '<spring:message code="language.tags.0045.02.09"/>';
			}else if(isInList){
				message = '<spring:message code="language.tags.0045.02.10"/>' + ': <b> ' + crqName + '</b>';
			}else if (!existCrq(crqName, crqType)) {
				message = '<spring:message code="language.tags.0045.02.19"/>' + ': <b> ' + crqName + '</b>';
			}else{
				$("#crqTextArea").css("color", "black").val("");
				$("#listCrqs").append("<button title='quitar' onclick = 'this.remove()'>" + crqName + "<i class='fa fa-remove'><i/>" + "</button>");
			}				
		} else {
			message = '<spring:message code="language.tags.0045.02.11"/>' + ': <b> ' + crqName + '</b>';
		}
		
		return message;
	}
	
	$("#formCrqExcecution").submit(function(e){
		e.preventDefault();
		if($(".n-crq-list > button").length==0){
			addMessage('<spring:message code="language.tags.0045.02.12"/>');
		}else {
			addMessage("");
			bootbox.confirm({
				message : '<spring:message code="language.tags.0045.02.14"/>',
				size : 'small',
				buttons : {
					cancel : {
						label : '<spring:message code="language.tags.0014"/>',
						className : 'btn btn-secondary'
					},
					confirm : {
						label : '<spring:message code="language.tags.0023"/>',
						className : 'btn btn-primary'
					}
				},
				callback : function(result) {
					if (result)
						sendCrqs();
				}
			});
		}
		
		
	});
	
	function addMessage(message){
		if(message){
			$("#crqTextArea").css("color", "red");				
			$("#labelMsg").addClass("parpadea");
		}
		$("#labelMsg").html($("#labelMsg").html() + message + '<br>');		
	}
	
	function sendCrqs() {		
		var url = '${pageContext.request.contextPath}/process/semiautomaticProcess';
		var crqs ="";
		var crqBcExecution = "";
		var nodes = "";
		 
		if(crqType == 3){
			crqBcExecution = $('input[name=radioBC]:checked', '#idBCExcecution').val();
			if(crqBcExecution == "NACIONAL"){
				nodes = getSelectedNodes();
			}else{
				nodes = getNodesByType(crqType);
			}
		}
		
		$.each($(".n-crq-list > button"), function (index, value) {
			var crq = value.innerText;
			if(index != 0){
				crq = "," + value.innerText;
			}
			crqs +=crq;
		});		
		var txtSelected = $("#selectCrqType option:selected").text();
		url = url +"?crqs="+crqs+"&crqType="+crqType+"&crqBcExecution="+crqBcExecution+"&nodes="+ nodes+"&txtSelected="+txtSelected;
		
		$.blockUI({
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});
		
		$.ajax({
		    type: "GET",
		    url: url,
		    success: function(data){
		    	if(data){
		    		toastr.success('<spring:message code="language.tags.0045.02.15"/>');
		    	}else{
		    		toastr.error('<spring:message code="language.tags.0045.02.16"/>');
		    	}
		    	$.unblockUI();
		    },
		    error: function(xhr) {
		    	toastr.error('<spring:message code="language.tags.0045.02.17"/>');
		    	$.unblockUI();
		    }
		});		
	}

	function loadSelectByAjax(select){
		select.find('option').remove().end();    	
		select.prop("disabled", false);
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/consult/getJSONListC01Tipo', 
		    dataType: "json",
		    success: function(data){
		    	arrayTipes = data;
		    	select.append($("<option />").val('').text('<spring:message code="language.tags.0045.02.18"/>'));
		      	$.each(data,function(key, registro) {
		    	  select.append( '<option value="'+registro.id+'">'+registro.nombre + " " + registro.descripcion+'</option>' );
		      	}); 
		      select.trigger('chosen:updated');
		    },
		    error: function(xhr) {
		    	alert(xhr.statusText + xhr.responseText);
		    }
		});
	}
	
	function existCrq(crq, type){
		result = false;
		$.ajax({
			async: false,
		    type: "GET",
		    url: '${pageContext.request.contextPath}/consult/validateCrq/'+crq+'/'+type, 
		    dataType: "json",
		    success: function(data){
		    	result = data;
		    },
		    error: function(xhr) {
		    	alert(xhr.statusText + xhr.responseText);
		    }
		});
		return result;
	}
	
	function loadModalSelectNodes(){
		$('input[value="ALL"]').prop("checked",true);
		$("#modalNewCrq").modal('show');
		loadSelectNodes();
	}	
	function acceptSelection(){
		$("#modalNewCrq").modal('hide');
	}
	function onChangeExecutionType(type){
		if(type==1){
			selectNodesInstance.config("disabled", true);
		}else if (2){
			selectNodesInstance.config("disabled", false);
		}
	}
	function loadSelectNodes(){
		$("#selectNodes").find('option').remove().end();
		var select = $("#selectNodes");
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/ri/process/consult/nodes/' + crqType, 
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
	
	function getNodesByType(crqType){
		var nodeIds = "-1";
		$.ajax({
		    type: "GET",
		    url: '${pageContext.request.contextPath}/ri/process/consult/nodes/' + crqType, 
		    dataType: "json",
		    async: false,
		    success: function(data){
		      	$.each(data,function(key, nodo) {
		      		nodeIds += ","+nodo.id;
		      	});
		    },
		    error: function(xhr) {
		    	alert(xhr.statusText + xhr.responseText);
		    }
		});
		return nodeIds.substring(3);
	}
	
	function aplyTail(select){
		var instance = tail.select(select[0],{
			placeholder: null,
			search: true,
			disabled: true,
			locale: 'es',
		});
		return instance;
	}
	
	function getSelectedNodes(){
		var all = $('input[name=executionType]:checked').val()=="ALL";
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

</script>