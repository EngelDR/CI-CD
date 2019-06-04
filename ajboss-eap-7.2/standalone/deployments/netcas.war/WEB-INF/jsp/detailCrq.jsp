<%@ include file="/WEB-INF/include.jsp" %>
<%@page import="mx.com.telcel.oym.netcas.constante.EConstante"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<style>
 			.n-body-content .page-wrapper  
 			{ 
 				background-color: transparent; 
 				border-style: none; 
 				margin:0;
 			} 
			.code{ 
	 			white-space: nowrap;	 			
			}
			.scroll-pane
			{
				width: 100%; 
				height: 360px;
 				overflow: auto; 
			}
			.col-sm-11{
 				padding-right: 0px;
 				padding-left: 3px; 
			}
		</style>
		<!-- start: DYNAMIC TABLE PANEL -->
		<div id="page2" class="container-fluid page-wrapper">
			<div class="row">
				<div class="col-xs-12"  style="padding-right: 0px; padding-left: 0px;">
					<div id="card3" class="col-xs-12 n-card StyloPanel" >
						<div class="row">
							<div class="col-sm-9 panel-heading StyloPanel">
								<h4 class="panel-title"><b id="titleBH4"></b></h4>
							</div>
							<div style="text-align: Right" class="col-sm-3 StyloPanel ">
 								<div id="radioBtn" class="btn-group">
 			    					<a href="${pageContext.request.contextPath}/consultCrq.htm" class="btn btn-primary btn-sm active" data-toggle="executionType" data-title="S3m14ut0m4t1c"><spring:message code="language.tags.0045.01.29"/></a> 
 	    						</div> 
	   						</div>
						</div>
						<div id="divExterno" class="row margen" style="height: 360px; font-family: monospace;" >
							<div id="Panel_Log"  class="scroll-pane code"> 
								<p id=parrafo style="width: 100%">
									<tagtail:tail file="${pathFileLog}" count="10000" id="S">
										<jsp:body>
											<p id=parrafo01>
												${S}<br>
											</p>
											</jsp:body>
									</tagtail:tail>
								</p> 
							</div>
						</div>

					</div>
				</div>			
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-6"  style="padding-right: 0px; padding-left: 0px;">
					<div id="card1" class="col-12 n-card amcharts-main-div">
						<div class="row">
							<div class="col-sm-6">
								<h2 class="n-titles"><b id="titleLogs" style="padding-left: 20px;">Vista de Logs</b></h2>
							</div>
						</div>
						<div id="MiListaLog" class="list-group" style="padding-right: 8px; padding-left: 8px;"></div>
					</div>
				</div>
				<div class="col-xs-12 col-md-6"  style="padding-right: 0px; padding-left: 3px;">
					<div id="card2" class="col-12 n-card amcharts-main-div  scroll-pane code">
						<div class="row">
							<div class="col-sm-9">
								<h2 class="n-titles"><b id="titleDown" style="padding-left: 20px;">Descarga de Archivos</b></h2>
							</div>
							<div style="text-align: center;" class="col-sm-3 n-titles">
 								<div style="padding-right: 8px;">
 			    					<button id="downZip" type="button" style="font-size: 16px; padding-left: 28px;" class="list-group-item list-group-item-action list-group-item-success">Todos     <i class='fa fa-file-zip-o'></i></button>
 	    						</div> 
	   						</div>
						</div>
						<div id="MiListaDown" class="list-group" style="padding-right: 8px; padding-left: 8px;"></div>
					</div>
				</div>
	    	</div>
		</div>
		<!-- end: DYNAMIC TABLE PANEL -->
</tiles:putAttribute>
</tiles:insertDefinition>

<script src="<c:url value="/resources/theme/js/jquery.mousewheel.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.jscrollpane.min.js" />"></script>

<script>
var idCRQ = getParameterByName('idCRQ');

	$(document).ready(function() {
        $.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
        });
			redimensionDelScroll();
			cargaDetalleDeCRQ();
		$.unblockUI();
	});

	function redimensionDelScroll(){
			$('#Panel_Log').scrollTop($('#Panel_Log')[0].scrollHeight);	//Manda hacia abajo la barra derecha del Scroll
			$('.scroll-pane').jScrollPane();				//Funcion que hace la carga de los Scrolls, sus estilos
		var pane = $('.scroll-pane')					//Función que hace que los Scrolls sean rezisables. 
		pane.jScrollPane({
				resizeSensor: true
		});
	}

	$("#MiListaDown").on('click', type="button", function(even){ 
		$('.scroll-pane').jScrollPane();				//Funcion que hace la carga de los Scrolls, sus estilos
		var pane = $('.scroll-pane')					//Función que hace que los Scrolls sean rezisables. 
		pane.jScrollPane({
				resizeSensor: true
		});
		 let idButton = this.id;
		 location.href="${pageContext.request.contextPath}/consult/downloadAttachment?idCRQ="+idCRQ+"&fileName="+document.getElementById(idButton).value+"&All=False";
	}); 

	$("#downZip").on('click', function(){
		location.href="${pageContext.request.contextPath}/consult/downloadAttachment?idCRQ="+idCRQ+"&fileName="+idCRQ+".zip"+"&All=True";
	});

	$("#MiListaLog").on('click', type="button", function(){		 
		 let idButton = this.id;
		 location.href="${pageContext.request.contextPath}/detailCrq.htm?idCRQ="+idCRQ+"&fileName="+document.getElementById(idButton).value; 
		 $("divExterno").load(" #Panel_Log", function(){ 
			redimensionDelScroll();					//Botón que recarga la información haciendo juego con la carga de los Scrolls
		});
	}); 

	function cargaDetalleDeCRQ(){
		$.ajaxSetup({ cache: false });
        $.blockUI({message: '<span class="spinner"/>',
 			css: {border:'none', backgroundColor:'transparent'}
        });
		$.ajax({
			data:{},
			type : 'GET',
			url:"${pageContext.request.contextPath}/consult/getListDetailCrq?idCRQ="+idCRQ,			
			beforeSend : function() { },
			success : function(data) {
				var miListaLog = $("#MiListaLog");
				var miListaDown = $("#MiListaDown");
				$.each(JSON.parse(data), function(key, value) {
			    	if((value.substring(value.lastIndexOf("."))).toLowerCase()==".log"){
						//Si es -1 significa que NO es ImpresosFinales[NETCAS-ImpresosFinalesProcessLog.log] y sera ingresado a un arreglo en caso de que sean más de uno
						miListaLog.append('<button id="'+key+'" type="button" class="list-group-item list-group-item-action list-group-item-success" value="'+value+'">' + value +'</button>');  
					}else{
						miListaDown.append('<button id="'+key+'" type="button" class="list-group-item list-group-item-action list-group-item-success" value="'+value+'">' + value +'</button>');  
					}
				});
				$.unblockUI();
			},
			error : function(xhr) { // if error occured
				alert('<spring:message code="language.tags.0037.35"/>');
				alert(xhr.statusText + xhr.responseText);
			},
			complete : function() {},
		});
	}

	function getParameterByName(name, url) {
	    if (!url) url = window.location.href;
	    name = name.replace(/[\[\]]/g, "\\$&");
	    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
	        results = regex.exec(url);
	    if (!results) return null;
	    if (!results[2]) return '';
	    return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
	
	document.getElementById("titleBH4").innerHTML = idCRQ + ' ==> ' + '${nameFile}'
	
</script>