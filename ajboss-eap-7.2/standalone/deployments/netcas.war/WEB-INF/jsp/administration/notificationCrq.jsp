<%@ include file="/WEB-INF/include.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme/lib/hurkan/style.css" />" />
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div id="page3">
			<h3 class="n-titles">Cierre manual de CRQ's en Remedy</h3>
			<div class="container">
				<form id="formCrqExcecution">
					<div class="form-group" >
						<div></div>	<label  >Adjuntar logs: </label><div></div>	
						<div data-toggle="hurkanSwitch">
							<input data-on-color="green" data-off-title="NO" data-on-title="SI" type="checkbox" name="uploadFile">
						</div>
						<br><br>				
						<div></div><label  for="crqTextArea">Crq's a cerrar: </label>					
						<div id="listCrqs" class="n-crq-list"></div>
						<textarea class="n-crq-text" rows="5" id="crqTextArea"></textarea>
						<label id="labelMsg"></label>
						<div class="float-left"><input type="submit" value='Enviar' class="btn btn-primary" ></div>
					</div>
				</form>
			</div>
		</div>		
	</tiles:putAttribute>
</tiles:insertDefinition>
<script	src="<c:url value="/resources/theme/lib/hurkan/hurkanSwitch.js" />"></script>
<script>
	var radioGroup = $("#idBCExcecution");
	var arrayTipes;
	var crqType;
	
	$(document).ready(function (){
		$('[data-toggle="hurkanSwitch"]').hurkanSwitch({
			'width':60
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
			if($(".n-crq-list > button").length==10){
				message = '<spring:message code="language.tags.0045.02.09"/>';
			}else if(isInList){
				message = '<spring:message code="language.tags.0045.02.10"/>' + ': <b> ' + crqName + '</b>';
			}else if (!existCrq(crqName)) {
				bootbox.confirm({
					message:"El " + crqName + ", NO se encuentra en la base de datos de NETCAS.</br> ¿Seguro que desea cerrarlo?  ",
					size : 'small',
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
						if (result) {
							$("#crqTextArea").css("color", "black").val("");
							$("#listCrqs").append("<button title='quitar' onclick = 'this.remove()'>" + crqName + "<i class='fa fa-remove'><i/>" + "</button>");							
						}else{
							addMessage('<spring:message code="language.tags.0045.02.19"/>' + ': <b> ' + crqName + '</b>');
						}
					}
				});			
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
		var path = '${pageContext.request.contextPath}/process/testClose/';
		var uploadLog = $('[name="uploadFile"]')[0].checked;
		console.log("valor" + uploadLog);
		var crq;
		var url;		
		sendCrqsWithParams($(".n-crq-list > button"), 0,path, uploadLog);		
	}
	
	function sendCrqsWithParams(crqs, index,path, uploadLog){
		if(index >= crqs.length){
			return;
		}
		crq = crqs[index].innerText;
		$.blockUI({
			baseZ: 2000,
			message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
		});	
		$.ajax({
		    type: "GET",
		    url:  path + crq +"?uploadLog="+uploadLog,
		    success: function(data){
		    	if(data){
		    		toastr.success(crq + ' CERRADO EXITOSAMENTE.');
		    	}else{
		    		toastr.error(crq + ' ERROR EN CIERRE.');
		    	}		    	
		    	$.unblockUI();
		    	sendCrqsWithParams(crqs, index+1, path, uploadLog);
		    },
		    error: function(xhr) {
		    	toastr.error(crq + ' ERROR EN CIERRE.');
		    	$.unblockUI();
		    	sendCrqsWithParams(crqs, index+1, path, uploadLog);
		    }
		});	
		
	}
	function existCrq(crq){
		result = false;
		$.ajax({
			async: false,
		    type: "GET",
		    url: '${pageContext.request.contextPath}/consult/validateCrq/'+crq, 
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

</script>