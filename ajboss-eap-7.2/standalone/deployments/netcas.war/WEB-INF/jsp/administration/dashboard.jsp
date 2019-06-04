<%@ include file="/WEB-INF/include.jsp"%>
		
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
				height: 600px;
 				overflow: auto; 
			}
 			.col-sm-11{
 				padding-right: 0px; 
 				padding-left: 3px; 
 			}
		</style>
		<div id="page1" class="container-fluid page-wrapper">
			<div class="row">
				<div class="col-xs-12" style="padding-right: 0px; padding-left: 0px;">
					<div id="card3" class="col-xs-12 n-card StyloPanel" >
						<div class="row">
							<div class="col-sm-6 panel-heading StyloPanel">
								<h4 class="panel-title"><b><spring:message code="language.tags.0044.01"/></b></h4>
							</div>
							<div style="text-align: Right" class="col-sm-6 StyloPanel ">
 								<div id="radioBtn" class="btn-group">
 			    					<a class="btn btn-primary btn-sm active" data-toggle="executionType" data-title="S3m14ut0m4t1c"><spring:message code="language.tags.0044.02"/></a> 
 	    						</div> 
	   						</div>
						</div>
						<div id="divExterno" class="row margen" style="height: 600px;" >
							<spring:message code="log-netcas.path" var="Lost"/>
							<div id="Panel_Log"  class="scroll-pane code"> 
								<p id=parrafo style="width: 100%">
									<tagtail:tail file="${Lost}" count="1000" id="S">
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
				<div class="col-xs-12 col-md-6" style="padding-right: 0px; padding-left: 0px;">
					<div id="card1" class="col-12 n-card amcharts-main-div" style="position: relative; width: 100%; height: 0%;"></div>
				</div>
				<div class="col-xs-12 col-md-6" style="padding-right: 0px; padding-left: 3px;">
					<div id="card2" class="col-12 n-card"></div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>

<script src="<c:url value="/resources/theme/js/jquery.mousewheel.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.jscrollpane.min.js" />"></script>
<script>
	$(document).ready(function() {		
		getChartDataCrqByProcess();
		getChartDataCrqByType();		
		redimensionDelScroll();		
	});

 	$('#radioBtn')
 		.bind("click", function(){ 
 			$("#divExterno").load(" #Panel_Log", function(){ 
 				redimensionDelScroll();					//Botón que recarga la información haciendo juego con la carga de los Scrolls
 			});
 		});
	
	function redimensionDelScroll(){
 		$('#Panel_Log').scrollTop($('#Panel_Log')[0].scrollHeight);	//Manda hacia abajo la barra derecha del Scroll
 		$('.scroll-pane').jScrollPane();				//Funcion que hace la carga de los Scrolls, sus estilos
		var pane = $('.scroll-pane')					//Función que hace que los Scrolls sean rezisables. 
		pane.jScrollPane({
 			resizeSensor: true
		});
	}
	
 	setInterval(cargaPanyScroll,60000);					//Cada Minuto hace la carga en forma automatica.!
    
	function cargaPanyScroll(){
		 $("#divExterno").load(" #Panel_Log", function(){
	 			redimensionDelScroll();
		});
	}

	//Obtiene json con datos de los diferentes crq's a graficar 
	function getChartDataCrqByProcess() {
		var jsonResult;
		$.ajax({
			url : '${pageContext.request.contextPath}/consult/getJSONCountCrqByProcess',
			type : 'GET',
			success : function(data) {
				$.each(data, function(index, value) {
					value.color = '#' + Math.floor(Math.random() * 16777215).toString(16);
					data[index] = value;
				})
				chartConfig1(data);
				$.unblockUI();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$.unblockUI();
			}
		});
		return jsonResult;
	}

	//Creacion de la grafica 2		
	function getChartDataCrqByType() {
		var jsonResult;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : "${pageContext.request.contextPath}/consult/getJSONCountTcrqByType",
			success : function(result) {
				$.each(result, function(index, value) {
					value.color = '#' + Math.floor(Math.random() * 16777215).toString(16);
					result[index] = value;
				})
				chartConfig2(result);
				$.unblockUI();
			},
			error : function(xhr) { // if error occured
				$.unblockUI();
			},
		});
		return jsonResult;
	}

	//Configuración de la grafica 1: 
	function chartConfig1(dataprovider) {
		var chart = AmCharts.makeChart("card1", {
			"type" : "pie",
			"titles" : [ {
				"text" : '<spring:message code="language.tags.0044.03"/>',
				"size" : 16,
				"color" : "#2c3e50",
				"font-size" : "2em",
				"font-weight" : "bold"
			} ],
			"theme" : "none",
			"innerRadius" : "30%",
			"labelRadius": 0,
			"gradientRatio" : [ -0.4, -0.4, -0.4, -0.4, -0.4, -0.4, 0, 0.1,	0.2, 0.1, 0, -0.2, -0.5 ],
			"dataProvider" : dataprovider,
			"balloonText" : "[[value]]",
			"valueField" : "valor",
			"titleField" : "nombre",
			"colorField" : "color",
			"balloon" : {
				"drop" : true,
				"adjustBorderColor" : false,
				"fontSize" : 12
			},
			"legend" : {
				"enabled" : true,
				"align" : "center",
				"markerType" : "circle"
			},
			"export" : {
				"enabled" : true,
				"menu" : [ {
					"class" : "export-main",
					"menu" : [ {
						"label" : '<spring:message code="language.tags.0044.04"/>',
						"menu" : [ "PNG", "JPG", "CSV" ]
					} ]
				} ]
			}
		});
	}

	//Configuración de la grafica 2
	function chartConfig2(dataprovider) {
		var chart = AmCharts.makeChart("card2", {
			"type" : "serial",
			"titles" : [ {
				"text" : '<spring:message code="language.tags.0044.08"/>',
				"size" : 16,
				"color" : "#2c3e50",
				"font-size" : "2em",
				"font-weight" : "bold"
			} ],
			"dataProvider" : dataprovider,
			"startDuration" : 2,
			"valueAxes" : [ {
				"position" : "left",
				"axisAlpha" : 0,
				"gridAlpha" : 0
			} ],
			"graphs" : [ {
				"balloonText" : "[[category]]: <b>[[Cantidad]]</b>",
				"colorField" : "color",
				"fillAlphas" : 10.85,
				"lineAlpha" : 0.1,
				"type" : "column",
				"topRadius" : .50,
				"valueField" : "Cantidad"
			} ],
			"depth3D" : 60,
			"angle" : 10,
			"chartCursor" : {
				"categoryBalloonEnabled" : false,
				"cursorAlpha" : 0,
				"zoomable" : false
			},
			"categoryField" : "Nombre",
			"categoryAxis" : {
				"gridPosition" : "start",
				"axisAlpha" : 0,
				"gridAlpha" : 0

			},
			"balloon" : {
				"drop" : true,
				"adjustBorderColor" : false,
				"fontSize" : 12
			},
			"export" : {
				"enabled" : true,
				"menu" : [ {
					"class" : "export-main",
					"menu" : [ {
						"label" : '<spring:message code="language.tags.0044.04"/>',
						"menu" : [ "PNG", "JPG", "CSV" ]
					} ]
				} ]
			}
		});
	}
</script>

